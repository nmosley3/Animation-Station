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
    // Draws candle stem
    strokeWeight(3);
    translate(0, -110, -200);
    rotateY(radians(frameCount));
    translate(x,y + 110 ,z + 200);
    fill(Color);
    box(w,h,d);
    //PShape body = createShape(BOX,w,h,d);
    popMatrix();
    
    // Draws candle flame
    pushMatrix();
    
    translate(0, -110, -200);
    rotateY(radians(frameCount));
    
    translate(x,y-45 + 110 ,z + 200);
    fill(232,187,89);
    rotateY(radians(x*2 + frameCount * 8));
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