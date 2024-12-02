class Sphere{
  //sets up the vector and float we will be using for the falling speed of the spheres
  PVector position;
  float builtSpeedX;
  float builtSpeedY;
  
  Sphere(float x, float y){
   //Position takes in a starting point from the main class
   position = new PVector(x, y); 
   builtSpeedX = 2;
   builtSpeedY = 2; 
  }
  
  void Update(){
    //Updates the speed 
    position.x += builtSpeedX; 
    position.y += builtSpeedY;
    //Lets the builtspeed cap out at 8
    
    if(position.y > 485){
      //Everytime it falls and isn't at 8 the speed of the spheres will incread to ensure a loss condition is eventually met 
      builtSpeedY += 0.2; 
      builtSpeedY = builtSpeedY * -1;
    }
    
    else if(position.y < 15){
      builtSpeedY -= 0.2;
      builtSpeedY = builtSpeedY * -1; 
    }
    
    if(position.x > 585){
      builtSpeedX += 0.2; 
      builtSpeedX = builtSpeedX * -1;
    }
    
    else if(position.x < 15){
      builtSpeedX -= 0.2;
      builtSpeedX = builtSpeedX * -1; 
    }
  }
  
  void Display(){
    //Displays the spheres as they are falling down
    fill(255, 0, 0); 
    ellipse(position.x, position.y, 25, 25); 
  } 
}
