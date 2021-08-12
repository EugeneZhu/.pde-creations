class Health extends Character {
  
  int deathTimer = 60;
  boolean dead=false;
  Health(PVector pos, PVector vel, float cWidth, float health) {
    super(pos,vel,cWidth,health);
  }
  
  void drawMe() {
    
    //Draw the body
    pushMatrix();
    translate(pos.x,pos.y);
    noStroke();
    fill(0,255,0);
    circle(0,0,100);
    fill(255,0,0);
    rect(-5,-25,10,50);
    rect(-25,-5,50,10);
    popMatrix();
    
  }
  
  
  void hit() {
    health-=1;
  }
  
  void dead() {
    deathTimer--;
    dead=true;
    healthpack.remove(this);
}
}
