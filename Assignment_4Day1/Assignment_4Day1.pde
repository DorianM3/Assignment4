//Setting up variables
PImage playerRight;
PImage playerLeft;
PImage playerRunRight[];
PImage playerRunLeft[];
int playerRunFrame = 1; 
boolean checkWalkRight; 
boolean checkWalkLeft;
PImage checkLastDirection;
int playerFullSpeed;
PVector position;

void setup(){
  size(600,500);
  background(255); 
  
  playerRight = loadImage("chickenstandright.png");
  playerLeft = loadImage("chickenstandleft.png"); 
  checkLastDirection = loadImage("chickenstandright.png");
  
  playerRunRight = new PImage[2];
  playerRunRight[0] = loadImage("chickenrunright1.png");
  playerRunRight[1] = loadImage("chickenrunright2.png");
  
  playerRunLeft = new PImage[2];
  playerRunLeft[0] = loadImage("chickenrunleft1.png");
  playerRunLeft[1] = loadImage("chickenrunleft2.png");
  
  position = new PVector (width/2, height/2); 
}

void draw(){
  //Makes the top of the screen a sky
  fill(135, 206, 235);
  rect(0, 0, 600, 300);
  
  
  //Makes the bottom of the screen- the ground, a grassy green color
  fill(19,109,21);
  rect(0, 300, 600, 500); 
  
  if(frameCount % 10 == 0){
    playerRunFrame += 1;
    playerRunFrame = playerRunFrame % 2; 
  }
  
  //Looks to see if the player is walking or standing still 
  if(checkWalkRight == true && playerFullSpeed < 50){
    image(playerRunRight[playerRunFrame], position.x, height/1.25);
  }
  
  else if(checkWalkRight == true && playerFullSpeed > 50){
    image(playerRunRight[1], position.x, height/1.25); 
  }
  
  else if(checkWalkLeft == true && playerFullSpeed < 50){
    image(playerRunLeft[playerRunFrame], position.x, height/1.25);
  }
  
  else if(checkWalkLeft == true && playerFullSpeed > 50){
    image(playerRunLeft[1], position.x, height/1.25); 
  }
  
  else{
    image(checkLastDirection, position.x, height/1.25);
  }
}

void keyPressed(){
  if(key == 'a'){
    checkWalkLeft = true; 
    checkWalkRight = false;
    playerFullSpeed += 1;
    position.x -= 3;
    checkLastDirection = playerLeft;
  }
  
  else if(key == 'd'){
    checkWalkRight = true;
    checkWalkLeft = false;
    playerFullSpeed += 1;
    position.x += 3;
    checkLastDirection = playerRight; 
  }
}

void keyReleased(){
  checkWalkRight = false; 
  checkWalkLeft = false;
  playerFullSpeed = 0;
}
