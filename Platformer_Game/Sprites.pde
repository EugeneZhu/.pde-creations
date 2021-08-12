//sprite animation
PImage[]  playerFramesMoving=new PImage[15];
PImage[]  playerFramesIdling=new PImage[15];
PImage[]  playerFramesAttack=new PImage[1];

void loadPlayerFrames() {
  loadFrames(playerFramesMoving, "Walk_");
  loadFrames(playerFramesIdling, "Idle_");
  loadFrames(playerFramesAttack, "Jump_");
}

void loadFrames(PImage[] ar, String fname) {
  for (int i=0; i<ar.length; i++) {
    PImage frame=loadImage(fname+i+".png");
    ar[i]=frame;
  }
}
