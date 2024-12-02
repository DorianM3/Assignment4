class Sphere{
  PVector position;
  float builtSpeed;
  
  Sphere(float x, int y){
    position = new PVector(x, y); 
   builtSpeed = 0; 
  }
  
  void Update(){
    position.y += (2 + builtSpeed);
    if(position.y > 500 && builtSpeed < 10.00){
      builtSpeed += 0.2; 
    }
  }
  
  void Display(){
    fill(255, 0, 0); 
    ellipse(position.x, position.y, 25, 25); 
  } 
}
