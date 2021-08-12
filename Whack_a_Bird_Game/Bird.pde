class Bird {

  //fields
  int x;
  int y;
  int yVel;
  int xVel;
  float angle1=0;
  float angle2=0;
  float angleInc=0.01;
  int deathTimer = -1;
  int rotateTime;
  float wingRotPos = PI/12;
  float wingRotVel = 0.07;

  Bird(int x,int y ,int xVel,int yVel) {
    this.x=x;
    this.y=y;
    this.xVel=xVel;
    this.yVel=yVel;
  }

  void update() {
    move();
    handleCollision();
    if (deathTimer==-1) {
      drawMe();
    }
    if (deathTimer==-1) {
    }
    
    if (deathTimer==0) {
      characters.remove(this);
    }
    
    if (deathTimer>0) {
      rotateTime++;
      drawDyingBird();
      if (rotateTime==120) {
      deathTimer--;
      }
    }
  }
  
  void drawDyingBird() {
        //Draw the body
    pushMatrix();
    translate(x, y);
    scale(0.5);
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
    translate(x, y);
    scale(0.5);
    translate(75,45);
    rotate(angle1);
    translate(0,80);
    ellipse(0,0,75,200);
    angle1 = angle1+angleInc*-1;
    if(abs(angle1) > PI/2) angleInc *=-1;
    popMatrix();
    pushMatrix();
    translate(x, y);
    scale(0.5);
    translate(-75,45);
    rotate(angle2);
    translate(0,80);
    ellipse(0,0,75,200);
    angle1 = angle1+angleInc;
    if(abs(angle1) > PI/2) angleInc *=-1;
    popMatrix();
    //Draw the head
    pushMatrix();
    translate(x, y);
    scale(0.5);
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

  //methods
  void move() {

    y+=yVel;
    x+=xVel;
  }

  void drawMe() {
    
    //Draw the body
    pushMatrix();
    translate(x, y);
    scale(0.5);
    fill(220,20,60);
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
    translate(x, y);
    scale(0.5);
    translate(75,45);
    rotate(angle1);
    translate(0,80);
    ellipse(0,0,75,200);
    angle1 = angle1+angleInc*-1;
    if(abs(angle1) > PI/2) angleInc *=-1;
    popMatrix();
    pushMatrix();
    translate(x, y);
    scale(0.5);
    translate(-75,45);
    rotate(angle2);
    translate(0,80);
    ellipse(0,0,75,200);
    angle2 = angle2+angleInc*1;
    if(abs(angle2) > PI/2) angleInc *=-1;
    popMatrix();
    //Draw the head
    pushMatrix();
    translate(x, y);
    scale(0.5);
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
  
  void handleCollision() {
    if (x<-150) x=width+150; 
    if (x>width+150) x=-150;
    if (y<-310) y=height+70;
    if (y>height+70) y=-310;
  }
  
  boolean isAlive() {
    return deathTimer==-1;
  }
  
  void kill() {
    deathTimer=60;
    xVel=0;
    yVel=0;
  }
}
