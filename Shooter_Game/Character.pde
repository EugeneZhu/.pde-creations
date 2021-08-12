class Character {
  PVector pos, vel;
  float cWidth, health;
  Character(PVector pos, PVector vel, float cWidth, float health) {
    this.pos = pos;
    this.vel = vel;
    this.cWidth = cWidth;
    this.health = health;
  }
  
  void move() {
    pos.add(vel);
  }
  
  void update() {
    move();
    handleWalls();
  }
  
  void handleWalls() {
    if (pos.x<-cWidth/2) pos.x=width+cWidth/2;
    if (pos.x>width+cWidth/2) pos.x=-cWidth/2;
    if (pos.y<-cWidth/2) pos.y=height+cWidth/2;
    if (pos.y>height+cWidth/2) pos.y=-cWidth/2;
  }
  
  void hitCharacter(BasicEnemy basicenemy) {
    if (dist(player.pos.x,player.pos.y,basicenemy.pos.x+5,basicenemy.pos.y+25)<cWidth/1.25&&basicenemy.health>0) {
      player.hit();
      player.dead();
    }
  }
  
  void hitBoss(BossEnemy bossenemy) {
    if (dist(player.pos.x,player.pos.y-10,bossenemy.pos.x,bossenemy.pos.y+15)<cWidth/1.25&&bossenemy.health>0) {
      player.hit();
      player.dead();
    }
  }
  
  void hitHealth(Health health) {
    if (dist(player.pos.x,player.pos.y-10,health.pos.x,health.pos.y+15)<cWidth/1.25) {
      player.heal();
      health.dead();
      player.dead();
    }
  }
  
}
