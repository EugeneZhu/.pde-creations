//player subclass
class Player extends Character{
  //fields
  float damp = 0.8; //constant damping factor
  boolean jumping = false;
  Block block = null;
  int currFrame = 0;
  PImage[] activeFrames; 
  int animationRate = 6;
  
  //a constructor to initialize the fields above with initial values
  Player(PVector pos, PVector vel, PVector cWidth, float health, PImage playerImg) {
    super(pos, vel, cWidth, health, playerImg);
    vel = new PVector(); //must create instance
    for (int i = 0; i < playerFramesMoving.length; i++) {
    }
    
  }
  
  
  //move method, PVector force as parameter, add to acceleration
  void move(PVector acc) {
    vel.add(acc);
  }
  
  //physics for the character
  void update() {
    super.update();
    vel.mult(damp);
    pos.add(vel);
    
    
  }
  
  //enables jumping
  void jump(PVector upAcc) {
      move(upAcc);
      jumping = true;
  }
  
  //enables interaction with blocks
  void landOn(Block b) {
    jumping = false;
    block = b;
    pos.y = b.pos.y - cWidth.y /2 - b.dim.y / 2;
    vel.y = 0;
  }
  
  //enable falling physics
  void fall() {
    vel.y *= -1;
  }
  
  //draws character
  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.25);
    image(img, -img.width/3.25, -img.height/1.25);
    popMatrix();
  }
  
  //displays health
  void hit() {
    health-=1;
    println(health);
  }
  
  //animation frames
  void walk() {
    activeFrames=playerFramesMoving;
  }

  void attack() {
    activeFrames=playerFramesAttack;
  }

  void sit() {
    activeFrames=playerFramesIdling;
  }
}
