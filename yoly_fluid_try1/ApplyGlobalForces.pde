void applyGlobalForces(int i,float dt){
  float[] force=gravity;
  state.vx[i] += force[0]*dt;
  state.vy[i] += force[1]*dt;
}
