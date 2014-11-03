
int x;
int y;
int ellipseSize;
int unit;
int howManySeconds;
int speed;
boolean play;

int ghostTime; //how much time between drawing the ghosts

int[] ghostX;


void setup() {
  size(1280, 720); 
  x = 0;
  y = height/2;
  ellipseSize = 100;
  unit = 40;
  play = true;
  speed = 2; // must be a divisor how milliseconds youre recording
  ghostTime = 2;
  textSize(40);


  int framerate = 60;
  frameRate(framerate);
  int howManyGhosts = width/(speed * framerate)/ghostTime;



  ghostX = new int[howManyGhosts];
  for (int i = 0; i < ghostX.length; i++) {
    ghostX[i] = i * (width/ghostX.length);
  }
  
  strokeWeight(6);
}

void draw() {  
  background(0);
  fill(255);

  for (int i = 0; i <= width; i += unit) {
    if (i - x <= unit/2) {
      stroke(255);
    } else {
      stroke(40);
    }
    line(i, 0, i, height);
  }


  ellipse(x, y, ellipseSize, ellipseSize);



  for (int i = 1; i < ghostX.length; i+=1) {
    if (x > ghostX[i]) {
      fill(255, 160);
      stroke(255);
      ellipse(ghostX[i], y, ellipseSize, ellipseSize);

      fill(255);
      rect(ghostX[i]-10, y+65, 130, 55);
      fill(0);
      text(i * ghostTime + " sec.", ghostX[i], y+110);
    }
  }

  if (play) {
    x = x + speed;
  }
}

void keyPressed() {
  if (keyCode == ALT) {
    play = !play; //switch play to on
  } 
  if (keyCode == RIGHT) {
    x += unit;
  }
  if (keyCode == LEFT) {
    x -= unit;
  }
}

