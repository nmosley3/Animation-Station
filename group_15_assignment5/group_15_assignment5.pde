Balloon b1, b2;
Cake BirthdayCake, bdaycake;
Candle c1;
Candle c2;
Candle c3;

PVector p1, p2;
int frame_num = 0;
PFont courier; 

void setup(){
  
  size(800, 800, P3D);
  b1 = new Balloon(0,-100,0,25,10,color(234,23,43));
  b2 = new Balloon(0,-200,0,30,10,color(89,19,188));
  BirthdayCake = new Cake(0, 200, -200, 100, 50, 80, 40);
  bdaycake = new Cake(0,200,-200,125,80,100,65);
  
  p1 = new PVector(0.5,0.5);
  p2 = new PVector(1,1);
  
  c1 = new Candle(color(206,65,199),12,50,12, sin(TWO_PI / 3) * 25, 110, -200 + cos(TWO_PI / 3) * 25, p1);
  c2 = new Candle(color(57,55,211),12,50,12, sin(TWO_PI * 2 / 3) * 25, 110, -200 + cos(TWO_PI * 2 / 3) * 25, p2);
  c3 = new Candle(color(234,237,144),12,50,12, 0, 110, -175, p2);
 
  courier = createFont("Courier", 60);
  textFont(courier);
}

void draw(){
  
  background(#C5E0DC);
  
  if (frame_num < 180){
    camera(0,0,300,0,0,0,0,1,0);
    text("Happy",-100,-80);
    text("Birthday!",-150,-20);
    bdaycake.display();
    bdaycake.spin();
  }
  
  else if (frame_num < 700) {
  camera(0,0,300,0,0,0,0,1,0);
  b1.display();
  b1.move(0.3,-0.5,0);
  b1.shake_string();
  
  b1.rotate();
  
  b2.display();
  b2.move(-0.3,-0.5,0);
  b2.shake_string();
  b2.rotate();
  
  BirthdayCake.display();
  BirthdayCake.spin();
  c1.display_candle();
  c2.display_candle();
  c3.display_candle();
  
  } else {
    frame_num = 0;
    
    b1 = new Balloon(0,-100,0,25,10,color(234,23,43));
    b2 = new Balloon(0,-200,0,30,10,color(89,19,188));
    
    BirthdayCake = new Cake(0, 200, -200, 100, 50, 80, 40);
    bdaycake = new Cake(0,200,-200,125,80,100,65);
  
    c1 = new Candle(color(206,65,199),12,50,12, sin(TWO_PI / 3) * 25, 110, -200 + cos(TWO_PI / 3) * 25, p1);
    c2 = new Candle(color(57,55,211),12,50,12, sin(TWO_PI * 2 / 3) * 25, 110, -200 + cos(TWO_PI * 2 / 3) * 25, p2);
    c3 = new Candle(color(234,237,144),12,50,12, 0, 110, -175, p2);
  }
  
  frame_num += 1;
}