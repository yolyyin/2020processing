PGraphics canvas;
void setup(){
  size(800, 800);
  background(255);
  canvas=createGraphics(800,800,JAVA2D);
    canvas.beginDraw();
  canvas.loadPixels();
  float opague=0;
  for (int i=0;i<width;i++){
    for (int j=0;j<height;j++){
      int loc=i+j*width;
      canvas.pixels[loc]=color(159,65,115,opague);
      opague+=0.001;
    }
  }
  canvas.updatePixels();
  canvas.endDraw();

}
void draw(){
  image(canvas,0,0,width,height);

}
