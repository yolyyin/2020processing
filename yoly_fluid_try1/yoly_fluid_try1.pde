//parameter
final int particle_count=500;
final int scale =20;
final int hashscale=1;
final float dt=0.5;
final float radius = 40.0;
final float radiusSq=1600.0;
final float[] gravity={0,0.01};
final float interaction_radius=1.0;
final float interaction_radius_sq=1.0;
final float stiffness=0.000015;
final float stiffness_near=0.00005;
final float rest_density=0.0000025;
//overall state
State state=new State();
Hashmap hashmap=new Hashmap(40,40);



void setup(){
  size(800,800,P2D);
  for(int i=0;i<25;i++){
    for(int j=0;j<20;j++){
      state.x[i+j*25]=i/2.0+12;
      state.y[i+j*25]=j/2.0+10;
     }
  }
  
}

void draw(){
  background(0);
  fill(200);
  noStroke();
  //apply forces and move particle based on velocity
  
  for (int i=0; i<particle_count;i++){
    //update old position
    state.oldX[i]=state.x[i];
    state.oldY[i]=state.y[i];
    applyGlobalForces(i,dt);
    
    //update positions
    state.x[i] += state.vx[i]*dt;
    state.y[i] += state.vy[i]*dt;
    
    //update hashmap
    int gridX= floor(state.x[i]+0.5);
    int gridY = floor(state.y[i]+0.5);
    hashmap.add(gridX,gridY,i);
    }
    
    //calculate densities and near-densities
    for(int i=0;i<particle_count;i++){
      IntList neighbours = getNeighboursWithGradients(i);
      updatePressure(i,neighbours);
      
      //perform double density relaxation
      relax(i,neighbours,dt);
    }
    
    //contain
    
    for (int i=0;i<particle_count;i++){
      //constrain the particles to a container
      contain(i);
      //calculate new velocities
      calculateVelocity(i,dt);
    }
    
    translate(width/8,0);
    state.render();
    
  }
  
  
  
  
  
  
  
  
  
