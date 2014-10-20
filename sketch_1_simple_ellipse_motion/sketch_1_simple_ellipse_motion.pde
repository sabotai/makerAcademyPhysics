
int x;
int y;
int ellipseSize;

void setup(){
  size(1280,720); 
  x = 0;
  y = height/2;
  ellipseSize = 100;
}

void draw(){
  background(0);
  ellipse(x, y, ellipseSize, ellipseSize);
  x = x + 1;
  
}
