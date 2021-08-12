//second level
void drawLevel2() {
  background(100,100,100);
  blocks.clear();
  blocks.add(new Block(new PVector(100, height/3), new PVector(250, 10),50,50,50));
  blocks.add(new Block(new PVector(400, height/3+100), new PVector(200, 10),50,50,50));
  blocks.add(new Block(new PVector(700, height/3), new PVector(200, 10),50,50,50));
  blocks.add(new Block(new PVector(1300, 580), new PVector(800, 10),50,50,50));
  for (int i=0; i<basicenemy.size(); i++) {
    BasicEnemy be=basicenemy.get(i);
    if (be.pos.x>1600) be.vel.x =-5;
    if (be.pos.x<1200) be.vel.x =5;
    be.hitCharacter(be);
    be.update();
    be.drawMe();
  }
  
  
  if (up && !player.jumping) {
    player.jump(upForce);
    file.play();
    file.amp(0.05);
  }
  if (left) player.move(leftForce);
  if (right) player.move(rightForce);

  player.update();
  println(player.health);
  if (player.block != null) {
    if (!player.block.isOn(player)) {
      player.jumping = true;
    }
  }
  if (player.jumping) {
    player.move(gravForce);
    for (int i = 0; i < blocks.size(); i++) {
      Block b = blocks.get(i);
      if (b.check(player)) {
        if (player.vel.y > 0) {
          player.landOn(b);
        }
        else {
          player.fall();
        }
      }
    }
  }
  for (int i = 0; i < blocks.size(); i++) {
    blocks.get(i).drawMe();
  }
  
  player.drawMe();
}
