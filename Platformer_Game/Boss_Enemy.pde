//enemy boss class
class BossEnemy extends BasicEnemy {
  
  int bossDeathTimer=180;
  boolean dead=false;
  float scale=1;
  
  BossEnemy(PVector pos, PVector vel, PVector cWidth, float health, PImage img) {
    super(pos,vel,cWidth,health,img);
  }
  
  void drawMe() {
    
    //Draw the body
    pushMatrix();
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.5);
    image(img, -img.width/2, -img.height/2);
    popMatrix();
    popMatrix();
  }
  
  void update() {
  handleWalls();
  super.move();
  }
  
  void handleWalls() {
    if (pos.x<0) pos.x=width;
    if (pos.x>width) pos.x=0;
    if (pos.y<0) pos.y=height;
    if (pos.y>height) pos.y=0;
  }
  
}
