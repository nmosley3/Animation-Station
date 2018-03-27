int nParticles;
int colorIdx;
color[] FireworkColors = {#db0000, #f66706, #3e2200, #ffc100, #9068d4, #4bb1df};
Firework[] allFireworks;
int fireworkIdx = 0;


void setup () {
  size(1000, 1000);
  background(255);
  allFireworks = new Firework[10];
}

void draw() { 
  background(255);
  for (int i = 0; i < 10; i++) {
    if (allFireworks[i] != null) {
      allFireworks[i].display();
      allFireworks[i].launchFirework();
    }
  }
    
}

void mousePressed() {
  nParticles = int(random(12, 24));
  colorIdx = int(random(5));
  allFireworks[fireworkIdx] = new Firework(mouseX, height, nParticles, FireworkColors[colorIdx]);
  fireworkIdx += 1;
  fireworkIdx %= 10;
}
