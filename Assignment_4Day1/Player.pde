class Player {
  //Sets up the position, velocity, and acceleration vector and all of the sprites used for the player
  PVector position; 
  PVector velocity; 
  PVector acceleration;
  PImage playerRight;
  PImage playerLeft;
  PImage playerRunRight[];
  PImage playerRunLeft[];
  PImage checkLastDirection;
    
    //Constructor that takes in the x and y that the player will start at and the velocity + acceleration they will be going at
    Player(float x, float y, float vx, float vy, float ax, float ay){
    //Where the player starts
    position = new PVector(x,y);  
    velocity = new PVector(vx,vy); 
    acceleration = new PVector(ax,ay);
    
    //Creates the left and right variations of all character animations
    playerRight = loadImage("chickenstandright.png");
    playerLeft = loadImage("chickenstandleft.png"); 
    checkLastDirection = loadImage("chickenstandright.png");
  
    playerRunRight = new PImage[2];
    playerRunRight[0] = loadImage("chickenrunright1.png");
    playerRunRight[1] = loadImage("chickenrunright2.png");
  
    playerRunLeft = new PImage[2];
    playerRunLeft[0] = loadImage("chickenrunleft1.png");
    playerRunLeft[1] = loadImage("chickenrunleft2.png");

  }
  
  //Updates to see if the player is walking left or right 
  void Update(boolean checkWalkLeft, boolean checkWalkRight){
    if(checkWalkLeft == true){
      //position is effected by velocity
      position.x -= velocity.x; 
      //if they hit top speed then the player accelerates to top speed
      if(playerFullSpeed > 30){
        position.x -= acceleration.x;
      }
      checkLastDirection = playerLeft;
    }
    
    //mimiced of the above but for moving right 
    else if (checkWalkRight == true){
      position.x += velocity.x; 
      if(playerFullSpeed > 30){
        position.x += acceleration.x; 
      }
      checkLastDirection = playerRight; 
    }
    
  }
  
  //Displays the player character running right or left, and full speed variations in case the player is running long enough to activate it 
  void Display(int playerRunFrame, boolean checkWalkLeft, boolean checkWalkRight, int playerFullSpeed){
     if(checkWalkRight == true && playerFullSpeed < 30){
    image(playerRunRight[playerRunFrame], position.x, height/1.25);
    }
  
  else if(checkWalkRight == true && playerFullSpeed > 30){
    image(playerRunRight[1], position.x, height/1.25); 
    }
  
  else if(checkWalkLeft == true && playerFullSpeed < 30){
    image(playerRunLeft[playerRunFrame], position.x, height/1.25);
    }
  
  else if(checkWalkLeft == true && playerFullSpeed > 30){
    image(playerRunLeft[1], position.x, height/1.25); 
    }
  
  //If the player is not moving, puts them in the idle facing the direction they were running in using checkLastDirection which stores it. 
  else{
    image(checkLastDirection, position.x, height/1.25);
   }
  }
  
}
