////////////////////////////////
// 
////////////////////////////////

//fix the pause ability
//add fullscreen
//fix the acceleration top thing
//fix reset button

int numBalls = 3; //maximum of 4 balls on screen
float fastestAllowed = 3;
boolean acceleration = false; //turn acceleration on or off

float unit = 40;
float time;
boolean auto, showTicks, showTime;
int ellipseSize = 100;
int strokeWt = 6;
float fastestSpeed;

ArrayList<Ball> balls;

int framert = 30;

float framesOver = 0;

void setup() {
  size(1280, 720); 
  auto = true;
  showTime = true;
  showTicks = true;

  unit = 40;
  //ball1 = new Ball(1);
  //  ball2 = new Ball(2);
  balls = new ArrayList<Ball>();  // Create an empty ArrayList
  for (int i = 0; i < numBalls; i++){
    float spd = random(0.1, fastestAllowed);
    if (spd > fastestSpeed){ // keep track of which one is the fastest
      
      fastestSpeed = spd;
    } else {
     spd *= 0.2; 
    }
    balls.add(new Ball(spd));  // Start by adding one element
  }


  framert = 60;
  frameRate(framert);
}

void draw() {  
  background(0);
  stroke(255);
  strokeWeight(strokeWt);

  for (int i = 0; i < balls.size (); i+=1) {
    Ball ball = balls.get(i);

    ball.update();
    ball.draw();
  }
  pushMatrix();
  scaleGraph();
  graph();
  for (int i = 0; i < balls.size (); i+=1) {
    Ball ball = balls.get(i);

    ball.drawGraph();
  }
  popMatrix();
  //println(x);
  data();





  //moving ellipse at the top



  //move this many positions each frame


  time = float(millis()) / 1000;
  //println(time);
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
  if (keyCode == DOWN) {
   noLoop();
   }
   if (keyCode == UP){
    loop(); 
   }

  
  if (keyCode == RIGHT) {
   acceleration = !acceleration;
   }
   if (keyCode == LEFT) {
   setup();
   }
   
}

void scaleGraph() {
  float highGraphY = height;
  float highUnitsTravelled = 0;

  //////// draw graph 
  for (int i = 0; i < balls.size (); i+=1) {
    Ball ball = balls.get(i);

    if (ball.graphY < highGraphY) {
      highGraphY = ball.graphY;
      highUnitsTravelled = ball.unitsTravelled;
    }
  }

  //make the graph smaller if it exceeds the bounds
  int maxFit = 13;
  if ((highUnitsTravelled > maxFit) && (highGraphY < ellipseSize)) {
    float scaleAmt = 1 / (highUnitsTravelled / maxFit);
    translate(0, height + (1-scaleAmt * height));
    scale(scaleAmt);
    //println(scaleAmt);
    //println(scaleAmt + "  " + (height + (1-scaleAmt * height)));
    strokeWeight(strokeWt + strokeWt * (5*(1-scaleAmt)));
  }
}

void graph() {
  stroke(255);
  fill(255);

  line(ellipseSize * 1.5, ellipseSize, ellipseSize * 1.5, height - ellipseSize); // vertical units travelled line
  triangle(ellipseSize*1.5 - 10, ellipseSize, ellipseSize*1.5, ellipseSize - 10, ellipseSize*1.5 + 10, ellipseSize);
  line(ellipseSize * 1.5, height - ellipseSize, width/2, height-ellipseSize); //horizontal seconds passed line
  triangle(  width/2, height-ellipseSize - 10, width/2 + 10, height-ellipseSize, width/2, height-ellipseSize+10);  
  textSize(32);
  text("Units", ellipseSize+15, height/2);
  text("Time", width/3, height - ellipseSize + 50);
}

void data() {
  fill(255);
  if (showTime) {
    textSize(120);
    textAlign(RIGHT);
    noStroke();
    for (int i = 0; i < balls.size (); i++) {

      Ball ball = balls.get(i);
      fill(ball.ellipseColor);
      text(int(ball.unitsTravelled) + " units", width, (height/balls.size()) + (i * 120));
      //ellipse(width-40, (height/2) + (i * 120)-30, 60, 60);
    }
    fill(255);
    textSize(100);
    //text("/ " + int(time) + " sec.", width, height/5 * 4);
    text("/ " + int(time) + " sec.", width, (height/balls.size()) + ((balls.size())* 120));
  }
}

