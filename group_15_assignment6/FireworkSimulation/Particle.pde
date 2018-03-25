class Particle {
float x, y, vx, vy;;
float gravity = .4;
PShape particle;
  Particle (color c, float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = -vy;
    fill(c);
    particle = createShape(ELLIPSE, 0, 0, 5, 5);
  }
  
  void beginMovement () {
    this.x += vx;
    this.y += vy;
    this.vy += gravity;
    
  }
  
  void display() {
    
    pushMatrix();
    translate(this.x, this.y);
    shape(particle);
    popMatrix();
  }
  
}
