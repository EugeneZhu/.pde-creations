//final level
void drawBossLevel() {
  background(100,100,100);
  blocks.clear();
  blocks.add(new Block(new PVector(width/2, height - 300), new PVector(width*2, 40),50,50,50));
  blocks.add(new Block(new PVector(300, 900), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(900, 900), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1500, 900), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(600, 800), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1200, 800), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(300, 700), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(900, 700), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1500, 700), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(600, 600), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1200, 600), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(300, 500), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(900, 500), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1500, 500), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(600, 400), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1200, 400), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(300, 300), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(900, 300), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1500, 300), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(600, 200), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1200, 200), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(300, 100), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(900, 100), new PVector(250, 25),50,50,50));
  blocks.add(new Block(new PVector(1500, 100), new PVector(250, 25),50,50,50));
  fill(255,255,0);
  rect(1475,25,50,75);
  
  for (int i=0; i<bossenemy.size(); i++) {
    BossEnemy be=bossenemy.get(i);
    be.hitBoss(be);
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
