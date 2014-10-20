
int x;
int y;
int ellipseSize;
int speed;
int resolution;
int time;
int stopTime, startTime;

void setup(){
  size(1280,720); 
  x = 0;
  y = height/2;
  ellipseSize = 100;
  speed = 1;
  resolution = 40;
  stopTime = 0;
  startTime = 0;

}

void draw(){  
  time = (millis() / 1000)-(startTime - stopTime) ;
  background(0);
  stroke(255);
  strokeWeight(18);
  
  
  for (int i = 0; i <= width; i += resolution){
    if (abs(x-i) < 18){
    //if (abs(x-i) < 90){
     stroke(255 / 1+x-i);
    } else {
     stroke(255); 
    }
     line(i, 0, i, height - 3 * resolution); 
     
     //if (i < (720 * (2/3))){
     //line(0, i, width, i);}
  }
  

  textSize(300);
  text(time + " sec.", 0,height/3);
  //fill(255);
  stroke(0); 
  noFill();
  ellipse(x, y, ellipseSize, ellipseSize);
  
  
  
  fill(255);
  stroke(255);
  line(x,y,x,height);
  //noStroke();
  //ellipse(x,y,ellipseSize/3, ellipseSize/3);



  textSize(36);
  //fill(100);
  text("x = " + x/40 ,x + 30, height - resolution);
  
  
  x = x + speed;
  
  /*
    for (int i = 0; i <= width; i += resolution){
     line(i, 0, i, height - 3 * resolution); 
     
     //if (i < (720 * (2/3))){
     //line(0, i, width, i);}
  }
  */
}

void keyPressed(){
 if (keyCode == UP){
  startTime = millis()/1000;
  loop();
 } 
 if (keyCode == DOWN){
  noLoop();
  stopTime = time;
  println(stopTime);
 } 
 if (keyCode == ALT){
  speed = -speed; 
 }
}
