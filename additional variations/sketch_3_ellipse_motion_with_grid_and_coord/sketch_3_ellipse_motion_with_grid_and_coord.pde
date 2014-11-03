
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
  stroke(255);
  strokeWeight(18);
  
  for (int i = 0; i <= width; i += 40){
     line(i, 0, i, height); 
     line(0, i, width, i);
  }
  

  //fill(255);
  stroke(0); 
  noFill();
  ellipse(x, y, ellipseSize, ellipseSize);



  textSize(36);
  fill(100);
  text("(" + x + ", " + y + ")",x, y);
  
  
  x = x + 1;
  
}
