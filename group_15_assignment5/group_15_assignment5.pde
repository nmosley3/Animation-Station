Balloon b1;

void setup(){
  
  size(500,500, P3D);
  b1 = new Balloon(0,0,0,25,10,color(234,23,43));
  
}

void draw(){
  
  background(250,242,249);
  camera(0,0,300,0,0,0,0,1,0);
  b1.display();
  b1.move(0.5,-0.5,0);
  //b1.shake_string();
  
  b1.rotate();
}