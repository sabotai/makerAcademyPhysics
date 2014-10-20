
int x;
int y;
int ellipseSize;
int speed;
int resolution;

void setup(){
  size(1280,720); 
  x = 0;
  y = height/2;
  ellipseSize = 100;
  speed = 1;
  resolution = 40;
  
}

void draw(){  
  background(0);
  stroke(255);
  strokeWeight(18);
  
  for (int i = 0; i <= width; i += resolution){
     line(i, 0, i, height - 3 * resolution); 
     
     //if (i < (720 * (2/3))){
     //line(0, i, width, i);}
  }
  

  //fill(255);
  stroke(0); 
  noFill();
  ellipse(x, y, ellipseSize, ellipseSize);
  
  
  
  fill(255);
  textSize(300);
  text(millis() / 1000 + " sec.", 0,height/3);
  
  stroke(255);
  line(x,y,x,height);
  //noStroke();
  //ellipse(x,y,ellipseSize/3, ellipseSize/3);



  textSize(36);
  //fill(100);
  text("x = " + x/40 ,x + 30, height - resolution);
  
  
  x = x + speed;
  
}
