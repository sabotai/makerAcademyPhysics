
int x;
int y;
int ellipseSize;
int unit;
boolean auto;

void setup(){
  size(1280,720); 
  x = 0;
  y = height/2;
  ellipseSize = 100;
  unit = 40;
  auto = false;
}

void draw(){  
  background(0);
  stroke(20);
  strokeWeight(6);
  
for (int i = 0; i <= width; i += unit){
   if (i - x <= unit/2){
     stroke(255);
   } else {
     stroke(40); 
   }
   line(i, 0, i, height); 
   if (i == y){
     stroke(255);
   } else {
     stroke(20); 
   }
   //line(0, i, width, i);
}
  

  
  ellipse(x, y, ellipseSize, ellipseSize);
  
  if (auto){
    x = x + 1;
  }
  
}

void keyPressed(){
 if (keyCode == ALT){
  auto = !auto;
 } 
 if (keyCode == RIGHT){
  x += unit; 
 }
 if (keyCode == LEFT){
  x -= unit; 
 }
}
