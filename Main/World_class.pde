class World{
  ArrayList<Platform> allPlatforms = new ArrayList<Platform>();
  ArrayList<Plane> allPlanes = new ArrayList<Plane>();
  ArrayList<Button> allButtons = new ArrayList<Button>();
  
  //De tre arrays er koordinater og længden af platformene. 
  float[] platformXPunkt = {500, 350, 100, 700, 860, 200, 580, 760, 1000, 1140, 1100, 1250};
  float[] platformYPunkt = {400, 520, 500, 360, 450, 370, 460, 520, 380, 450, 500, 350};
  float[] platformLength = {100, 140, 80, 120, 80, 150, 70, 120, 100, 70, 150, 60};
  
  PImage baggrund;
  
  PVector gravity = new PVector(0, 4.82);
  
  int shownAidKasser = 0; //Det er hvor mange førstehjælpskasser, der må være på skærmen
  int point = 0; 
  
  //De to booleans bestemmer om menuerne skal vises.
  boolean isGameOver = false; 
  boolean isMenuOn = true;
  
  Soldier player;
  Platform groundPlatform; //Platformen i jorden. 
  
  Button startGame;
  Button closeGame;
  Button returnToMenu;
  
  World(){
    createWorld();
  }
  
  //Denne metode er en slags konstruktør.
  void createWorld(){
    startGame = new Button(width/2, 400, 250, 80, "Start spil");
    closeGame = new Button(width/2, 600, 250, 80, "Sluk spil");
    returnToMenu = new Button(width/2, height/2 + 100, 300, 80, "Gå til hovedmenuen");
    
    allButtons.add(startGame);
    allButtons.add(closeGame);
    allButtons.add(returnToMenu);
    
    allPlatforms.clear();
    allPlanes.clear();
    
    player = new Soldier(150, 300);
    
    baggrund = loadImage("world.png");
    
    groundPlatform = new Platform(-100, 650, 1600);
    groundPlatform.h = 100;
    groundPlatform.showPlatform = false; 
    allPlatforms.add(groundPlatform); //tilføjer linjen i bunden til arraylisten
    
    //Dette for loop er til at tegne alle platformene.
    for(int i = 0; i < platformXPunkt.length; i++){
      float platformX = platformXPunkt[i];
      float platformY = platformYPunkt[i];
      float platformL = platformLength[i];
      
      Platform nyPlatform = new Platform(platformX, platformY, platformL);
      allPlatforms.add(nyPlatform);
    }
    
    shownAidKasser = 0;
    point = 0; 
  }
  
  void display(){
    if(isMenuOn == false){
      image(baggrund, 0, 0);

      for(int i = 0; i < allPlatforms.size(); i++){
        Platform currentPlatform = allPlatforms.get(i);
        currentPlatform.display();
      }
      
      player.display();
      
      for(int i = 0; i < allPlanes.size(); i++){
        Plane currentPlane = allPlanes.get(i);
        currentPlane.display();
      }
      
      textSize(25);
      fill(0);
      text("Du har "+ player.life +" liv tilbage", 50, 60);
      textAlign(RIGHT);
      text("Dine point: " + point, width - 50, 60);
      textAlign(LEFT);
      
      if(isGameOver == true){
        gameOverPopup();
      }
    }else {
      menu();
    }
    
    for(int i = 0; i < allButtons.size(); i++){
      Button currentButton = allButtons.get(i);
      currentButton.display();
    }
  }
  
  void update(){
    if(isGameOver == false){
      player.update(gravity);
    
      if(player.life <= 0){
        isGameOver = true;
      }
      
      //Her laves en masse checks med platformene.
      for(int i = 0; i < allPlatforms.size(); i++){
        Platform currentPlatform = allPlatforms.get(i);
        currentPlatform.isSoldierOnPlatform(player);
        currentPlatform.isSoldierHittingPlatform(player);
        currentPlatform.aidKasse.ifCollected(player, this);
      }
      
      //Her opdateres flyene og sletter dem når de er ude for skærmen.
      for(int i = 0; i < allPlanes.size(); i++){
        Plane currentPlane = allPlanes.get(i);
        currentPlane.update(player);
        
        if(currentPlane.checkIfGone() == true && currentPlane.bombe.checkIfUnderGround() == true){
          allPlanes.remove(i);
        }
      }
      
      //Her laves et nyt fly hvert halve skeund.
      if(frameCount % 30 == 0){
        Plane fly = new Plane();
        allPlanes.add(fly);
      }
  
      spawnAidKasser(); 
      removeAidKasser();
      
      if(frameCount % 150 == 0){
        point++;
      }
    }
  }
  
  //Denne metode placerer førstehjælpskasserne.
  void spawnAidKasser(){
    if(frameCount % 600 == 0){
      if(shownAidKasser < 1){
        Platform randomPlatform = allPlatforms.get(int (random(0, allPlatforms.size())));
        if(randomPlatform.aidKasse.isDrawn == false){
          randomPlatform.aidKasse.isDrawn = true;
          shownAidKasser++;
        }
      }
    }
  }
  
  
  //Denne metode fjerne førstehjælpskasserne efter noget tid. 
  void removeAidKasser(){
    if(frameCount % 450 == 0){
      for(int i = 0; i < allPlatforms.size(); i++){
        Platform currentPlatform = allPlatforms.get(i);
        if(currentPlatform.aidKasse.isDrawn == true){
          currentPlatform.aidKasse.isDrawn = false;
          shownAidKasser--;
        }
      }
    }
  }
  
  void gameOverPopup(){
    returnToMenu.hidden = false;
    
    fill(0);
    rect((width/2 - 350), (height/2 - 200), 700, 400, 15);
    
    textAlign(CENTER);
    fill(255);
    textSize(50);
    text("GAME OVER", (width/2), (height/2 - 100));
    
    textSize(30);
    text("Point denne runde: " + point, width/2, height/2);
    textAlign(LEFT);
  }
  
  void menu(){
    startGame.hidden = false;
    closeGame.hidden = false;
    
    background(62, 107, 56);
    
    textAlign(CENTER);
    textSize(60);
    text("THE LAST MAN STANDING", width/2, 200);
    textAlign(LEFT);
  }
  
  //Det styrer spillets taster.
  void gameKeys(){
    if(key == ' ' && verden.player.isMoving == true){
      verden.player.isMoving = true;
    }else{
      verden.player.isMoving = false;
    }
  }
  
  //Det styrrer spillets kliks med mussen.
  void gameMouse(){
    rectMode(CORNER);
    
    if(startGame.ifClicked() == true){
      startGame.hidden = true;
      closeGame.hidden = true;
      createWorld();
      isMenuOn = false;
    }
    
    if(closeGame.ifClicked() == true){
      exit();
    }
    
    if(returnToMenu.ifClicked() == true){
      returnToMenu.hidden = true;
      isGameOver = false; 
      isMenuOn = true;
    }
  }
}
