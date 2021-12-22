PGraphics canvas;
PImage img;
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system
int fakeX=0;
int w=568,h=320;

void setup() {
  //size(1136, 640,P3D);
  size(568,320,P3D);
  canvas = createGraphics(568,320,P3D);
  smooth(8);
  img = loadImage("linghuoshidai.jpg"); // Load the image
  cols = w/cellsize;              // Calculate # of columns
  rows = h/cellsize;             // Calculate # of rows
}

void draw() {
  if (fakeX>w){
    fakeX=0;}
    
  canvas.beginDraw();
  canvas.background(0);
  img.loadPixels();

  // Begin loop for columns
  for (int i = 0; i < cols; i++ ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*w;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Map brightness to a z position as a function of mouseX
      float z = map(brightness(img.pixels[loc]), 0, 255, 0, 1.5*min(fakeX,w-fakeX));
      // Translate to the location, set fill and stroke, and draw the rect
      canvas.pushMatrix();
      canvas.translate(w/2, h/2, z); 
      canvas.rotate(map(fakeX,0,w,0,2*PI));
      canvas.fill(c);
      canvas.noStroke();
      canvas.rectMode(CENTER);
      canvas.ellipse(x-w/2, y-h/2, cellsize*1.2, cellsize*1);
      canvas.popMatrix();
    }
  }
  canvas.endDraw();
  image(canvas,0,0,width,height);
  fakeX++;
}
