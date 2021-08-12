//superclass character
class Character {
  PVector pos, vel, cWidth;
  float health;
  PImage img;
  Character(PVector pos, PVector vel, PVector cWidth, float health, PImage img) {
    this.pos = pos;
    this.vel = vel;
    this.img = img;
    this.cWidth = cWidth;
    this.health = health;
  }
  
  void move() {
    pos.add(vel);
  }
  
  void update() {
    handleWalls();
  }
  
  void handleWalls() {
    if (player.pos.x<0) {player.vel.x=0; player.pos.x=10;}
    if (player.pos.x>width && level==1) {player.pos.x=0; player.pos.y=300; level+=1;}
    if (player.pos.x>width-50 && player.pos.y>100 && level==1) player.pos.x=width-50;
    if (player.pos.x>width && level==2) {player.pos.x=0; player.pos.y=800; level+=1;}
    if (player.pos.x>width && level==3) {player.pos.x=0; player.pos.y=300; level=-1;}
    if (player.pos.y>height) {player.pos.x=100; player.pos.y=100; player.health-=1;}
    if (player.pos.x>width-50 && player.pos.y>100 && level==3) player.pos.x=width-50;
    if (player.pos.x>1475 && player.pos.y>25 && player.pos.x<1525 && player.pos.y<100 && level==3) {level+=1;}
  }
  
  void hitCharacter(BasicEnemy basicenemy) {
    if (dist(player.pos.x,player.pos.y,basicenemy.pos.x+5,basicenemy.pos.y+25)< 50 && basicenemy.health>0) {
      player.hit();
      player.pos.x=100;
      player.pos.y=100;
    }
  }
  
  void hitBoss(BossEnemy bossenemy) {
    if (dist(player.pos.x,player.pos.y,bossenemy.pos.x+5,bossenemy.pos.y+25)< 250 && bossenemy.health>0) {
      player.hit();
      player.pos.x=100;
      player.pos.y=height-400;
    }
  }
  
}
