class Sphere{
  PVector position; 
  
  Sphere(float x, int y){
    position = new PVector(x, y); 
  }
  
  void Update(){
    position.y += 2;
  }
  
  void Display(){
    fill(255, 0, 0); 
    ellipse(position.x, position.y, 25, 25); 
  } 
}
