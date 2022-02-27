class Platform{
  float x;
  float y;
  float w;
  float h = 7;
  
  boolean showPlatform = true; //gør at linjen i bunden kan blive usynlig
  
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
    }else {
      noStroke();
      fill(9, 150, 29);
    }
    
    rect(x, y, w, h);
    
    aidKasse.display();
  }
  
  //Metoden holder øje med om spilleren rammer platformene med fødderne.
  void isSoldierOnPlatform(Soldier player){
    if(player.position.x >= (this.x - player.w + 10) && player.position.x <= (this.x + this.w - 10) && (player.position.y + player.h) >= this.y && (player.position.y + player.h) <= (this.y + this.h)){
      //Den gør at spilleren står på platformen.
      player.isOnPlatform = true;
      player.currentJumpHeight = 0;
      player.position.y = (this.y - player.h);
    }
  }
  
  //Denne metode sørger for at man ikke hoppe op på en platform når man er nedenunder.
  void isSoldierHittingPlatform(Soldier player){
    if(showPlatform == true){
      if(player.position.x >= this.x && player.position.x <= (this.x + this.w) && player.position.y < (this.y + this.h) && player.position.y > this.y){
        //Sørger for man ikke kan hoppe nedefra. Spilleren skal falde ned med tyngdekræften.
        player.currentJumpHeight = player.jumpMaxHeight;
      }
    }
  }
}
