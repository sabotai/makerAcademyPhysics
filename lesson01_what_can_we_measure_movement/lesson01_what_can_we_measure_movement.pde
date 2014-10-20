////////////////////////////////
// 
////////////////////////////////



int x, y;
int ellipseSize;
int unit;
boolean auto, showTicks, showTime;

void setup() {
  size(1280, 720); 
  x = 0;
  y = height/2;
  ellipseSize = 100;
  unit = 40;
  auto = true;
  showTime = true;
  showTicks = true;
}

void draw() {  
  background(0);
  stroke(20);
  strokeWeight(6);

  if (showTicks) {
    for (int i = 0; i <= width; i += unit) {
      stroke(255);

      line(i, 0, i, unit); 
      if (i == y) {
        stroke(255);
      } else {
        stroke(20);
      }
      //line(0, i, width, i);
    }
  }
  if (showTime) {
    int unitsTravelled = x / 40;
    textSize(300);
    textAlign(RIGHT);
    text(unitsTravelled + " units", width, height/2);
    
    textSize(250);
    text("/ " + millis() / 1000 + " sec.", width, height/5 * 4);
  }



  ellipse(x, y, ellipseSize, ellipseSize);

  if (auto) {
    x = x + 1;
  }
}

void keyPressed() {
  if (keyCode == CONTROL) {
    auto = !auto;
  } 
  if (keyCode == SHIFT) {
    showTicks = !showTicks;
  } 
  if (keyCode == ALT) {
    showTime = !showTime;
  } 
  if (keyCode == RIGHT) {
    x += unit;
  }
  if (keyCode == LEFT) {
    x -= unit;
  }
}

