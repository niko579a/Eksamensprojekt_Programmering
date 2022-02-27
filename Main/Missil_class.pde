class Missil extends Movement{
  PImage missil;
  
  float dropSpot;
  
  boolean droped = false;
  boolean display = true;
  
  Missil(){
    missil = loadImage("missil.png");
    
    w = 15;
    h = 75;
    
    pickDropPlace();
    
    moveSpeed = 5;
  }
  
  void display(){
    if(display == true){
      image(missil, position.x, position.y, w, h);
    }
  }
  
  void update(Soldier player){
    if(droped == true){
      position.y += moveSpeed;
    }
    
    checkIfHitPlayer(player);
  }
  
  void pickDropPlace(){
    dropSpot = random(25, width - 25);
    position.x = dropSpot;
  }
  
  void checkIfHitPlayer(Soldier player){
    PVector topLPunkt = new PVector(position.x, position.y);
    PVector topRPunkt = new PVector(position.x + w, position.y);
    PVector buttomLPunkt = new PVector(position.x, position.y + h);
    PVector buttomRPunkt = new PVector(position.x + w, position.y + h);
    
    if(display == true){
      if(topLPunkt.x >= player.position.x && topLPunkt.x <= player.position.x + player.w && topLPunkt.y >= player.position.y && topLPunkt.y <= player.position.y + player.h){
        missilHit(player);
        return;
      }
    
      if(topRPunkt.x >= player.position.x && topRPunkt.x <= player.position.x + player.w && topRPunkt.y >= player.position.y && topRPunkt.y <= player.position.y + player.h){
        missilHit(player);
        return;
      }
    
      if(buttomLPunkt.x >= player.position.x && buttomLPunkt.x <= player.position.x + player.w && buttomLPunkt.y >= player.position.y && buttomLPunkt.y <= player.position.y + player.h){
        missilHit(player);  
        return;
      }
    
      if(buttomRPunkt.x >= player.position.x && buttomRPunkt.x <= player.position.x + player.w && buttomRPunkt.y >= player.position.y && buttomRPunkt.y <= player.position.y + player.h){
        missilHit(player);
        return;
      }
    }
  }
  
  void missilHit(Soldier player){
    player.life--;
    display = false;
  }
  
  boolean checkIfUnderGround(){
    if(position.y >= height){
      return true;
    }else {
      return false;
    }
  }
}
