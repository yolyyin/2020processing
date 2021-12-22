class Hashmap{
  int hwidth;
  int  hheight;
  IntList[] grid;
  
  Hashmap(int w,int h){
    hwidth=w;
    hheight=h;
    grid = new IntList[hwidth*hheight];
    for(int i=0;i<grid.length;i++){
    grid[i]=new IntList();
    }
  } 
  
  void clear(){
    for (int i=0;i<grid.length;i++){
      grid[i].clear();
    }
  }
  //add prticle_index to each grid
  void add(int x,int y,int particle_index){
    x=constrain(x,0,hwidth-1);
    y=constrain(y,0,hheight-1);
    int index=x+y*hwidth;
    grid[index].append(particle_index);
  }
  
  IntList query(int x,int y){
     x=constrain(x,0,hwidth-1);
     y=constrain(y,0,hheight-1);
     int index=x+y*hwidth;
     return grid[index];
  }
  
  IntList queryWithRadius(int x,int y,float radius){
    int left=max(round(x-radius),0);
    int right=min(round(x+radius),hwidth-1);
    int bottom=max(round(y-radius),0);
    int top=min(round(y+radius),hheight-1);
    
    IntList result=new IntList();
    for(int i=left;i<=right;i++){
      for(int j=bottom;j<=top;j++){
        IntList query=query(i,j);
        for (int k=0;k<query.size();k++){
          result.append(query.get(k));
        }
      }
    }
    
    return result;
  }
}
