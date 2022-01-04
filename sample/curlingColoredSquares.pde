nt h;
float a,s,r;
int count;
PutRect pr;
void setup() {
   size(600,600);
   background(0);
   noStroke();
   rectMode(CENTER);
   colorMode(HSB,360,100,100);
   frameRate(120);
   
   h = 0;
   a=0;
   s = 5.0;
   r = 10.0;
   count = 0;
   /////pr = new PutRect(h,a,s,r);
}

void draw() {
   scale(0.3);
   translate(200,200);
   pr = new PutRect(h,a,s,r);
   pr.display();
   
   
   h+= 8;
   if(h >=360) h = 0;
   s+=0.3;
   r+=s/4.5;
   a += atan2(s,r) * 3;
   
}

class PutRect{
   int hue;
   float arg,size,rad;
   
   PutRect(int _h,float _a,float _s,float _r){
      hue = _h;
      arg = _a;
      size = _s;
      rad = _r;
   }
   
   void display(){
      fill(hue,90,90);
      pushMatrix();
      //translate(width/2 + size*random(3)*cos(arg*2),height/2+size*random(4)*sin(arg));
      translate(width/2+size*5,height/2);

      rotate(arg);
      rect(rad,0,size*1.3, size*1.3);
      popMatrix();
   }
}

void mousePressed(){
   if(count%2==0)noLoop();
   else loop();
   count++;
}
