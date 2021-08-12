import processing.sound.*;
SoundFile file;
float speed = 3;
PVector upForce = new PVector(0, -speed * 25);
PVector leftForce = new PVector(-speed, 0);
PVector rightForce = new PVector(speed, 0);
//global variables
boolean up, left, right;
float grav = 10;
PVector gravForce = new PVector(0, grav);
PImage img, enemyImg, bossImg, bulletImg, dead, win;
float level=0;

Player player;
ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<BasicEnemy> basicenemy=new ArrayList<BasicEnemy>();
ArrayList<BossEnemy> bossenemy=new ArrayList<BossEnemy>();

//enables player movement
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) up = true;
    else if (keyCode == LEFT) left = true;
    else if (keyCode == RIGHT) right = true;
  }
    player.walk();
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) up = false;
    else if (keyCode == LEFT) left = false;
    else if (keyCode == RIGHT) right = false;
  }
}

//sets up the initial values and objects
void setup() {
  size(1820, 1280); 
  frameRate(24);
  loadPlayerFrames();
  stroke(200);
  strokeWeight(2);
  fill(63);
  player=new Player(new PVector(100, 100), new PVector(0,0), new PVector(32, 32), 5.0, playerFramesIdling[0]);
  player.jumping = true;
  enemyImg=loadImage("enemy.png");
  bossImg=loadImage("boss.png");
  dead=loadImage("Dead.png");
  win=loadImage("Jump.png");
    basicenemy.add(new BasicEnemy(new PVector(1200, 500), 
    new PVector(5, 0), new PVector(50,50), 1, enemyImg));
  bossenemy.add(new BossEnemy(new PVector(random(0, width),random(0, height)), 
    new PVector(random(10,25), random(10,25)), new PVector(50,50), 1, bossImg));
    
  file=new SoundFile(this,"Jump.mp3");
}

//draws the levels
void draw() {

  if (level==0)
  drawStart();
  if (level==0 && mousePressed)
  level+=0.5;
  if (level==0.5)
  drawIntroText();
  if (level==0.5 && fadeout<=100)
  level+=0.5;
  if (level==1) {
  drawLevel1();
  drawScore();
  }
  if (level==2) {
  drawLevel2();
  drawScore();
  }
  if (level==3) {
  drawBossLevel();
  drawScore();
  }
  if (level==-1) {
  drawGameOver();
  }
  if (level==-1 && mousePressed) {
  level=0.5;
  player.health=5;
  }
  if (level==4) {
  drawWinScreen();
  }
  if (level==4 && mousePressed) {
  level=0;
  player.health=5;
  }
  
}

//start screen
void drawStart() {
  img=loadImage("Prison.jpg");
  image(img,0,0,1820,1280);
  textSize(128);
  fill(255,0,0);
  text("ESCAPE FROM PRISON",250,height/2);
}

//end screen
void drawGameOver() {
  pushMatrix();
  background(255,0,0);
  textSize(150);
  textAlign(CENTER);
  fill(255,255,0);
  image(dead,100,100);
  text("Game Over",width/2, height/2);
  textSize(50);
  text("Click to Play Again",width/2, height/2+200);
  popMatrix();
}


//score screen
void drawScore() {
  pushMatrix();
  fill(0);
  textSize(25);
  text("Health:" + player.health,width-200,50);
  if (player.health==0) {
    level=-1;
  }
  popMatrix();
}
