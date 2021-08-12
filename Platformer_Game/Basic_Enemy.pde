//basic enemy class
class BasicEnemy extends Character {
  
  int deathTimer = 60;
  boolean dead=false;
  BasicEnemy(PVector pos, PVector vel, PVector cWidth, float health, PImage img) {
    super(pos,vel,cWidth,health,img);
  }
  
  void drawMe() {
    
    //Draw the body
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.35);
    image(img, -img.width/2, -img.height/4);
    popMatrix();
  }
  
  void update() {
    super.update();
    super.move();
}

  void hit() {
    health-=1;
  }
}
