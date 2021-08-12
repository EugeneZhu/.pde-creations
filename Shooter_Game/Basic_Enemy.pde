class BasicEnemy extends Character {
  
  int deathTimer = 60;
  boolean dead=false;
  int rotate=0;
  BasicEnemy(PVector pos, PVector vel, float cWidth, float health) {
    super(pos,vel,cWidth,health);
  }
  
  void drawMe() {
    
    //Draw the body
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.25);
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
    translate(pos.x, pos.y);
    scale(0.25);
    ellipse(75,125,75,200);
    ellipse(-75,125,75,200);
    popMatrix();
    //Draw the head
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.25);
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
    scale(0.25);
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
    scale(0.25);
    translate(75,45);
    translate(0,80);
    ellipse(0,0,75,200);
    popMatrix();
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.25);
    translate(-75,45);
    translate(0,80);
    ellipse(0,0,75,200);
    popMatrix();
    //Draw the head
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.25);
    rotate(rotate++);
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
  
  void update() {
    super.update();
}

  void hit() {
    health-=1;
  }
  
  void dead() {
    if (health<=0) {
    if (deathTimer>0) {
      deathTimer--;
    drawDyingBird();
    }
    if (deathTimer==0) {
    basicenemy.remove(this);
    score+=1;
    }
  }
}
}
