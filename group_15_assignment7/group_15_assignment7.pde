Coin c1; 


void setup(){
  
  size(600,400);
  //frameRate(1);
  //initialize coin
  c1 = new Coin("coin",6);
  
}

void draw(){
  
  display_background();
  c1.display();
}


void display_background(){
  
  background(125,213,234);
  
  //these two rectangles display the background scene
  fill(77,74,69);
  noStroke();
  //this rect is where the score/timer will be displayed 
  rect(0,370,600,30);
  //These scquares are the pier
  rect(0,350, 290, 20);
  rect(310,350,290,20);
  
}