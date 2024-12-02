class Sphere{
  //sets up the vector and float we will be using for the falling speed of the spheres
  PVector position;
  float builtSpeed;
  
  Sphere(float x, int y){
   //Position takes in a starting point from the main class
   position = new PVector(x, y); 
   builtSpeed = 0; 
  }
  
  void Update(){
    //Updates the speed 
    position.y += (2 + builtSpeed);
    //Lets the builtspeed cap out at 8
    if(position.y > 500 && builtSpeed < 7.9){
      //Everytime it falls and isn't at 8 the speed of the spheres will incread to ensure a loss condition is eventually met 
      builtSpeed += 0.2; 
    }
  }
  
  void Display(){
    //Displays the spheres as they are falling down
    fill(255, 0, 0); 
    ellipse(position.x, position.y, 25, 25); 
  } 
}
