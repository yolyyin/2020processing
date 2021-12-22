float gradient(int i, int n){
  PVector particle=new PVector(state.x[i],state.y[i]);
  PVector neighbour =new PVector(state.x[n],state.y[n]);
  
  float lsq =particle.sub(neighbour).magSq();
  if(lsq>interaction_radius_sq){
    return 0;
  }
  
  float distance=sqrt(lsq);
  return 1- distance/interaction_radius;
}


IntList getNeighboursWithGradients(int i){
  int gridX=floor(state.x[i]+0.5);
  int gridY=floor(state.y[i]+0.5);
  float radius = interaction_radius;
  
  IntList results = hashmap.queryWithRadius(gridX,gridY,radius);
  IntList neighbours= new IntList();
  
  for(int k=0; k<results.size();k++){
    int n =results.get(k);
    if(i==n){ continue; }
    float g =gradient(i,n);
    if(g==0){continue;}
    
    state.g[n]=g;//store gradient
    neighbours.append(n);//push good neighbour to neighbours   
  }
    return neighbours;
}
