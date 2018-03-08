Candle c1;
Candle c2;
Candle c3;

void setup() {
  size(500,500,P3D);
  PVector p1 = new PVector(0.5,0.5);
  PVector p2 = new PVector(1,1);
  c1 = new Candle(color(206,65,199),25,70,30,200,200,100,p1);
  c2 = new Candle(color(57,55,211),25,70,30,150,200,100,p2);
  c3 = new Candle(color(234,237,144),25,70,30,250,200,100,p2);


}

void draw() {
  background(255);
  c1.display_candle();
  c2.display_candle();
  c3.display_candle();
  
  //c1.beginMovement();
  //c2.beginMovement();
  //c3.beginMovement();
  
}