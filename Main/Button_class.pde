class Button{
  
  float x;
  float y;
  float w;
  float h;
  
  String text = "";
  
  boolean hidden = true;
  
  Button(float x_, float y_, float w_, float h_, String text_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = text_;
  }
  
  void display(){
    if(hidden == false){
      fill(65, 94, 49);
      rectMode(CENTER);
      rect(x, y, w, h, 10);
      rectMode(CORNER);
      
      textAlign(CENTER);
      fill(255);
      textSize(25);
      text(text, x, y + 8);
      textAlign(LEFT);
    }
  }
  
  boolean ifClicked(){
    if(hidden == false){
      if(mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2){
        return true;
      }else {
        return false;
      }
    }else {
      return false;
    }
  }
}
