FractalRoot pentagon;
int MAX_LEVELS = 5;

void setup(){
  size(1000, 1000);
  smooth();
  pentagon = new FractalRoot();
}

void draw() {
  pentagon.drawShape();
}

class PointObj{
  float x, y;
  PointObj(float ex, float why){
    x = ex; y = why;
  }
}

// calculate coords of points
class FractalRoot{
  PointObj[] pointArr = new PointObj[5];
  Branch rootBranch;
  
  FractalRoot(){
    float centX = width/2;
    float centY = height/2;
    
    for(int i = 0; i < 5; i++){
      float x = centX + 400 * cos(radians(i*72));
      float y = centY + 400 * sin(radians(i*72));
      pointArr[i] = new PointObj(x, y);
    }
    rootBranch = new Branch(0, 0, pointArr);
  }
  
  void drawShape(){
    rootBranch.drawMe();
  }
}

// draw points end edges
class Branch{
  int level, num;
  PointObj[] outerPoints = {};
  
  Branch(int lev, int n, PointObj[] points){
    level = lev;
    num = n;
    outerPoints = points;
  }
  
  void drawMe(){
    strokeWeight(5-level);
    // drawing outer shape
    for(int i = 0; i < outerPoints.length; i++){
      int ni = i+1;
      if(ni == outerPoints.length){ ni = 0;}
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[ni].x, outerPoints[ni].y);
    }
  }
}
