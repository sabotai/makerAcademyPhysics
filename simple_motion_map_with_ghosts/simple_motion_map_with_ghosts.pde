
int x; //x position of our circle
int y; //y position of our circle
int ellipseSize; //circle size
int unit; //how many pixels between the marks
int speed; //how many pixels per frame the circle moves
boolean play; //something to play/pause the movement

int ghostTime; //how much time between the ghosts, value can be changed in the setup

int[] ghostX; //keep track of all the ghost positions


void setup() {
  size(1280, 720); //setup the size of the window
  x = 0; //start x at the beginning
  y = height/2; //half of the height means the circle will be in the middle of the y axis
  ellipseSize = 100; //make our circle this diameter
  unit = 40;
  play = true; //default to playing the animation
  speed = 2; //how fast to move
  ghostTime = 2; //how many seconds between ghost recordings
  textSize(40); //make the text this size
  strokeWeight(6); //make the outlines (stroke) this size
  int framerate = 60; //make a new variable to hold our framerate
  frameRate(framerate); //set the framerate

  //setup our ghost positions based on what we entered above;
  int howManyGhosts = width/(speed * framerate)/ghostTime;

  ghostX = new int[howManyGhosts]; //make this many positions
  for (int i = 0; i < ghostX.length; i++) { //record the position for each one
    ghostX[i] = i * (width/ghostX.length);
  }
  
}

void draw() {  
  background(0); //draw the background color to black so we dont see trails
  fill(255); //set the fill color to white

  for (int i = 0; i <= width; i += unit) { //draw each of the lines
    if (i - x <= unit/2) { //if the circle has passed it, draw it white
      stroke(255);
    } else { //if not, use grey
      stroke(40);
    }
    line(i, 0, i, height); //draw current line in the series
  }


  ellipse(x, y, ellipseSize, ellipseSize); //draw the circle at the current position



  for (int i = 1; i < ghostX.length; i+=1) { //go through each of ghosts
    if (x > ghostX[i]) { //if the circle has passed that point, draw the ghost
      fill(255, 160); //draw it white, but with some transparency for ghostiness
      stroke(255);//white outline
      ellipse(ghostX[i], y, ellipseSize, ellipseSize); //draw ghost

      fill(255); //white fill color for the text box
      rect(ghostX[i]-10, y+65, 130, 55); //draw the text box
      fill(0); //use black text
      text(i * ghostTime + " sec.", ghostX[i], y+110); //draw the amount of seconds passed for that ghost
    }
  }

  if (play) { //if it isnt paused
    x = x + speed; //move the ellipse x by the amount of speed
  }
}

void keyPressed() {
  if (keyCode == ALT) {
    play = !play; //switch to pause or play the animation
  } 
  if (keyCode == RIGHT) {
    x += unit; //manually move the x to the right
  }
  if (keyCode == LEFT) {
    x -= unit; //manually move the x to the left
  }
}

