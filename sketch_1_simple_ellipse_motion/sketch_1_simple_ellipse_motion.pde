
int x;
int y;
int ellipseSize;

void setup(){
  size(1280,720); 
  x = 0;
  y = height/2;
  ellipseSize = 500;
}

void draw(){
  background(random(255));
  
  // the line below creates a circle that exists at the x and y position, width and height
  ellipse(x+1, y+1, ellipseSize, ellipseSize);
  x = x + 1;
  

}
