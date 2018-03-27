Trapeze t1,t2,t3; 
PImage person;
PImage background;

int frame_count = 0;

int colorIdx;
color[] FireworkColors = {#db0000, #f66706, #3e2200, #ffc100, #9068d4, #4bb1df};
Firework[] allFireworks;
int fireworkIdx = 0;

PImage cannon; 
PImage ring;

CannonBall c1;


void setup(){
  
  
  size(600,600);
  
  background = loadImage("CircusBackground.jpg");
  background.resize(width, height);
  
  t1 = new Trapeze(40,60,100,84.8);
  t2 = new Trapeze(60,40,100,56.52);
  t3 = new Trapeze(80,20,100,28.26);
  person = loadImage("Trapeze Person.png");
  person.resize(40,80);
  
  allFireworks = new Firework[10];
  
  c1 = new CannonBall(color(126,57,188),125,490,4,4);
  //c1 = new CannonBall (color(random(0,255),int(random(0,255)),int(random(0,255))),125,490,4,4);
  cannon = loadImage("Cannon.png");
  cannon.resize(120,0);
  
  ring = loadImage("Fire_Ring.png");
  ring.resize(120,0);
  
}

void draw(){
  
  background(255);
  
  image(background, 0, 0);
  
  t1.display(t2.current_x,t2.current_y);
  t2.display(t3.current_x,t3.current_y);
  t3.display(100,0);
  stroke(90,69,69);
  strokeWeight(3);
  line(t1.current_x-20,t1.current_y,t1.current_x+20,t1.current_y);
  image(person,t1.current_x-20,t1.current_y+3);
  
  
  t1.applyForce();
  t2.applyForce();
  t3.applyForce();
  
  image(cannon,0,480);
  image(ring,470,390);
  
  c1.display();
  c1.launch_cannon();
  
  for (int i = 0; i < 10; i++) {
    if (allFireworks[i] != null) {
      allFireworks[i].display();
      allFireworks[i].launchFirework();
    }
  }
  
  if (frame_count > 175) {
    t1.reset();
    t2.reset();
    t3.reset();
    
    c1.reset();
    
    frame_count  = 0;
  }
  
  frame_count+=1;
  
}

void mousePressed() {
  colorIdx = int(random(FireworkColors.length));
  allFireworks[fireworkIdx] = new Firework(mouseX, height, FireworkColors[colorIdx]);
  fireworkIdx += 1;
  fireworkIdx %= 10;
}
