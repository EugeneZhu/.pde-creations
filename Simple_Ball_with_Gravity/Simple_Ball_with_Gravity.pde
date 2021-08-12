float velx=0, vely=0, posx=0, posy=height/2, speedx=1, speedy=0, gravity=0.1;

void setup() {
  size(1000,800);
  background(255,0,0);
  
}

void draw() {
  background(255,0,0);
  velx=velx+speedx;//Make the ball move on the x-axis
  vely=vely+speedy;
  speedy=speedy+gravity;//Acceleration adds 0.1 to speedy each draw execute
  translate(velx, vely);//translate using vel, so when handling walls use velx and vely
  ellipse(posx,posy,50,50);
  
  if(velx>width || velx<0) {
    speedx*=-1;
  }
  if(vely>height-75) {
    speedy*=-0.95; //makes speedy go the opposite direction after reaching the bottom and dampen it 
  }
}
