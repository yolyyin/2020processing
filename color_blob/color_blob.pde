// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for this video: https://youtu.be/Cl_Gjj80gPE
PImage img;
float yoff = 0.0;
Organic[] organics;
color[] colorsPalette;


void setup() {
  size(800, 800);
  background(255);
  img=loadImage("gradient.jpg");
  color[] colorsPalette={color(146,167,202,25),
                          color(186,196,219,25),
                          color(118,135,172,25),
                          color(76, 41, 81,25),
                          color(144, 62, 92,25),
                          color(178, 93, 119,25),
                          color(215, 118, 136,25),
                          color(246, 156, 164,25)};
  organics= new Organic[120];
  for (int i=0;i<120;i++){
    organics[i]= new Organic(0.1+1.5*i,width/2,height/2,i*1,i*random(90),colorsPalette[floor(random(8))]);
  }
}

void draw() {
  background(159,65,115,30);
  image(img,0,0);
  
  for(int i=0;i<organics.length;i++){
    organics[i].show(yoff);
  }

  yoff += 0.01;
}
