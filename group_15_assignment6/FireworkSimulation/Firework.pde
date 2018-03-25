class Firework {
  float x, y, z;
  color c;
  PShape core;
  int nParticles;
  
  Particle[] allParticles;
  Particle newParticle;
  float vx, vy;
  
  Firework (float x, float y, int nParticles, color c) {
    this.x = x;
    this.y = y;
    this.c = c;  
    this.nParticles = nParticles;
    fill(c);
    core = createShape(ELLIPSE, 0, 0, 10, 10);    
  }
  
  void launchFirework() {
    if (this.y > 200){
      this.y -= 9; 
    } else {
      this.detonateFirework();
    }
  }
  
  void detonateFirework() {
    if (newParticle == null) {
    float angle = TWO_PI/nParticles;
    float currentAngle = 0;
    allParticles = new Particle[this.nParticles];
    for (int i = 0; i < this.nParticles; i++) {
      vx = cos(currentAngle) * 7;
      vy = sin(currentAngle) * 7;
      currentAngle += angle;
      newParticle = new Particle(this.c, this.x, this.y, vx, vy);
      allParticles[i] = (newParticle);
    }
    } else {
    for (int i = 0; i < this.nParticles; i++) {
      allParticles[i].display();
      allParticles[i].beginMovement();
    }
    }
  }
  
  void display() {  
    if (this.y > 200) {
      pushMatrix();
      translate(this.x, this.y);
      shape(core);
      popMatrix();    }
}
}
