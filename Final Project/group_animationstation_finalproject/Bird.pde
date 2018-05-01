class Bird{
  
  
  float xPosition, yPosition, degree; 
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
  
  Bird(float xPosition, float yPosition, int degree){
    
    this.xPosition = xPosition;
    this.yPosition = yPosition; 
    this.degree = degree;
    this.wing1Counter = degree;
    this.wing2Counter = degree; 
    
    bird = createShape(GROUP);
    ellipseMode(CENTER);
    body = createShape(ELLIPSE, 0, 0, bodyx, bodyy);
    body.setFill(c);
    body.setStroke(c);
    wing1 = createShape(LINE,0,0, -4, -7);
    wing1.setStroke(c);
    wing2 = createShape(LINE,0, 0, 4, -7);
    wing2.setStroke(c);
    
    bird.addChild(body);
    bird.addChild(wing1);
    bird.addChild(wing2);
    
    pushMatrix();
    wing1.rotate(radians(-wing1Counter));
    popMatrix();
    
    pushMatrix();
    wing2.rotate(radians(wing2Counter));
    popMatrix(); 
    
  }
  
  void display(){
    pushMatrix();
    translate(this.xPosition,this.yPosition);
    shape(body);
    
    //wing1
    if (wing1Counter < 80) {
    pushMatrix();
    wing1.rotate(radians(directionWing1));
    shape(wing1);
    popMatrix();
    
    wing1Counter += 1; 
    
    }
    else{
      directionWing1 = directionWing1 * -1;
      wing1Counter = 0;
    }
    
    //wing2
    if (wing2Counter < 80) {
    pushMatrix();
    wing2.rotate(radians(directionWing2));
    shape(wing2);
    popMatrix();
    
    wing2Counter += 1; 
    
    }
    else{
      directionWing2 = directionWing2 * -1;
      wing2Counter = 0;
    }
    
    popMatrix();
  }
  
 
  
  void move(){
    
    if (xPosition < 800){
      
      xPosition += 1; 

      
      
    }
    else{
      xPosition= -5;
    }
    
    
  }
  
  
  void setPosition(float xPosition, float yPosition, int degree){
    
    this.xPosition = xPosition;
    this.yPosition = yPosition; 
    this.degree = degree;
    this.wing1Counter = degree;
    this.wing2Counter = degree; 
  }
}