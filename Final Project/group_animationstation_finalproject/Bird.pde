class Bird{
  
  
  float xPosition, yPosition; 
  int bodyx = 3;
  int bodyy = 3;
  color c = color(25,26,33);
  int direction; 
  PShape bird, body, wing1, wing2;
  
  int rotateMax = 60; 
  int wing1Counter = 0;
  int wing2Counter = 0;
  int directionWing1 = -1;
  int directionWing2 = 1; 
  
  Bird(float xPosition, float yPosition){
    
    this.xPosition = xPosition;
    this.yPosition = yPosition; 
    
    bird = createShape(GROUP);
    ellipseMode(CENTER);
    body = createShape(ELLIPSE, xPosition, yPosition, bodyx, bodyy);
    body.setFill(c);
    body.setStroke(c);
    wing1 = createShape(LINE,xPosition,yPosition, xPosition-4, yPosition-7);
    wing1.setStroke(c);
    wing2 = createShape(LINE,xPosition, yPosition, xPosition+4,yPosition-7);
    wing2.setStroke(c);
    
    bird.addChild(body);
    bird.addChild(wing1);
    bird.addChild(wing2);
     
  }
  
  void display(){
    pushMatrix();
    translate(this.xPosition,this.yPosition);
    shape(bird);
    popMatrix();
  }
  
  void rotateWing1(){
    
    if (wing1Counter <=  rotateMax){
      pushMatrix();
      wing1.translate(xPosition,yPosition);
      wing1.rotate(radians(directionWing1));
      wing1.translate(-xPosition,-yPosition);
      
      popMatrix();  
      wing1Counter += 1; 
    }
    else{
      wing1Counter = 0;
      directionWing1 = directionWing1 * -1;
      
    }
    
  }
  
  void rotateWing2() {
    
        
    if (wing2Counter <=  rotateMax){
      pushMatrix();
      wing2.translate(xPosition,yPosition);
      wing2.rotate(radians(directionWing2));
      wing2.translate(-xPosition,-yPosition);
      
      popMatrix();  
      wing2Counter += 1; 
    }
    else{
      wing2Counter = 0;
      directionWing2 = directionWing2 * -1;
      
    }
  }
  
  void move(){
    
    if (xPosition < 800){
      
      xPosition += 1; 
      //pushMatrix();
      //bird.translate(xPosition,yPosition);
      //popMatrix();
      
      
    }
    else{
      xPosition= -5;
    }
    
  }
}