////////////////////////////////
// 
////////////////////////////////



int x, y; //x and y of the original moving ellipse
int graphX, graphY; //the x and y position of the graph representation of the ellipse
int ellipseSize;
int unit, time;
int unitsTravelled;
boolean auto, showTicks, showTime;
ArrayList<PVector> graphPoints;
int startX, startY; //(0,0) point in the graph

void setup() {
  size(1280, 720); 
  x = 0;
  y = ellipseSize / 2;
  ellipseSize = 100;
  unit = 40;
  auto = true;
  showTime = true;
  showTicks = true;

  startX = int(ellipseSize * 1.5);
  startY = height - ellipseSize;

  graphPoints = new ArrayList<PVector>();  // Create an empty ArrayList
  graphPoints.add(new PVector(startX, startY));  // Start by adding one element
}

void draw() {  
  background(0);
  stroke(255);
  strokeWeight(6);

  unitsTravelled = x / unit;

  println(x);

  for (int i = 0; i <= width; i += unit) {

    if ( x < width  - ellipseSize) { //make the regular lines
      line(i, 0, i, unit);
    } else { //make moving lines after it reaches the end
      int moveX = i + (int(x/width) * width)- x;
      println("movex is " + moveX);
      line(moveX, 0, moveX, unit);
      line(moveX+width, 0, moveX+width, unit);
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
  if ( x < width  - ellipseSize) {
    ellipse(x, y, ellipseSize, ellipseSize);
  } else {
    ellipse(width - ellipseSize, y, ellipseSize, ellipseSize);
  }


  //////// draw graph 

  //make the graph smaller if it exceeds the bounds
  int maxFit = 13;
  if (unitsTravelled > maxFit) {
    float scaleAmt = 1 / (float(unitsTravelled) / maxFit);
    translate(0, height + (1-scaleAmt * height));
    scale(scaleAmt);
    //println(scaleAmt + "  " + (height + (1-scaleAmt * height)));
  }


  stroke(255);
  int graphX = startX + time*unit; // x position of the graph ellipse
  int graphY = startY - unitsTravelled*unit; // y position of the graph ellipse

  line(ellipseSize * 1.5, ellipseSize, ellipseSize * 1.5, height - ellipseSize); // vertical units travelled line
  line(ellipseSize * 1.5, height - ellipseSize, width/2, height-ellipseSize); //horizontal seconds passed line
  triangle(  width/2, height-ellipseSize - 10, width/2 + 10, height-ellipseSize, width/2, height-ellipseSize+10);  
  textSize(32);
  text("Units", ellipseSize+15, height/2);
  text("Time (in seconds)", width/2.5, height - ellipseSize + 50); 

  ellipse(graphX, graphY, ellipseSize/5, ellipseSize/5);

  for (int i = 0; i+1 <= graphPoints.size (); i+=1) {
    //if ( 
    PVector pointA = graphPoints.get(i);
    PVector pointB;
    if (i+1 < graphPoints.size()) {
      pointB = graphPoints.get(i+1);
    } else {
      pointB = new PVector(graphX, graphY);
    }
    line(pointA.x, pointA.y, pointB.x, pointB.y);
  }


  //move this many positions each frame
  if (auto) {// && unitsTravelled < 14) { 
    x = x + 1;
  }

  time = millis() / 1000;

  if (int(x/unit) > unitsTravelled) {
    graphPoints.add(new PVector(graphX, graphY));
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

