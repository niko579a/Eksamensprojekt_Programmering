class World{
  ArrayList<Platform> allPlatforms = new ArrayList<Platform>();
  ArrayList<Plane> allPlanes = new ArrayList<Plane>();
  ArrayList<Missil> allMissils = new ArrayList<Missil>();
  
  PImage baggrund;
  
  PVector gravity = new PVector(0, 4.82);
  
  Soldier player;
  Platform groundPlatform; //den usynlige linje i bunden 
  
  World(){
    player = new Soldier(150, 300);
    
    baggrund = loadImage("world.png");
    
    groundPlatform = new Platform(-100, 650, 1600);
    groundPlatform.showPlatform = false; 
    allPlatforms.add(groundPlatform); //tilføjer linjen i bunden til arraylisten
    
    Platform platform1 = new Platform(500, 400, 100); 
    allPlatforms.add(platform1);
    
    Platform platform2 = new Platform(350, 520, 140); 
    allPlatforms.add(platform2);
    
    Platform platform3 = new Platform(100, 500, 80); 
    allPlatforms.add(platform3);
    
    Platform platform4 = new Platform(700, 360, 120); 
    allPlatforms.add(platform4);
    
    Platform platform5 = new Platform(860, 450, 80); 
    allPlatforms.add(platform5);
    
    Platform platform6 = new Platform(200, 370, 150); 
    allPlatforms.add(platform6);
    
    Platform platform7 = new Platform(580, 460, 70); 
    allPlatforms.add(platform7);
    
    Platform platform8 = new Platform(760, 520, 120); 
    allPlatforms.add(platform8);
    
    Platform platform9 = new Platform(1000, 380, 100); 
    allPlatforms.add(platform9);
    
    Platform platform10 = new Platform(1140, 450, 70); 
    allPlatforms.add(platform10);
    
    Platform platform11 = new Platform(1100, 500, 150); 
    allPlatforms.add(platform11);
    
    Platform platform12 = new Platform(1250, 350, 60); 
    allPlatforms.add(platform12);
  }
  
  
  void display(){
    image(baggrund, 0, 0);
    
    for(int i = 0; i < allPlanes.size(); i++){
      Plane currentPlane = allPlanes.get(i);
      currentPlane.display();
    }
    
    player.display();
    
    for(int i = 0; i < allPlatforms.size(); i++){
      Platform currentPlatform = allPlatforms.get(i);
      currentPlatform.display();
    }
    
    for(int i = 0; i < allMissils.size(); i++){
      Missil currentMissil = allMissils.get(i);
      currentMissil.display();
    }
  }
  
  void update(){
    player.update(gravity);
    
    for(int i = 0; i < allPlatforms.size(); i++){
      Platform currentPlatform = allPlatforms.get(i);
      currentPlatform.isSoldierOnPlatform(player);
      currentPlatform.isSoldierHittingPlatform(player);
    }
    
    for(int i = 0; i < allPlanes.size(); i++){
      Plane currentPlane = allPlanes.get(i);
      currentPlane.update();
      
      if(currentPlane.hasBeenThere == true && currentPlane.checkIfGone() == true){
        allPlanes.remove(i);
      }
    }
    
    for(int i = 0; i < allMissils.size(); i++){
      Missil currentMissil = allMissils.get(i);
      currentMissil.update();
    }
     
    if(frameCount % 120 == 0){
      Plane fly = new Plane();
      allPlanes.add(fly);
    }
  }
}
