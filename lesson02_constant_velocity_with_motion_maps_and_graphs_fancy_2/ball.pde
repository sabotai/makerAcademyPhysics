public class Ball {
  float x, y; //x and y of the original moving ellipse
  //int graphX, graphY; //the x and y position of the graph representation of the ellipse
  int ellipseSize;
  float unitsTravelled;
  //boolean auto, showTicks, showTime;
  ArrayList<PVector> graphPoints;
  float startX, startY; //(0,0) point in the graph
  float graphX, graphY;
  float speed;
  color ellipseColor;
  boolean fastest, stop;
  float moveGraph;
  float accel;

  public Ball(float _speed) {
    if (acceleration){
    accel = random(1.001, 1.006);}
    else {
     accel = 1; 
    }
    x = 0;
    y = ellipseSize / 2;
    ellipseSize = 100;
    speed = _speed *  unit;//int(_speed/unit * frameRate);

    
    println(_speed);
    startX = int(ellipseSize * 1.5);
    startY = height - ellipseSize;

    graphPoints = new ArrayList<PVector>();  // Create an empty ArrayList
    graphPoints.add(new PVector(startX, startY));  // Start by adding one element

    ellipseColor = color(random(80, 255), random(80, 255), random(80, 255));

    graphX = startX;
    graphY = startY;
  }

  public void update() {
    if ((speed/unit) < fastestSpeed) {
      fastest = false;
    } else {
      fastest = true;
    }
    println(fastest);


    unitsTravelled = x / unit;


    if (auto) {
      x = x + (speed / framert);
      
      if (!fastest && acceleration){ //acceleration
        x *= accel;
      }
    }
  }

  public void draw() {
    stroke(255);
    fill(255);

    for (int i = 0; i <= width; i += unit) {

      if (fastest) {
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



    if (!fastest) { // ensure that the slower ones fall behind once the fastest goes beyond the border
        ellipse(x-(fastestSpeed*framesOver), y, ellipseSize, ellipseSize);
      
    } else {
      
      if ( x < width  - ellipseSize) {
        ellipse(x, y, ellipseSize, ellipseSize);
      } else {
        ellipse(width - ellipseSize, y, ellipseSize, ellipseSize);
      }
    }
  }

  public void drawGraph() {



    stroke(ellipseColor);
    fill(ellipseColor);
    graphX = startX + time*unit; // x position of the graph ellipse
    graphY = startY - unitsTravelled*unit; // y position of the graph ellipse



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


    if (int(x/unit) > unitsTravelled) {
      graphPoints.add(new PVector(graphX, graphY));
    }
  }
}

