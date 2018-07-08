PImage lac;
PImage ocean;
PImage personne1;
PImage personne2;
PImage qqch;
boolean joue =false;
boolean S=false;
boolean A=false;
boolean W=false;
boolean D=false;
int temp=0;
int a=1000000000;



float v1xr=0;
float v1yr=0;

float size1=random(30,80);
float size2=random(30,80);
float size3=random(30,80);
float size4=random(30,80);
void setup(){
  frameRate(40);
  
size(800,600);
lac=loadImage("Lac.jpeg");
ocean=loadImage("ocean.png");
personne1=loadImage("personnedeux.png");
personne2=loadImage("personnetrois.png");
qqch=loadImage("qqch.png");}
void mousePressed(){
joue=true;
println(pxPos,pyPos);}

float pxPos=524;
float pyPos=220;
void draw(){
  imageMode(CENTER);
  
  if(temp<=a){
    temp+=1;
    background(lac);
  }
  
  image(personne2,pxPos,pyPos,60,60);
  if (pxPos>=800){
  pxPos=0;}
 
  if (pxPos<0){
  pxPos=800;}
  if (pyPos<=3){
  pyPos=3;}
  if (pyPos>563){
  pyPos=3;}
  if(temp<=a){
    if (pxPos<=420){
  pyPos+=5;}}
   
if (pyPos>562){
  a=temp;
  temp+=1;}
if (temp>a){
   
  background(ocean);
  
  image(personne2,pxPos,pyPos,60,60);
 
  
    v1x=random(3,8);
    v1y=random(3,8);
  if (move1x>800){
  move1x=0;}
  if(move1x<0){move1x=800;}
  if(move1y<0){move1y=600;}
  if(move1y>600){move1y=0;}
  v1xr=v1x;
  v1yr=v1y;
  move1x+=v1xr;
  move1y+=v1yr;
  image(qqch,move1x,move1y,size1,size1);
  }
 


if (joue){
  imageMode(CENTER);
  image(personne2,pxPos,pyPos,60,60);}
 if(S){
    
   
    pyPos+=2;
    image(personne2,pxPos,pyPos,60,60);
    A=false;
    W=false;
    D=false;}
  if(W){
    
    
    pyPos-=2;
    image(personne2,pxPos,pyPos,60,60);
    A=false;
    S=false;
    D=false;}
  if(A){
    
   
    pxPos-=2;
    image(personne2,pxPos,pyPos,60,60);
    S=false;
    W=false;
    D=false;}
  if(D){
    
    
    pxPos+=2;
    image(personne2,pxPos,pyPos,60,60);
    A=false;
    W=false;
    S=false;}
}
void keyPressed(){
  if(key=='s'){
  S=true;
  A=false;
  W=false;
  D=false;
  
  }
  if(key=='w'){
  S=false;
  A=false;
  W=true;
  D=false;
  
  
  }
  if(key=='a'){
  S=false;
  A=true;
  W=false;
  D=false;;
  
  }
  if(key=='d'){
  S=false;
  A=false;
  W=false;
  D=true;
  
  }
}
void keyReleased(){
  S=false;
  A=false;
  W=false;
  D=false;
  
  image(personne2,pxPos,pyPos,60,60);
}
    
