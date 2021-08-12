class Projectile {
  PVector pos, vel, dim;
  boolean isAlive;
  int fill;
  
  Projectile(PVector pos, PVector vel, int fill) {
    this.pos=pos;
    this.vel=vel;
    this.fill=fill;
    dim= new PVector(10,10);
    isAlive=true;
  }
  
  void drawMe() {
    pushMatrix();
    translate(pos.x,pos.y);
    noStroke();
    fill(fill);
    ellipse(0,0,dim.x,dim.y);
    popMatrix();
  }
  
  void hit(BasicEnemy be) {
    if(abs(pos.x-be.pos.x)<25 && abs(pos.y-be.pos.y)<75) {
      be.hit();
      be.dead();
      isAlive=false;
      }
  }
  
  
  
  void hit(BossEnemy be) {
    if(abs(pos.x-be.pos.x)<37.5 && abs(pos.y-be.pos.y)<112.5) {
      be.hit();
      be.dead();
      isAlive=false;
    }
  }
  
  void hit(Health h) {
    if(abs(pos.x-h.pos.x)<25 && abs(pos.y-h.pos.y)<75) {
      h.hit();
      h.dead();
      isAlive=false;
      }
  }
  
  void shot(Player p) {
    if(abs(pos.x-p.pos.x)<37.5 && abs(pos.y-p.pos.y)<112.5) {
      p.hit();
      p.dead();
      isAlive=false;
    }
  }
  
  void move() {
    pos.add(vel);
  }
  
  void handleWalls() {
    if(abs(pos.x-width/2)>width/2||abs(pos.y-height/2)>height/2) {
      isAlive=false;
    }
  }
  
  void update() {
    move();
    handleWalls();
  }
}
