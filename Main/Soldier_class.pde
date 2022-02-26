class Soldier extends Movement{
  float jumpSpeed = 8;
  float currentJumpHeight = 0; //jumpHeight
  float jumpMaxHeight = 200;
  
  PImage soldat;
   
  boolean isMoving = false; //tjekker om spilleren bevæger sig
  boolean isMovingLeft = false; //hvis false bevæger man sig til højre,tjekker om man går til venstre. 
  boolean isOnPlatform = true;
  boolean reachedMaxJumpH = false; //hasJumped
  
  Soldier(float x_, float y_){
    w = 10;
    h = 10;

    position.x = x_;
    position.y = y_;
    velocity.y = -jumpSpeed;
    
    soldat = loadImage("soldatStanding.png");
    
    moveSpeed = 3;
  }
  
  void display(){
    image(soldat, position.x, position.y, 125, 200);
  }
  
  void update(PVector gravity){
    isOfScreen();
    
    if(currentJumpHeight == jumpMaxHeight){
      reachedMaxJumpH = true;
    }
    
    if(isMoving == true){
      if(isMovingLeft == true){
        position.x -= moveSpeed;
      }else {
        position.x += moveSpeed;
      }
    }
    
    if(currentJumpHeight < jumpMaxHeight && isOnPlatform == false){
      position.add(velocity);
      currentJumpHeight += jumpSpeed;
    }else {
      position.add(gravity);
    }
  }
  
  void jump(){
    if(key == ' '){
      if(isOnPlatform == true){
        if(isOnPlatform == true){
          isOnPlatform = false; 
        }
        
        if(currentJumpHeight < jumpMaxHeight){
          position.add(velocity);
          currentJumpHeight += jumpSpeed; 
        }
      }
    }
  }
  
  void move(){
    if (key == 'a' || keyCode == LEFT) {
      isMoving = true;
      isMovingLeft = true;
    }

    if (key == 'd' || keyCode == RIGHT) {
      isMoving = true;
      isMovingLeft = false;
    }
  }
  
  void isOfScreen(){
    if (position.x <= 0) {
      position.x = 0;
    } else if (position.x >= width) {
      position.x = width - w;
    }
  }
}