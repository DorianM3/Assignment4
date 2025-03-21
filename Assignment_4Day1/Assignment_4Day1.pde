//Setting up variables
int playerRunFrame = 1; 
boolean checkWalkRight; 
boolean checkWalkLeft;
int playerFullSpeed;
Player player;
Sphere sphere; 

void setup(){
  size(600,500);
  background(255); 
  player = new Player(width/2, height/1.25); 
  sphere = new Sphere(random(50, 550), 0);
}

void draw(){
  //Makes the top of the screen a sky
  fill(135, 206, 235);
  rect(0, 0, 600, 300);
  
  
  //Makes the bottom of the screen- the ground, a grassy green color
  fill(19,109,21);
  rect(0, 300, 600, 500); 
  
  sphere.Update(); 
  sphere.Display(); 
  
  //Uses framecount to swap between the animations and create a smooth running animation
  if(frameCount % 10 == 0){
    playerRunFrame += 1;
    playerRunFrame = playerRunFrame % 2; 
  }
  
  //Calls update and display to have the player character appear on screen
  player.Update(checkWalkLeft, checkWalkRight); 
  player.Display(playerRunFrame, checkWalkLeft, checkWalkRight, playerFullSpeed); 
  
  if((player.position.x + 37 >= sphere.position.x && player.position.x < sphere.position.x) && (sphere.position.y > 380 && sphere.position.y < 420)) { 
   println("hey!!");  
    }
  
}

void keyPressed(){
  //Moves the player left and adds to the counter for time until full speed
  if(key == 'a'){
    checkWalkLeft = true; 
    checkWalkRight = false;
    playerFullSpeed += 1;
  }
  
  else if(key == 'd'){
    //Moves the player right and adds to the counter for time until full speed
    checkWalkRight = true;
    checkWalkLeft = false;
    playerFullSpeed += 1;
  }
}

void keyReleased(){
  //Makes the player stop and stand if they so choose to
  checkWalkRight = false; 
  checkWalkLeft = false;
  playerFullSpeed = 0;
}
