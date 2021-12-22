PImage ref;
float dA=0.3, dB=0.15, feed=0.035,kill=0.06;
int w=200;
int h=200;
   
OnePixel[][] grid =new OnePixel[w][h];
OnePixel[][] next =new OnePixel[w][h];
OnePixel[][] temp =new OnePixel[w][h];

public class OnePixel{
  float a;
  float b;
}

void setup(){
   size(200,200);
   background(255);
   ref = loadImage("ting.jpg");
   for(int x=0;x<w;x++){
      for (int y=0;y<h;y++){
        grid[x][y] = new OnePixel();
        next[x][y] = grid[x][y];
        grid[x][y].a= 1;
        grid[x][y].b= 0;
      } 
   }
   
   for(int i=100;i<110;i++){
     for(int j=170;j<180;j++){
       grid[i][j].b=1;
     }
   }
}

void draw(){  


      for(int x=1;x<w-1;x++){
        for(int y=1;y<h-1;y++){
        //swap
        //temp[x][y]=next[x][y];
        //abreviation
        float a=grid[x][y].a;
        float b=grid[x][y].b;
        int loc = x+ y*w;
        //diffusion reaction
        if (brightness(ref.pixels[loc])<20){
          next[x][y].a= a+1.1*(dA*laplaceA(x,y)-a*b*b+feed*(1-a));
          next[x][y].b= b+1.1*(dB*laplaceB(x,y)+a*b*b-(0.05+feed)*b);
        }else{
          next[x][y].a= a+1.1*(dA*laplaceA(x,y)-a*b*b+feed*(1-a));
          next[x][y].b= b+1.1*(dB*laplaceB(x,y)+a*b*b-(kill+feed)*b);
        }
        
        //swap
        //grid[x][y]=temp[x][y];
        }
      }
  
  loadPixels();

  //draw
  for(int x=0;x<w;x++){
    for(int y=0;y<h;y++){
      int c = floor((next[x][y].a-next[x][y].b)*255);
      int loc=x+y*w;
      if (brightness(ref.pixels[loc])<20){
        pixels[loc]=color(constrain(c,0,255),255,255);
      }else{
        pixels[loc]=color(constrain(c,0,255));
      }
      
    }
  }
  updatePixels();
  //swap
  temp=next;
  next=grid;
  grid=temp;
  
  
}

float laplaceA(int x, int y){
  float sumA=0;
            
  sumA += grid[x][y].a*(-1);
  sumA += grid[x-1][y].a*(0.2);
  sumA += grid[x+1][y].a*(0.2);
  sumA += grid[x][y-1].a*(0.2);
  sumA += grid[x][y+1].a*(0.2);
  sumA += grid[x-1][y-1].a*(0.05);
  sumA += grid[x-1][y+1].a*(0.05);
  sumA += grid[x+1][y-1].a*(0.05);
  sumA += grid[x+1][y+1].a*(0.05);
  return sumA;
 };
        
float laplaceB(int x, int y){
  float sumB=0;
            
  sumB += grid[x][y].b*(-1);
  sumB += grid[x-1][y].b*(0.2);
  sumB += grid[x+1][y].b*(0.2);
  sumB += grid[x][y-1].b*(0.2);
  sumB += grid[x][y+1].b*(0.2);
  sumB += grid[x-1][y-1].b*(0.05);
  sumB += grid[x-1][y+1].b*(0.05);
  sumB += grid[x+1][y-1].b*(0.05);
  sumB += grid[x+1][y+1].b*(0.05);
  return sumB;
};
