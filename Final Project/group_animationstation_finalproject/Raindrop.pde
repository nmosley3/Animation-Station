class Raindrop{
  
  float xPos, yPos; 
  PImage rd; 
  
  Raindrop(float xPos, float yPos){
    
    this.xPos = xPos;
    this.yPos = yPos;
    
    rd = loadImage("raindrop.png");
    rd.resize(rd.width/8, rd.height/8);
  }
  
  void display(){
    
    image(rd,xPos,yPos);
    
  }
  
  void setPosition(float xPos, float yPos){
    
    this.xPos = xPos;
    this.yPos = yPos;
    
  }
  
}