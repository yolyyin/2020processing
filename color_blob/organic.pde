class Organic{
  float myRadius;
  float myXpos;
  float myYpos;
  int myRoughness;
  float myAngle;
  color myColor;
  Organic(float radius, float xpos,float ypos,int roughness,float angle, color ocolor){
    myRadius=radius;
    myXpos=xpos;
    myYpos=ypos;
    myRoughness=roughness;
    myAngle=angle;
    myColor=ocolor;
  }
  
  void show(float yoff){
      noStroke();
      fill(myColor);
      //draw a blob!
      pushMatrix();
      translate(myXpos, myYpos);
      rotate(myAngle+yoff);
      beginShape();
      float xoff = 0;
      for (float a = 0; a <= TWO_PI; a += 0.1) {
        float offset = map(noise(xoff, yoff), 0, 1, -myRoughness, myRoughness);
        float r = myRadius + offset*sin(2*a);
        float x = r * cos(a);
        float y = r * sin(a);
        vertex(x, y);
        xoff += 0.1;
      //ellipse(x, y, 4, 4);
      }
      endShape();
      popMatrix();
    }
}
  
