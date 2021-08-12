//intro text to game
int timeDelay = 8000;
int time = 0;
int lastTime = 0; 
int fadeout = 255;
int fadein = -50; 
 
boolean textfadesin = true;
 
 
void drawIntroText() {
  background(0);
 
  textSize(50);
  textAlign(CENTER);
  if (textfadesin) {
    fill(255, fadein); 
    fadein++;
  } else {
    fill(255, fadeout); 
    fadeout--;
  }
 
  text("You are a prisoner, falsely accused of crimes you didn't commit.", width/2, 400); 
  text("Now you must escape.", width/2, 800); 
  if (millis() - time >= timeDelay) {
    time = millis();
    textfadesin = !textfadesin;
    fadein = 0;
    fadeout = 255;
  }
}
