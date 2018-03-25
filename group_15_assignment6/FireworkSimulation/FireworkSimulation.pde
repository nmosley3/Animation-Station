Firework f1;
int nParticles;
int colorIdx;
color[] FireworkColors = {#db0000, #f66706, #3e2200, #ffc100, #9068d4, #4bb1df};


void setup () {
  size(1000, 1000);
  background(255);
}

void draw() { 
  background(255);
  if (f1 != null) {
    f1.display();
    f1.launchFirework();
  }
    
}

void mousePressed() {
  nParticles = int(random(12, 24));
  colorIdx = int(random(5));
  f1 = new Firework(mouseX, height, nParticles, FireworkColors[colorIdx]);
}
