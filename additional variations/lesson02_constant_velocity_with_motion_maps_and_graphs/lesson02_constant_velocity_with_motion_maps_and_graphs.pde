////////////////////////////////
// 
////////////////////////////////



int x, y; //x and y of the original moving ellipse
int graphX, graphY; //the x and y position of the graph representation of the ellipse
int ellipseSize;
int unit, time;
int unitsTravelled;
boolean auto, showTicks, showTime;

void setup() {
  size(1280, 720); 
  x = 0;
  y = ellipseSize / 2;
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
    textSize(120);
    textAlign(RIGHT);
    text(unitsTravelled + " units", width, height/2);
    
    textSize(100);
    text("/ " + time + " sec.", width, height/5 * 4);
  }


  //moving ellipse at the top
  ellipse(x, y, ellipseSize, ellipseSize);

  
  
  // draw graph
  stroke(255);
  int startX = ellipseSize;
  int startY = height - ellipseSize;
  
  line(ellipseSize, ellipseSize, ellipseSize, height - ellipseSize);
  line(ellipseSize, height - ellipseSize, width/2, height-ellipseSize);
  triangle(  width/2,height-ellipseSize - 10,width/2 + 10, height-ellipseSize,width/2,height-ellipseSize+10);  


  ellipse(startX + time*unit, startY - unitsTravelled*unit, ellipseSize/5, ellipseSize/5);

  //move this many positions each frame
  if (auto) { 
    x = x + 1;
  }
  
  time = millis() / 1000;
  unitsTravelled = x / 40;
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

