//Setting up variables
int playerRunFrame = 1; 
boolean checkWalkRight; 
boolean checkWalkLeft;
int playerFullSpeed;
int reverseSpeed = 1;
int reverseHeight = 1; 
Player player;
Sphere[] spheres = new Sphere[2]; 

void setup(){
  //chooses the size of the screen
  size(600,500); 
  //sets up the player object, placing them near the middle of the screen and close to the bottom
  player = new Player(width/2, height/1.25); 
  
  //sets up the sphere object as an array to make the game more difficult, with two balls randomly coming down from different x coordinates 
  for(int i = 0; i < spheres.length; i++){
    //no limitations are put on the random so spheres can summon anywhere on the map, including on top of themselves. This is so players won't feel comfortable finding a part of the map where only one ball can spawn, increasing likelyhood of game overing eventually
    spheres[i] = new Sphere(random(5, 495), random(20, 300));
  }
}

void draw(){
  //Makes the top of the screen a sky
  fill(135, 206, 235);
  rect(0, 0, 600, 300);
  
  
  //Makes the bottom of the screen- the ground, a grassy green color
  fill(19,109,21);
  rect(0, 300, 600, 500); 
  
  //Calls for the spheres to update their speed and position, then display that change 
  for(int i = 0; i <spheres.length; i++){
  spheres[i].Update(); 
  spheres[i].Display(); 
  }
  
  //Uses framecount to swap between the frames and create a smooth running animation
  if(frameCount % 10 == 0){
    playerRunFrame += 1;
    playerRunFrame = playerRunFrame % 2; 
  }
  
  //Calls update and display to have the player character appear on screen
  player.Update(checkWalkLeft, checkWalkRight); 
  player.Display(playerRunFrame, checkWalkLeft, checkWalkRight, playerFullSpeed); 
  
  //Uses detection for the player and the ball, game overing once you get hit 
  for(int i = 0; i < spheres.length; i++){
    //The numbers are choses based on the way the system checks players position vs what they visually are standing on. I.e the player is 25 pixels visually to the right of where the game registers them as, hence we check 37 instead of 12 (circumfrance of the sphere)
    if((player.position.x + 37 >= spheres[i].position.x && player.position.x < spheres[i].position.x) && (spheres[i].position.y > 380 && spheres[i].position.y < 420)) { 
     println("hey!!");  
       }
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
