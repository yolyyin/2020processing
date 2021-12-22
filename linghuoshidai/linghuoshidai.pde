PImage img;
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system
int fakeX=0;

void setup() {
  size(568, 320,P3D);
  img = loadImage("linghuoshidai.jpg"); // Load the image
  cols = width/cellsize;              // Calculate # of columns
  rows = height/cellsize;             // Calculate # of rows
}

void draw() {
  background(0);
  img.loadPixels();
  if (fakeX>width){
    fakeX=0;}

  // Begin loop for columns
  for (int i = 0; i < cols; i++ ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Map brightness to a z position as a function of mouseX
      float z = map(brightness(img.pixels[loc]), 0, 255, 0, 1.5*min(fakeX,width-fakeX));
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(width/2, height/2, z); 
      rotate(map(fakeX,0,width,0,2*PI));
      fill(c);
      noStroke();
      rectMode(CENTER);
      ellipse(x-width/2, y-height/2, cellsize*1.2, cellsize*0.9);
      popMatrix();
    }
  }
  fakeX++;
}
