void contain(int i){
  PVector pos = new PVector(state.x[i],state.y[i],0);
  if(pos.magSq() > radiusSq){
    PVector unitPos= pos.normalize();
    //PVector unitPosCopy = unitPos;
    //PVector newPos = unitPosCopy.mult(radius);
    
    //state.x[i]=newPos.x;
    //state.y[i]=newPos.y;
    
    PVector antiStick = unitPos.mult(interaction_radius/2*dt);
    state.oldX[i]=state.x[i] +antiStick.x;
    state.oldY[i]=state.y[i]+antiStick.y;
  }
}

void calculateVelocity(int i,float dt){
  PVector pos = new PVector(state.x[i],state.y[i]);
  PVector old = new PVector(state.oldX[i],state.oldY[i]);
  
  PVector v = pos.sub(old).mult(1/dt);
  state.vx[i] = v.x;
  state.vy[i] = v.y;
}
