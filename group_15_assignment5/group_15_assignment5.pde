Balloon b1;
Cake BirthdayCake;
Candle c1;
Candle c2;
Candle c3;

void setup(){
  
  size(500,500, P3D);
  b1 = new Balloon(0,0,0,25,10,color(234,23,43));
  
  BirthdayCake = new Cake(0, 200, -200, 100, 50, 80, 40);
  
  PVector p1 = new PVector(0.5,0.5);
  PVector p2 = new PVector(1,1);
  c1 = new Candle(color(206,65,199),25,70,30,000,110,-200,p1);
  c2 = new Candle(color(57,55,211),25,70,30,150,110,-200,p2);
  c3 = new Candle(color(234,237,144),25,70,30,110,200,-200,p2);
  
}

void draw(){
  
  background(250,242,249);
  camera(0,0,300,0,0,0,0,1,0);
  b1.display();
  b1.move(0.5,-0.5,0);
  //b1.shake_string();
  
  b1.rotate();
  
  BirthdayCake.display();
  c1.display_candle();
  c2.display_candle();
  c3.display_candle();
}