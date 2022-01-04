int NUM = 50;
int n = 1;
int r = 4;

Nodes[] node = new Nodes[NUM];
void setup(){
  size(800,600,P3D);
  background(0);
  stroke(250,0,30);
  strokeWeight(0.5);
  smooth();
}

void draw(){
  /*pushMatrix();
  translate(width/2,height/2,0);
  fill(10,10,200,5);
  box(200,100,200);
  popMatrix();*/
  
 for(int i = 0; i< NUM; i++)
    node[i] = new Nodes();
    
 camera(50,50,100,width/2,height/2,0,0,1.0,0);
}

class Nodes{
  float x,y,z; // zahyou
  int[] p = new int[n];
  
  Nodes(){
    //determine the rocation
    x = random(width);
    y = random(height);
    z = random(second()*20);
    
    //determine partners
    for(int i = 0; i< n; i++){
      p[i] = (int)random(NUM);
    }
  }
  
  void make(){
    
    for(int i = 0; i < n; i++){
      ellipse(this.x,this.y,r,r);
      ellipse(this.x,this.y,r,r);
      line(this.x,this.y,node[p[i]].x,node[p[i]].y);
    }
  }
 
}

void mousePressed(){
    background(0);
    for(int i = 0; i < NUM; i++){
      node[i].make();
    }
    if(mouseX<=width/8&&mouseY>=height/8*7)
      n++;
}
