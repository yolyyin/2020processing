class State{
  float[] x;
  float[] y;
  float[] oldX;
  float[] oldY;
  float[] vx;
  float[] vy;
  float[] p;
  float[] pNear;
  float[] g;
  State(){
    x= new float[particle_count];
    y= new float[particle_count];
    oldX=new float[particle_count];
    oldY=new float[particle_count];
    vx=new float[particle_count];
    vy=new float[particle_count];
    p=new float[particle_count];
    pNear=new float[particle_count];
    g=new float[particle_count];
  } 
  void render(){
    stroke(200);
    noFill();
    circle(0*scale,0*scale, 80*scale);
    noStroke();
    fill(200);
    for(int i=0;i<particle_count;i++){
      float scaleX=(x[i]+0.5)*scale;
      float scaleY=(y[i]+0.5)*scale;
      circle(scaleX,scaleY,scale*1.5);
    }
  }
}
