World verden; 

void setup(){
  size(1400, 750);
  
  verden = new World();
}

void draw(){
  clear();
  
  verden.display();
  verden.update();
}

void keyPressed(){
  verden.player.move();
  verden.player.jump();
}

void keyReleased(){
  verden.gameKeys();
}

void mousePressed() {
  verden.gameMouse();
}
