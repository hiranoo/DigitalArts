nt i,j,k;
int siz,block;
int num;
int count,count2;
float scaleX, scaleY;
float idy, idx;
color col;
void setup(){
  siz=5; block=10;
  num=5;
  count = 0; count2=0;
  scaleX = 1; scaleY = 1;
  size(800,800,P3D);
  col = color(200,0,50);
  idx = width*width/16; idy = height*height/16;
}

void draw(){
  background(0);
  translate(width/2,height/2);
  scale(scaleX,scaleY);
  rotateX(count2%5*30*3.14/180+20);
  rotateY(count2%7*20*3.14/180-10);
  rotateZ(count2%4*40*3.14/180);
  switch(count2%5){
    case 0:
      block = 10;
      col = color(200,0,30);
      break;
    case 1:
      block *= 1.2;
      col = color(10,200,0);
      break;
    case 2:
      block *= 0.8;
      col = color(30,100,230);
      break;
    case 3:
      block *= 1.2;
      col = color(0,220,100);
      break;
    case 4:
      block *= 1.2;
      col = color(70,10,220);
      break;
  }
  fill(col);
  for(i=-num;i<=num;i++){
    for(j=-num;j<=num;j++){
      for(k=-num;k<=num;k++){
        
        pushMatrix();
        translate(i*block,j*block,k*block);
        box(10);
        popMatrix();
      }
    }
  }
  count++;
  count2 = count/10;
  if(count2 == 140){
    count2 = 0;
  }
}

void mousePressed(){
  float dx = (mouseX-width/2)*(mouseX-width/2);
  float dy = (mouseY-height/2)*(mouseY-height/2);
 
  scaleX = dx/idx; scaleY = dy/idy;
}
/*
  for(i=-num;i<=num;i++){
    for(j=-num;j<=num;j++){
      for(k=-num;k<=num;j++){
        //pushMatrix();
        translate(block,0,0);
        box(siz,siz,siz);        
        //popMatrix();
      }
    }
  }
   */
