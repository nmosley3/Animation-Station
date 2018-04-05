Coin c1; 
Shark s1;
Swimmer player;

void setup(){
  
  size(600,400);
  //frameRate(1);
  //initialize coin
  c1 = new Coin("coin",6);
  s1 = new Shark(5);
  player = new Swimmer();
  
}

void draw(){
  
  display_background();
  c1.display();
  s1.display();
  s1.move();
  
  player.display();
  
  if (frameCount > 90){
    s1.increase_speed();
  }
}


void display_background(){
  
  background(125,213,234);
  
  //these two rectangles display the background scene
  fill(77,74,69);
  noStroke();
  //this rect is where the score/timer will be displayed 
  rect(0,380,600,20);
  //These scquares are the pier
  rect(0,350, 280, 30);
  rect(320,350,280,30);
  
} 

void keyPressed(){
  player.keyPressed();
}


//Each lane is going to be 35 pixels in height -- so there will be 10 lanes 
//(350 pixels of water total)
//counting for each lane starts at the top of the screen
//each time the swimmer moves 35 pixels
//Odd number lanes move in +x direction
//even number lanes move in -x direction
