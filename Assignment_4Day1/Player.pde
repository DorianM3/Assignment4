class Player {
  //Sets up the position vector and all of the sprites used for the player
  PVector position;
  PImage playerRight;
  PImage playerLeft;
  PImage playerRunRight[];
  PImage playerRunLeft[];
  PImage checkLastDirection;
    
    //Constructor that takes in the x and y that the player will start at
    Player(int x, int y){
    //Where the player starts
    position = new PVector(x,y);  
    
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
      position.x -= 2;
      checkLastDirection = playerLeft;
    }
    
    else if (checkWalkRight == true){
      position.x += 2; 
      checkLastDirection = playerRight; 
    }
    
  }
  
  //Displays the player character running right or left, and full speed variations in case the player is running long enough to activate it 
  void Display(int playerRunFrame, boolean checkWalkLeft, boolean checkWalkRight, int playerFullSpeed){
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
  
  //If the player is not moving, puts them in the idle facing the direction they were running in using checkLastDirection which stores it. 
  else{
    image(checkLastDirection, position.x, height/1.25);
    }
  }
  
}
