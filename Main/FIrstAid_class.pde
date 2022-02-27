class FirstAid extends Movement{
  PImage kasse;
  
  boolean isDrawn = false; //fortæller om kassen er tegnet eller ej
  
  FirstAid(){
    kasse = loadImage("kasse.png");
    
    w = 40;
    h = 40;
  }
  
  void display(){
    if(isDrawn == true){
      image(kasse, position.x, position.y, w, h);
    }
  }
  
  void ifCollected(Soldier player, World verden){
    PVector playerPickupPoint = new PVector(player.position.x + player.w/2, player.position.y + player.h - 20); 
    
    if(isDrawn == true){
      if(playerPickupPoint.x >= position.x && playerPickupPoint.x <= position.x + w && playerPickupPoint.y >= position.y && playerPickupPoint.y <= position.y + h ){
        if(player.life < 5){
          player.life++;
          verden.shownAidKasser--;
          isDrawn = false;
          return;
        }
      }
    }
  }
}
