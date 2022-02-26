class Plane extends Movement{
  PImage fly;
  
  int pickSide = int(random(0, 2));
  
  boolean hasBeenThere = false;
  
  Missil bombe;
  
  Plane(){
    w = 180;
    h = 180;
    
    if(pickSide == 0){
      spawnLeft();
    }else {
      spawnRight();
    }
    
    moveSpeed = 10;
    
    bombe = new Missil(); 
    bombe.position.y = position.y;
  }
  
  void display(){
    image(fly, position.x, position.y, w, h);
    if(bombe.droped == true){
      bombe.display();
    }
  }
  
  void update(){
    if(pickSide == 0){
      position.x += moveSpeed;
      if(position.x >= bombe.dropSpot){
        bombe.droped = true;
      }
    }else {
      position.x -= moveSpeed; 
      if(position.x <= bombe.dropSpot){
        bombe.droped = true;
      }
    }
    
    if(bombe.droped == true){
      bombe.update();
    }
  }
  
  void spawnLeft(){
    float randomX = random(-1000, (0 - w - 10));
    float randomY = random(10, 100);
    
    position.x = randomX;
    position.y = randomY;
    
    fly = loadImage("flyL.png");
  }
  
  void spawnRight(){
    float randomX = random((width + 1000), (width + w + 10));
    float randomY = random(10, 100);
    
    position.x = randomX;
    position.y = randomY;
    
    fly = loadImage("flyR.png");
  }
  
  void beenThere(){
    if(pickSide == 0){
      if(hasBeenThere == false && (position.x + w) >= 0){
        hasBeenThere = true;
      }
    }else {
      if(hasBeenThere == false && position.x <= width){
        hasBeenThere = true;
      }
    }
  }
  
  boolean checkIfGone(){
    if(pickSide == 0){
      if(position.x >= width){
        return true;
      }else {
        return false;
      }
    }else {
      if(position.x + w <= 0){
        return true;
      }else {
        return false;
      }
    }
  }
}
