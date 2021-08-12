class Player extends Character { 
  float damp = 0.8;
  ArrayList<Projectile> Projectile = new ArrayList<Projectile>();
  
  Player(PVector pos, PVector vel, float cWidth, float health) {
    super(pos, vel, cWidth, health);
  }
  
  void drawMe() {
    pushMatrix();
    translate(pos.x,pos.y);
    fill(0,255,0);
    rect(-40,0,80,40);
    rect(-5,-40,10,40);
    rect(-10,-40,20,10);
    popMatrix();
  }
  
  void drawProjectile() {
    for (int i=0;i<Projectile.size();i++) {
      Projectile P=Projectile.get(i);
      P.update();
      P.drawMe();
      for (int j=0; j<basicenemy.size(); j++) {
        BasicEnemy be = basicenemy.get(j);
        P.hit(be);
      } 
      
      for (int j=0; j<bossenemy.size(); j++) {
        BossEnemy be = bossenemy.get(j);
        P.hit(be);
      } 
      if (!P.isAlive) Projectile.remove(i);
      }
    }
  
  void damp() {
    vel.mult(damp);
  }
  
  void accelerate(PVector acc) {
    vel.add(acc);
  }
  
  void fire() {
    Projectile.add(new Projectile(new PVector(pos.x,pos.y-25), new PVector(0,-15),255));
  }
  
  void hit() {
    health-=1;
    println(health);
  }
  
  void dead() {
    if (health<=0) {
    timer=2;
    }
  }
  
  void heal() {
    health+=10;
  }
  
}
