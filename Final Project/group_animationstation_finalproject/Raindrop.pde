class Raindrop{
  
  float xPos, yPos; 
  PShape rd; 
  
  Raindrop(float xPos, float yPos){
    
    this.xPos = xPos;
    this.yPos = yPos;
    
    rd = createShape();
    rd = loadShape("raindrop.svg");
    rd.scale(0.1);
  }
  
  void display(){
    
    pushMatrix();
    translate(xPos, yPos);
    shape(rd);
    popMatrix();
  }
  
}