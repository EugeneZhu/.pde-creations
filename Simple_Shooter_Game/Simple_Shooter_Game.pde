float charWidth=100;
boolean up, down, left, right;
PVector upAcc = new PVector(0,-2);
PVector downAcc = new PVector(0,2);
PVector leftAcc = new PVector(-2,0);
PVector rightAcc = new PVector(2,0);
int score=0;
int timer=0;
int shootTime=0;

Player player;
ArrayList<BasicEnemy> basicenemy=new ArrayList<BasicEnemy>();
ArrayList<BossEnemy> bossenemy=new ArrayList<BossEnemy>();
ArrayList<Health> healthpack=new ArrayList<Health>();

void setup() {
  size(1000, 800);
  restart();
    player=new Player(new PVector(width/2, height-charWidth/2), new PVector(0,0),100,200);
  for (int i=0; i<10; i++) {
    basicenemy.add(new BasicEnemy(new PVector(random(charWidth/2, width-charWidth/2), 
    random(charWidth/2/2, (height-charWidth/2)/5)), 
    new PVector(random(1,5), random(1,5)), 100, 3));
  }
  for (int i=0; i<1; i++) {
  bossenemy.remove(this);
  bossenemy.add(new BossEnemy(new PVector(random(charWidth/2, width-charWidth/2), 
  random(charWidth/2/2, (height-charWidth/2)/5)), 
  new PVector(random(1,5), random(1,5)), 100, 8));
  }
  for (int i=0; i<1; i++) {
    healthpack.add(new Health(new PVector(random(charWidth/2, width-charWidth/2), 
    random(charWidth/2, (height-charWidth/2))), 
    new PVector(random(1,5), random(1,5)), 100, 1));
  }
}

void addNewEnemy() {
  basicenemy.add(new BasicEnemy(new PVector(random(charWidth/2, width-charWidth/2), 
    random(charWidth/2/2, (height-charWidth/2)/5)), 
    new PVector(random(1, 5), random(1, 5)), 100, 3));
}

void addNewBoss() {
  bossenemy.add(new BossEnemy(new PVector(random(charWidth/2, width-charWidth/2), 
    random(charWidth/2/2, (height-charWidth/2)/5)), 
    new PVector(random(1, 5), random(1, 5)), 100, 8));
}

void addNewHealth() {
  healthpack.add(new Health(new PVector(random(charWidth/2, width-charWidth/2), 
    random(charWidth/2, (height-charWidth/2))), 
    new PVector(random(1,5), random(1,5)), 100, 1));
}

void draw() {
  if (timer==0) {
    drawStart();
  }
  
  if (timer==0 && mousePressed) {
    timer=1;
  }
  
  if (timer==1) {
    drawPlaying();
  }
  
  if (timer==2) {
    drawGameOver();
  }
  
  
}

void drawStart() {
  background(255,0,0);
  textSize(100);
  textAlign(CENTER);
  text("Bird Invasion!!!",width/2, height/2);
  textSize(50);
  text("Click to Play!!!",width/2, height/2+200);
  
}

void drawPlaying() {
  background(120, 120, 255);
  shootTime++;
  player.update();
  player.drawMe();
  player.drawProjectile();
  if (up) player.accelerate(upAcc);
  if (left) player.accelerate(leftAcc);
  if (right) player.accelerate(rightAcc);
  if (down) player.accelerate(downAcc);
  player.damp();
  drawScore();
  
  if (basicenemy.size()<10&&frameCount%60==0) {
    addNewEnemy();
  }
  
  if (bossenemy.size()<1&&frameCount%300==0) {
    addNewBoss();
  }
  
  if (healthpack.size()<1&&frameCount%300==0) {
    addNewHealth();
  }
  
  for (int i=0; i<basicenemy.size(); i++) {
    BasicEnemy be=basicenemy.get(i);
    if (be.health>0) {
    be.update();
    be.drawMe();
    be.hitCharacter(be);
    }
    if (be.health<=0) {
    be.dead();
    be.update();
    }
  }
  
  for (int i=0; i<bossenemy.size(); i++) {
    BossEnemy be=bossenemy.get(i);
    if (be.health>0) {
    be.update();
    be.drawMe();
    be.hitBoss(be);
    be.checkProjectiles();
    be.fire();
    }
    if (be.health<=0) {
    be.update();
    be.dead();
    }
    
  }
  
  for (int i=0; i<healthpack.size(); i++) {
    Health h=healthpack.get(i);
    h.update();
    h.drawMe();
    h.hitHealth(h);
  }
}

void mousePressed() {
  if (timer==2) {
    restart();
  }
}

void restart() {
  player=new Player(new PVector(width/2, height-charWidth/2), new PVector(0,0),100,200);
  timer=0;
  score=0;
  }


void drawGameOver() {
  pushMatrix();
  background(255,0,0);
  textSize(150);
  fill(255,255,0);
  text("Game Over",width/2, height/2);
  textSize(50);
  text("Click to Play Again",width/2, height/2+200);
  popMatrix();
}

  
  void keyPressed() {
  if(key==CODED) {
    if (keyCode==LEFT) left=true;
    if (keyCode==RIGHT) right=true;
    if (keyCode==UP) up=true;
    if (keyCode==DOWN) down=true;
   
  }
   if (key==' ') {
      player.fire();
    }
}

void keyReleased() {
    if(key==CODED) {
      if (keyCode==LEFT) left=false;
      if (keyCode==RIGHT) right=false;
      if (keyCode==UP) up=false;
      if (keyCode==DOWN) down=false;
    }
}

void drawScore() {
  pushMatrix();
  fill(0);
  textSize(25);
  text("Score:" + score,75,25);
  text("Health:" + player.health,800,25);
  popMatrix();
}
