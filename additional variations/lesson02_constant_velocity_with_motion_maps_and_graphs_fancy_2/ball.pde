public class Ball {
  float x, y; //x and y of the original moving ellipse
  int ellipseSize;
  float unitsTravelled;
  ArrayList<PVector> graphPoints;
  float startX, startY; //(0,0) point in the graph
  float graphX, graphY;
  float speed;
  color ellipseColor;
  boolean fastest, stop;
  float moveGraph;
  float accel;
  boolean accelerating;

  public Ball(float _speed) {
    accel = random(0.001, 0.005); //set acceleration
    x = 0;
    y = ellipseSize / 2;
    ellipseSize = 100;
    speed = (_speed *  unit);

    startX = int(ellipseSize * 1.5);
    startY = height - ellipseSize;

    graphPoints = new ArrayList<PVector>();  // Create an empty ArrayList
    graphPoints.add(new PVector(startX, startY));  // Start by adding one element

    ellipseColor = color(random(80, 255), random(80, 255), random(80, 255), 200);

    graphX = startX;
    graphY = startY;
  }

  public void init() { //only run init after all balls are created

    if ((speed/unit) < fastestSpeed) {
      accelerating = true;
    } else {
      accelerating = false;
    }
    println(accelerating + " accelerating");
  }

  public void update() {
    
    unitsTravelled = x / unit;
    x = x + (speed);// / frameRate);

    //if its one of the accelerating balls and acceleration is turned on
    if (accelerating && acceleration) { 
      speed += accel;
    }

    if (x > furthest) { //keep track of the leader
      furthest = x;
    }
    println(speed);
  }

  public void draw() {
    stroke(255);
    fill(255);

    for (int i = 0; i <= width; i += unit) {

      if (x == furthest) { //if it's the leader
        if ( x < width  - ellipseSize) { //make the regular lines
          line(i, 0, i, unit);
        } else { //make moving lines after it reaches the end

          framesOver += 1/ (width/unit);

          //if (fastest) {

          float moveX = i + (int(x/width) * width) - x;
          //println("movex is " + moveX);
          line(moveX, 0, moveX, unit);
          line(moveX+width, 0, moveX+width, unit);
          //println(graphShift);
          // }
        }
      }
    }


    fill(ellipseColor);
    stroke(ellipseColor);


    float where = 0;

    where = x;
    if (furthest > width - ellipseSize) {
      float temp = furthest-(width-ellipseSize);
      where -= temp;
    }
    ellipse(where, y, ellipseSize, ellipseSize); 

  }

  public void drawGraph() {



    stroke(ellipseColor);
    fill(ellipseColor);
    graphX = startX + time*unit; // x position of the graph ellipse
    graphY = startY - unitsTravelled*unit; // y position of the graph ellipse



    ellipse(graphX, graphY, ellipseSize/5, ellipseSize/5);

    for (int i = 0; i+1 <= graphPoints.size (); i+=1) {
      PVector pointA = graphPoints.get(i);
      PVector pointB;
      if (i+1 < graphPoints.size()) {
        pointB = graphPoints.get(i+1);
      } else {
        pointB = new PVector(graphX, graphY);
      }
      line(pointA.x, pointA.y, pointB.x, pointB.y);
      ellipse(pointA.x, pointA.y, 5, 5);
    }


    if (int(x/unit) > unitsTravelled) {
      graphPoints.add(new PVector(graphX, graphY));
    }
  }
}

