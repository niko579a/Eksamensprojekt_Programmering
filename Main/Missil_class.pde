class Missil extends Movement{
  PImage missil;
  
  float dropSpot;
  
  boolean droped = false;
  
  Missil(){
    missil = loadImage("missil.png");
    
    w = 15;
    h = 75;
    
    pickDropPlace();
    
    moveSpeed = 5;
  }
  
  void display(){
    image(missil, position.x, position.y, w, h);
  }
  
  void update(){
    if(droped == true){
      position.y += moveSpeed;
    }
  }
  
  void pickDropPlace(){
    dropSpot = random(25, width - 25);
    position.x = dropSpot;
  }
}
