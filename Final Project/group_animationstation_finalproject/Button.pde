class Button {
  // X-coordinate
  float x;
  // Y-coordinate
  float y;
  // Width
  float w;
  // Height
  float h;
  // Color
  color c;
  // Text for button
  String t;
  
  Button (float X, float Y, float W, float H, color C, String T) {
    this.x = X;
    this.y = Y;
    this.w = W;
    this.h = H;
    this.c = C;
    this.t = T;
    
  }
  
  void display() {
    fill(c);
    stroke(0);
    strokeWeight(3);
    // Displays button
    rect(x, y, w, h);
    fill(255);
    // Displays text with "Start Over" 
    textSize(15);
    fill(0);
    text(t,x + 25,y + 25);
  }

}
