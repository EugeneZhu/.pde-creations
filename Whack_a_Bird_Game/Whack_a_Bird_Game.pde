int numCharacters=9;
int numSpecialCharacters=1;
int space=10;
int score;
int timer;
int deathTimer;
boolean normalPlayTime;
boolean dead = false;


ArrayList<Bird> characters = new ArrayList<Bird>();
ArrayList<SpecialBird> specialbird = new ArrayList<SpecialBird>();


void setup() {
  size(1000, 1000);
  textSize(30);
  PImage mouse = loadImage("Lightsaber.png");
  cursor(mouse,0,0);
  for (int i=0;i<numCharacters;i++) {
    addNewCharacter();
  }
  
  for (int i=0;i<numSpecialCharacters;i++) {
    addNewSpecialCharacter();
  }
}

void addNewCharacter() {
  int bx=(int)random(150, width-150); 
  int by=(int)random(70, height-310); 
  characters.add(new Bird(bx, by, (int)random(-5, 5), (int)random(-5, 5)));
}

void addNewSpecialCharacter() {
  int bx=(int)random(150, width-150); 
  int by=(int)random(70, height-310); 
  specialbird.add(new SpecialBird(bx, by, (int)random(-5, 5), (int)random(-5, 5)));
}

void draw() {
  frameRate();
  if (timer == 0) {
    drawStart();
    score=0;
  }
  
  if (timer == 0 && mousePressed) {
    timer++;
  }
  
  
  if (timer > 0) {
    timer++;
  }
    
  
  if (timer > 0 && timer < 600) {
    drawPlaying();
    drawScore();
  }
  
  if (timer>=600) {
    drawGameOver();
    timer=-1;
    }
    
  if (timer==-1&&mousePressed&&dist(mouseX,mouseY,500,1700)<1000) {
    timer=1;
    timer++;
    score=0;
  }
}

void drawStart() {
  fill(255);
  rect(0,0,width,height);
  fill(0);
  textSize(100);
  text("Whack-a-Bird",150,height/2);
  textSize(50);
  text("Click to Play!",350, 600);
  textSize(30);
}
  
void drawPlaying() {
  fill(120, 120, 255, 50);
  rect(0, 0, width, height); 


  for (int i=0;i<characters.size();i++) {
    
    Bird currCharacter = characters.get(i);
    currCharacter.update();
    if (mousePressed&&dist(mouseX, mouseY, currCharacter.x, currCharacter.y+30)<100) {
      characters.remove(i);
      
    if(currCharacter.isAlive()&&mousePressed&&dist(mouseX,mouseY,currCharacter.x,currCharacter.y+30)<100) {
      deathTimer++;
      score++;
      currCharacter.drawDyingBird();
      currCharacter.kill();
      currCharacter.update();
      addNewCharacter();
      }
    }
}

for (int i=0;i<specialbird.size();i++) {
    
    SpecialBird currSpecialCharacter = specialbird.get(i);
    currSpecialCharacter.update();
    if (mousePressed&&dist(mouseX, mouseY, currSpecialCharacter.x, currSpecialCharacter.y+30)<100) {
      specialbird.remove(i);
      
    if(currSpecialCharacter.isAlive()&&mousePressed&&dist(mouseX,mouseY,currSpecialCharacter.x,currSpecialCharacter.y+30)<100) {
      dead=true;
      score++;score++;score++;score++;score++;
      currSpecialCharacter.drawDyingBird();
      currSpecialCharacter.kill();
      currSpecialCharacter.update();
      addNewSpecialCharacter();
      }
    }
}
}

void drawScore() {
  pushMatrix();
  fill(0);
  textSize(30);
  text("Score: "+score+"",75,50);
  popMatrix();
}

void frameRate() {
  println(timer);
  
}

void drawGameOver() {
  pushMatrix();
  background(128,0,0);
  textAlign(CENTER);
  textSize(100);
  text("GAME OVER", width/2, height/2);
  textSize(50);
  text("Your score : "+score, width/2, 600);
  text("Click Here to Play Again!", width/2, 800);
  fill(255,0,0);
  textAlign(CENTER);
  popMatrix();
}
