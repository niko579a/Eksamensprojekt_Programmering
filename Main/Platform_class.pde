class Platform{
  float x;
  float y;
  float w;
  float h = 7;
  
  boolean showPlatform = true; //gør at linjen i bunden kan blive usynlig
  //isGround
  
  FirstAid aidKasse;
  
  Platform(float x_, float y_, float w_){
    x = x_;
    y = y_;
    w = w_;
    
    aidKasse = new FirstAid();
    
    aidKasse.position.x = (x + w/2) - aidKasse.w/2;
    aidKasse.position.y = y - aidKasse.h - 5;
  }
  
  //tegner platformene
  void display(){ 
    if(showPlatform == true){
      fill(0);
      rect(x, y, w, h);
    }
    
    aidKasse.display();
  }
  
  void isSoldierOnPlatform(Soldier player){
    if(player.position.x >= (this.x - player.w + 10) && player.position.x <= (this.x + this.w - 10) && (player.position.y + player.h) >= this.y && (player.position.y + player.h) <= (this.y + this.h)){
      player.isOnPlatform = true;
      player.currentJumpHeight = 0;
      player.position.y = (this.y - player.h);
    }
  }
  
  void isSoldierHittingPlatform(Soldier player){
    if(showPlatform == true){
      if(player.position.x >= this.x && player.position.x <= (this.x + this.w) && player.position.y < (this.y + this.h) && player.position.y > this.y){
        player.currentJumpHeight = player.jumpMaxHeight;
      }
    }
  }
}
