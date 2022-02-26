class FirstAid extends Movement{
  PImage kasse;
  
  FirstAid(){
    kasse = loadImage("kasse.png");
    
    w = 10;
    h = 10;
  }
  
  void display(){
    image(kasse, position.x, position.y, w, h);
  }
}
