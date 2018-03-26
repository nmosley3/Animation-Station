class Firework {
  float x, y, z;
  color c;
  PShape core;
  int nParticles;
  
  Particle[] allParticles;
  Particle newParticle;
  float vx, vy;
  float particleVelocity;
  float detonationHeight;
  
  Firework (float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.nParticles = int(random(12, 24));
    fill(c);
    noStroke();
    core = createShape(ELLIPSE, 0, 0, 6, 6);    
  }
  
  void launchFirework() {
    detonationHeight = random(40, 140);
    if (this.y > detonationHeight){
      this.y -= 8; 
    } else {
      this.detonateFirework();
    }
  }
  
  void detonateFirework() {
    if (newParticle == null) {
    float angle = TWO_PI/nParticles;
    float currentAngle = 0;
    allParticles = new Particle[this.nParticles * 3];
    for (int i = 0; i < this.nParticles * 3; i++) {
      if (i < nParticles) {
        particleVelocity = random(3.5, 4);
      } else if (i < nParticles * 2) {
        particleVelocity = random(2, 3.25);
      } else {
        particleVelocity = random(0.5, 1.5);
    }
      vx = cos(currentAngle) * particleVelocity;
      vy = sin(currentAngle) * particleVelocity;
      currentAngle += angle;
      newParticle = new Particle(this.c, this.x, this.y, vx, vy);
      allParticles[i] = (newParticle);
    }
    } else {
    for (int i = 0; i < this.nParticles * 3; i++) {
      allParticles[i].display();
      allParticles[i].beginMovement();
    }
    }
  }
  
  void display() {  
    if (this.y > detonationHeight) {
      pushMatrix();
      translate(this.x, this.y);
      shape(core);
      popMatrix();    
    }
  }
}
