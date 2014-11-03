////////////////////////////////
///// CONTROLS:
///// UP        :PLAY
///// DOWN      :PAUSE
///// ALT       :REVERSE DIRECTION


int x; //x position of the marker
int y; //y position of the marker
int ellipseSize; //size of the ellipse at the end of the marker
int speed; //how many pixels to move each frame
int unitScale; //how many pixels between the scale marks
int time; //keep track of the time to display
int stopTime, startTime; //needed in order to correct time for pausing

void setup(){
  size(1280,720); //make a window of this size
  x = 0; //start the x position at 0
  y = height/2; //put the ellipse in the middle of the y axis
  ellipseSize = 100; //make the ellipse this size
  speed = 1; //move by this speed
  unitScale = 40; //scale the marks by this many pixels
  stopTime = 0; //leave this at 0 to start
  startTime = 0; //leave this at 0 to start

}

void draw(){  
  time = (millis() / 1000)-(startTime - stopTime); //update the time to be seconds minus any time paused
  background(0); //draw the background as black
  stroke(255); //with white stroke(outline)
  strokeWeight(18); ///stroke should be this thick
  
  
  for (int i = unitScale; i < width; i += unitScale){ //draw the correct number of line markers
    if (abs(x-i) < 18){ //if the marker is close to one of the lines
     stroke(0); //make it black
    } else {
     stroke(255); //otherwise, make it white
    }
     line(i, 0, i, height - 3 * unitScale); //draw line
  }
  

  textSize(300); //make the text this size
  text(time + " sec.", 0,height/3); //draw the time at this position
  stroke(0); //make the ellipse stroke black
  noFill(); //do not fill the ellipse with color
  ellipse(x, y, ellipseSize, ellipseSize); //draw the ellipse at the current x and y position
  
  
  
  fill(255); //draw the marker in white
  stroke(255); //with a white stroke
  line(x,y,x,height); //draw the line connected to the ellipse

  textSize(36); //write the position in this size font
  text("x = " + x/unitScale ,x + 30, height - unitScale); //write how many marks it has passed
  
  
  x = x + speed; //move it by this speed each frame
  
}

void keyPressed(){
 if (keyCode == UP){ //play the animation
  startTime = millis()/1000;
  loop();
 } 
 if (keyCode == DOWN){ //pause the animation
  noLoop();
  stopTime = time;
  println(stopTime);
 } 
 if (keyCode == ALT){ //reverse the speed
  speed = -speed; 
 }
}
