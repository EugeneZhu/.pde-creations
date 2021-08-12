class BossEnemy extends BasicEnemy {
  
  int bossDeathTimer=180;
  boolean dead=false;
  float scale=1;
  ArrayList<Projectile> Projectile = new ArrayList<Projectile>();
  
  BossEnemy(PVector pos, PVector vel, float cWidth, float health) {
    super(pos,vel,cWidth,health);
  }
  
  void drawMe() {
    
    //Draw the body
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(0.375);
    fill(255,215,0);
    stroke(0);
    ellipse(0,125,150,275);
    //Draw the feet
    rect(-10,225,-15,75);
    rect(15,225,15,75);
    arc(-17.5,300,40,50,-PI,0,CHORD);
    arc(22.5,300,40,50,-PI,0,CHORD);
    triangle(-17.5,300,2.5,300,-7.5,310);
    triangle(-37.5,300,-17.5,300,-27.5,310);
    triangle(2.5,300,22.5,300,12.5,310);
    triangle(22.5,300,42.5,300,32.5,310);
    popMatrix();
    //Draw the arms
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(0.375);
    translate(75,45);
    translate(0,80);
    ellipse(0,0,75,200);
    popMatrix();
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(0.375);
    translate(-75,45);
    translate(0,80);
    ellipse(0,0,75,200);
    popMatrix();
    //Draw the head
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(0.375);
    ellipse(0,0,140,140);
    fill(0);
    ellipse(-25,-25,25,25);
    ellipse(25,-25,25,25);
    fill(255);
    noStroke();
    ellipse(-30,-30,5,5);
    ellipse(20,-30,5,5);
    fill(255,255,186);
    triangle(-10,5,10,5,0,25);
    popMatrix();
  }
  
  void drawDyingBird() {
        //Draw the body
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(0.375);
    fill(0);
    stroke(0);
    ellipse(0,125,150,275);
    //Draw the feet
    rect(-10,225,-15,75);
    rect(15,225,15,75);
    arc(-17.5,300,40,50,-PI,0,CHORD);
    arc(22.5,300,40,50,-PI,0,CHORD);
    triangle(-17.5,300,2.5,300,-7.5,310);
    triangle(-37.5,300,-17.5,300,-27.5,310);
    triangle(2.5,300,22.5,300,12.5,310);
    triangle(22.5,300,42.5,300,32.5,310);
    popMatrix();
    //Draw the arms
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(0.375);
    fill(0);
    translate(75,45);
    rotate(frameCount);
    translate(0,80);
    ellipse(0,0,75,200);
    popMatrix();
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(0.375);
    translate(-75,45);
    rotate(-frameCount);
    translate(0,80);
    ellipse(0,0,75,200);
    popMatrix();
    //Draw the head
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    scale(0.375);
    fill(0);
    ellipse(0,0,140,140);
    fill(0);
    ellipse(-25,-25,25,25);
    ellipse(25,-25,25,25);
    fill(255);
    noStroke();
    ellipse(-30,-30,5,5);
    ellipse(20,-30,5,5);
    fill(255,255,186);
    triangle(-10,5,10,5,0,25);
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
  
  void update() {
  super.update();
  dead();
  }

  void checkProjectiles() {
  for (int i=0; i<Projectile.size(); i++) {
    Projectile p = Projectile.get(i);
    p.update();
    p.drawMe();
  if (dist(p.pos.x,p.pos.y,player.pos.x,player.pos.y)<50) {
    player.hit();
    p.shot(player);
  }
  if (!p.isAlive) Projectile.remove(i);
  }
  }
  
  void fire() {
    if (health>0) {
    Projectile.add(new Projectile(new PVector(pos.x,pos.y-25), new PVector(0, 15),0));
    }
  }
  
  void hit() {
    if (health>=0) {
    health-=1;
    scale *=.95;
    }
  }
  
  void dead() {
    if (health<=0) {
    if (bossDeathTimer>0) {
      bossDeathTimer--;
    drawDyingBird();
    }
    if (bossDeathTimer==0) {
    bossenemy.remove(this);
    score+=1;
    }
  }
}
}
