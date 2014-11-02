////////////////////////////////
// 
////////////////////////////////

//add fullscreen
//fix the acceleration top thing

int numBalls = 4; //maximum of 4 balls on screen
float fastestAllowed = 3;
boolean acceleration = false; //turn acceleration on or off

float unit = 40; //size of units
float time;
boolean showSpeed;
int ellipseSize = 100;
float strokeWt = 6;
float fastestSpeed, furthest;
boolean paused;
float stopTime, startTime, pauseTime;

ArrayList<Ball> balls;


float framesOver = 0;

void setup() {
  size(1280, 720);
  

  unit = 40;
  balls = new ArrayList<Ball>();  // Create an empty ArrayList
  for (int i = 0; i < numBalls; i++) {
    float spd = random(0.1, fastestAllowed);
    if (spd > fastestSpeed) { // keep track of which one is the fastest

      fastestSpeed = spd;
    } else {
      spd *= (fastestAllowed * 0.3);
    }
    balls.add(new Ball(spd));  // Start by adding one element
  }

  for (int i = 0; i < numBalls; i++) {

    Ball ball = balls.get(i);
    ball.init();
  }



  //framert = 60;
  //frameRate(framert);
}

void draw() {  
  
  background(0);
  stroke(255);
  strokeWeight(6);

  for (int i = 0; i < balls.size (); i+=1) {
    Ball ball = balls.get(i);

    checkSpeeds(i, ball.speed);

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
  if (paused) {
    noLoop();
  }

  time = (float(millis()) / 1000) - pauseTime;
  //println(time);
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
    strokeWt = strokeWt + (1-scaleAmt)/strokeWt;
    strokeWeight(strokeWt);
    scale(scaleAmt);
    //println(scaleAmt + "  " + (height + (1-scaleAmt * height)));
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
    textSize(120);
    textAlign(RIGHT);
    noStroke();
    for (int i = 0; i < balls.size (); i++) {

      Ball ball = balls.get(i);
      fill(ball.ellipseColor);
      if (!showSpeed) {
        int tempDist = int(ball.unitsTravelled);
        text(tempDist + " units", width, (height/balls.size()) + (i * 120));
      } else {
        float tempSpeed = 10 * (ball.unitsTravelled / time);
        tempSpeed = int(tempSpeed);
        tempSpeed /=   10;
        text(tempSpeed + " units/s", width, (height/balls.size()) + (i * 120));
        
      }
      //ellipse(width-40, (height/2) + (i * 120)-30, 60, 60);
    }
    fill(255);
    textSize(100);
    //text("/ " + int(time) + " sec.", width, height/5 * 4);
    if (!showSpeed) {
      text("/ " + int(time) + " sec.", width, (height/balls.size()) + ((balls.size())* 120));
    }
  
}

void checkSpeeds(int g, float _Speed) {

  if (_Speed > fastestSpeed) { // keep track of which one is the fastest
    fastestSpeed = _Speed;
    for (int h = 0; h < balls.size (); h+=1) {
      Ball ball = balls.get(h);
      if (g == h) {
        ball.fastest = true;
        println(g + "  is fastest");
      } else {
        ball.fastest = false;
        println(h + "  is not fastest");
      }

      //fastestSpeed = _Speed;
    }
  }
}


void keyPressed() {
  if (keyCode == ALT) {
    showSpeed = !showSpeed;
  } 
  if (keyCode == DOWN) {
    if (!paused){
      
    stopTime = millis();
    }
      
    
    paused = true;
  }
  if (keyCode == UP) {
    if (paused) {
      loop();
      startTime = millis();
      pauseTime = pauseTime + ((startTime - stopTime) / 1000);
      startTime = 0;
      stopTime = 0;
      paused = false;
    }
  }


  if (keyCode == RIGHT) {
    acceleration = !acceleration;
  }
  /*
  if (keyCode == LEFT) {
    setup();
  }
  */
}

