class Button {
  // X-coordinate
  float x;
  //Y-coordinate
  float y;
  //Width
  float w;
  // Color
  color c;
  // Text for button
  String t;
  
  Button (float X, float Y, float W, color C, String T) {
    this.x = X;
    this.y = Y;
    this.w = W;
    this.c = C;
    this.t = T;
    
  }
  
  void display() {
    fill(c);
    stroke(255);
    strokeWeight(3);
    // Displays button
    rect(x, y, w + 50, w);
    fill(0);
    // Displays text with "Start Over" 
    textSize(12);
    text(t,240,185);
  }

}