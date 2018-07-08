import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput in;

boolean a = false;
int lignenumero = 200;
float [] hauteur1 = new float[lignenumero];
float [] hauteurblanc = new float[lignenumero];
float [] ampleur = new float[lignenumero];
float [] colourR= new float[lignenumero];
float [] colourG= new float[lignenumero];
float [] colourB= new float[lignenumero];
float [] rectX = new float[lignenumero];
float [] dist = new float[lignenumero];
float yPos;
float xPos;
PImage img1;
PImage oiseau;
PImage egon;
int temp = 0;
float vy;
void setup()
{
  img1 = loadImage("pollock un.jpg");
  oiseau = loadImage("oiseau.png");
  egon = loadImage("egon.jpeg");
  size(1000,497);
  minim = new Minim(this);
  in = minim.getLineIn();
  temp += 1;
  xPos = 300;
 

  
  for( int n = 0; n < lignenumero; n++)
  {
    rectX[n] = width;
  }
  for(int i = 0; i < lignenumero; i++)
  {
    hauteur1[i] = random(0,200);
    hauteurblanc[i] = random(120,200);
    ampleur[i] = random(20,50);
    dist[i] = random(160,220);
    colourR[i] = random(0,255);
    colourG[i] = random(0,255);
    colourB[i] = random(0,255);
    if( i == 0 )
    {
      rectX[i] = width + dist[i];
    }
    else{
      rectX[i] = rectX[i-1] + dist[i];
    }
  }
}


void draw()
{
  noStroke();
  background(img1);
  if ( a == true )
  {
    
  
    float soundLevel = in.mix.level();
    vy = 3 - 50*soundLevel;
    yPos = yPos + vy;
    if ( yPos <= 0 )
    {
      yPos = yPos-vy;
    }
    if ( yPos >= height )
    {
      yPos = yPos-vy;
    }
    
  
    
    for (int i = 0; i < lignenumero; i++)
    {
      rectMode(CORNER);
      imageMode(CENTER);
      fill(colourR[i],colourG[i],colourB[i]);
      rect(rectX[i],0,ampleur[i],hauteur1[i]);
      rect(rectX[i],hauteur1[i] + hauteurblanc[1],ampleur[i],height - hauteurblanc[i] - hauteur1[i]);
      temp += 1;
   
      rectX[i] -= 2;
      if ( xPos  >= rectX[i] && xPos <= rectX[i] + ampleur[i] && yPos <= hauteur1[i])
      {
        noLoop();
        
        background(egon);
        textSize(40);
        fill(0,0,0);
        i = i + 1;
        text("FAILED AFTER "+ i ,500,200);
        //if (a)
        //{
        //  redraw();
        //}
      }
      if ( xPos  >= rectX[i] && xPos <= rectX[i] + ampleur[i] && yPos  >= hauteur1[i] + hauteurblanc[i])
      {
        noLoop();
        
        background(egon);
        textSize(40);
        fill(0,0,0);
        i = i + 1;
        text("FAILED AFTER "+ i ,500,200);
      }
    }
    image(oiseau,xPos,yPos,80,56);
  }
}

void keyPressed()
{
  a = true;
}


//class Trees
//{
// PImage item; 
// float hauteur;
// float ampleur;
// Trees(PImage i,float h,float a)
// {
   
//   item=i;
//   hauteur=h;
//   ampleur=a;}
// void update()
// {
//   image(Tree[i])
// }
//}
