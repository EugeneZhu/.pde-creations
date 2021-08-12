//first level
void drawLevel1() {
  background(100,100,100);
  blocks.clear();
  blocks.add(new Block(new PVector(225, 890), new PVector(125, 20),50,50,50));
  blocks.add(new Block(new PVector(325, 750), new PVector(50, 10),50,50,50));
  blocks.add(new Block(new PVector(550, 700), new PVector(140, 1),50,50,50));
  blocks.add(new Block(new PVector(850, 750), new PVector(140, 10),50,50,50));
  blocks.add(new Block(new PVector(1050, 600), new PVector(140, 10),50,50,50));
  blocks.add(new Block(new PVector(900, 450), new PVector(250, 10),50,50,50));
  blocks.add(new Block(new PVector(700, 325), new PVector(50, 10),50,50,50));
  blocks.add(new Block(new PVector(450, 200), new PVector(300, 10),50,50,50));
  blocks.add(new Block(new PVector(1050, 325), new PVector(50, 10),50,50,50));
  blocks.add(new Block(new PVector(1100, 200), new PVector(50, 10),50,50,50));
  blocks.add(new Block(new PVector(1500, 100), new PVector(700, 10),50,50,50));
  blocks.add(new Block(new PVector(width/2, height - 300), new PVector(width*2, 40),50,50,50));
  fill(50,50,50);
  rect(0,height-300,width,height);
  fill(255,0,0);
  rect(100,900,200,50);
  fill(160,82,45);
  rect(80,850,20,125);
  rect(280,950,20,25);
  
  rect(480,700,140,260);
  fill(30,30,30,100);
  rect(width-50,100,30,880);
  
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
