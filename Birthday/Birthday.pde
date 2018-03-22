Cake BirthdayCake;


void setup() {
  size(400, 400, P3D);
  float x = 200;
  float y = 300;
  float z = 0;
  float r1 = 100;
  float h1 = 50;
  float r2 = 75;
  float h2 = 37.5;
  BirthdayCake = new Cake(x, y, z, r1, h1, r2, h2);
}

void draw () {
  background(220);
  BirthdayCake.display();
}