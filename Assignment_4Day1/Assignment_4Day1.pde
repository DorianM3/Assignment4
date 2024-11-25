//This is the start 

void setup(){
  size(600,500);
  background(255); 
}

void draw(){
  //Makes the top of the screen a sky
  fill(135, 206, 235);
  rect(0, 0, 600, 300);
  
  //Makes the bottom of the screen- the ground, a grassy green color
  fill(19,109,21);
  rect(0, 300, 600, 500); 
}
