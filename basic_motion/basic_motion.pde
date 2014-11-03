
int x; //x position of our circle
int y; //y position of our circle
int ellipseSize; //the diameter of our circle

void setup(){
  size(1280,720); //create the window to be this size
  x = 0; //start the x position of the circle all the way to the left
  y = height/2; //the y position of the circle should be in the middle
  ellipseSize = 100; //set the diameter to this amount
}

void draw(){
  background(0); //draw the background each frame, so there is no trail... you can take this out if you want
 
  ellipse(x, y, ellipseSize, ellipseSize); //draw an ellipse at x and y positions, with a width and height of ellipseSize
  x = x + 1; //move the ellipse x position by 1 pixel
  

}
