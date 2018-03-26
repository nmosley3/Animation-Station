class Particle {
float x, y, vx, vy;;
float gravity = .2;
PShape particle;
  Particle (color c, float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = -vy;
    fill(c);
    noStroke();
    particle = createShape(ELLIPSE, 0, 0, 4, 4);
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
