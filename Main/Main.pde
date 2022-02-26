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
  if(key == ' ' && verden.player.isMoving == true){
    verden.player.isMoving = true;
  }else{
    verden.player.isMoving = false;
  }
}
