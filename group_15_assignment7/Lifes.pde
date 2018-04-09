class Lifes{
  
  PImage swimmingman;
  float x;
  float y; 
  
  Lifes(float x, float y){
    
    this.swimmingman = loadImage("swimmingManUp.png");
    this.x = x;
    this.y = y;
    swimmingman.resize(int(swimmingman.width*.1),int(swimmingman.height/2*0.2));
    
    
  }
  
  void display(){
    
    image(swimmingman,x,y);
  }
  
}