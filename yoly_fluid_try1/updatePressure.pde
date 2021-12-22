void updatePressure(int i,IntList neighbours){
  float density=0;
  float nearDensity=0;
  
  for(int k=0; k<neighbours.size();k++){
    float g= state.g[neighbours.get(k)];
    density += g*g;
    nearDensity += g*g*g;
  }
  
  state.p[i] = stiffness*(density -rest_density);
  state.pNear[i] = stiffness_near*nearDensity;  
}

void relax(int i, IntList neighbours, float dt){
  PVector pos = new PVector(state.x[i],state.y[i]);
  for (int k=0;k<neighbours.size();k++){
    int n=neighbours.get(k);
    float g=state.g[n];
    
    PVector nPos= new PVector(state.x[n],state.y[n]);
    float magnitude = state.p[i] * g +state.pNear[i] *g*g;
    PVector direction = nPos.sub(pos).normalize();
    PVector force=direction.mult(magnitude);
    PVector d = force.mult(dt*dt);
    
    state.x[i] += d.x * -0.5;
    state.y[i] += d.y * -0.5;
    
    state.x[n] += d.x * 0.5;
    state.y[n] += d.y * 0.5;
  }
}
