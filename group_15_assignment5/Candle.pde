class Candle {
  // Attributes of candle
  color Color;
  float w;
  float h;
  float d;
  float x;
  float y;
  float z;
  PVector speed;
  
  // Constructor
  Candle(color Color, float w, float h, float d, float x, float y, float z,PVector speed) {
    this.Color = Color;
    this.w = w;
    this.h = h;
    this.d = d;
    this.x = x;
    this.y = y;
    this.z = z;
    this.speed = speed;
  }
  
  void display_candle() {
        
    pushMatrix();
    translate(x,y,z);
    // Draws candle stem
    strokeWeight(3);
    //rotateY(radians(frameCount));
    fill(Color);
    box(w,h,d);
    //PShape body = createShape(BOX,w,h,d);
    popMatrix();
    
    // Draws candle flame
    pushMatrix();
    translate(x,y-45,z);
    fill(232,187,89);
    rotateY(radians(frameCount));
    box(w/5,h/4,d/2);
    popMatrix();
    //PShape flame = createShape(BOX,w/3,h/4,d/2);
    //candle.addChild(body);
    //candle.addChild(flame);
    
    //shape(candle);
    
    
    
    
  }
  
  void beginMovement() {
    
    if(this.y > 120) {
      this.y -= this.speed.y;
    }
    
    
      
   
    
   
  } 
    
}