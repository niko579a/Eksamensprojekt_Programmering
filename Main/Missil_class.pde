class Missil extends Movement{
  PImage missil;
  
  Missil(){
    missil = loadImage("missil.png");
    
    w = 25;
    h = 100;
  }
  
  void display(){
    image(missil, position.x, position.y, w, h);
  }
  
  void update(){
  }
}
