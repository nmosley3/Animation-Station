PImage cannon; 
PImage ring;

CannonBall c1;

void setup() {
  size(600,600);
  c1 = new CannonBall(color(126,57,188),125,490,4,4);
  //c1 = new CannonBall (color(random(0,255),int(random(0,255)),int(random(0,255))),125,490,4,4);
  cannon = loadImage("Cannon.png");
  cannon.resize(120,0);
  
  ring = loadImage("Fire_Ring.png");
  ring.resize(120,0);
  
}

void draw() {
  background(255);
  image(cannon,0,480);
  image(ring,470,390);
  
  c1.display();
  c1.launch_cannon();

}