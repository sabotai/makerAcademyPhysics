
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
  stroke(20);
  strokeWeight(6);
  
for (int i = 0; i <= width; i += 40){
   line(i, 0, i, height); 
   line(0, i, width, i);
}
  

  
  ellipse(x, y, ellipseSize, ellipseSize);
  
  
  x = x + 1;
  
}
