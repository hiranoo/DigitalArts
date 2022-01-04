int NUM_CHILDREN = 7;
int MAX_LEVELS = 5;

Branch _trunk;

void setup(){
  size(750, 500);
  background(255);
  noFill();
  smooth();
  newTree();
}

void draw(){
  background(255);
  _trunk.updateMe(width/2, height/2);
  _trunk.drawMe();
}

void newTree(){
 _trunk = new Branch(1,0 , width/2, height/2);
 //_trunk.drawMe();
}

class Branch {
  float level, index;
  float x, y;
  float endx, endy;
  float strokeW, alph;
  float len, lenChange;
  float rot, rotChange;
  
  Branch[] children = new Branch[0];
  
  Branch(float lev, float ind, float ex, float why){
    level = lev;
    index = ind;
    
    strokeW = (1/level)*20;
    alph = 255/level;
    len = (1/level)*random(200);
    rot = random(360);
    lenChange = random(10)-5;
    rotChange = random(10)-5;
    
    updateMe(ex, why);
    
    if (level < MAX_LEVELS){
      children = new Branch[NUM_CHILDREN];
      for (int i = 0; i < NUM_CHILDREN; i++){
        children[i] = new Branch(level+1, i, endx, endy);
      }
    }
    
  }
  
  void updateMe(float ex, float why){
    x = ex;
    y = why;
    
    rot += rotChange;
    if(rot > 360 ){ rot = 0;}
    else if(rot < 0){ rot = 360;}
    
    len -= lenChange;
    if(len<0){ lenChange *= -1;}
    else if (len > 200){ lenChange *= -1;}
     
    float angle = radians(rot);
    endx = x + len * cos(angle);
    endy = y + len * sin(angle);
    
    for(int i = 0; i < children.length; i++){
      children[i].updateMe(endx, endy);
    }
  }
  
  void drawMe(){
    strokeWeight(strokeW);
    stroke(0, alph);
    fill(255, alph);
    line(x, y, endx, endy);
    ellipse(x, y, 5, 5);
    
    for (int i = 0; i < children.length; i++){
       children[i].drawMe();
    }
  }
}
