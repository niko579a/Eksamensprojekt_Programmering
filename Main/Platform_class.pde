class Platform{
  float x;
  float y;
  float w;
  float h = 8;
  
  boolean showPlatform = true; //gør at linjen i bunden kan blive usynlig
  //isGround
  
  Platform(float x_, float y_, float w_){
    x = x_;
    y = y_;
    w = w_;
  }
  
  //tegner platformene
  void display(){ 
    if(showPlatform == false){
      fill(0);
      rect(x, y, w, h);
    }
  }
  
  void isSoldierOnPlatform(Soldier player){
    if(player.position.x >= (this.x - player.w) && player.position.x <= (this.x + this.w) && (player.position.y + player.h) >= this.y && (player.position.y + player.h) <= (this.y + this.h)){
      player.isOnPlatform = true;
      player.currentJumpHeight = 0;
      player.position.y = (this.y - player.h);
    }
  }
  
  void isSoldierHittingPlatform(Soldier player){
    if(showPlatform == false){
      if(player.position.x >= this.x && player.position.x <= (this.x + this.w) && player.position.y < (this.y + this.h) && player.position.y > this.y){
        player.position.y = (this.y + player.h);
        player.currentJumpHeight = player.jumpMaxHeight;
      }
    }
  }
}
