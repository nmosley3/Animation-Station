Coin c1; 
Shark s1;
Swimmer player;
int lastKey;
int [][] screenOwnership;
float currentTile = 0;

void setup(){
  
  size(600,400);
  //frameRate(1);
  //initialize coin
  c1 = new Coin("coin",6);
  s1 = new Shark(5);
  player = new Swimmer();
  screenOwnership = new int[height][width];
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j ++) {
      screenOwnership[i][j] = 0; 
    }
  }
  
}

void draw(){
  if (keyPressed) {
      player.keyPressed();
    }
    
  updateScreenOwnership();
  checkForCollision();
      
  //print ("Shark position: ", s1.current_x, ", ", s1.current_y, "/n");
  //print ("Player position: ", player.x, ", ", player.y, "/n");
   
  display_background();
  c1.display();
  s1.display();
  s1.move();
  
  player.display();
  
  if (frameCount > 90 && frameCount < 180) {
    s1.increase_speed();
  }
}


void display_background(){
  
  background(125, 213, 234);
  
  //these two rectangles display the background scene
  fill(77, 74, 69);
  noStroke();
  //this rect is where the score/timer will be displayed 
  rect(0, 380, 600, 20);
  //These squares are the pier
  rect(0, 350, 280, 30);
  rect(320, 350, 280,30);
  
} 

void updateScreenOwnership() {
  if (s1.previous_x > 0 && s1.previous_x < width) {
  screenOwnership[int(s1.previous_y)][int(s1.previous_x)] = 0;
  screenOwnership[int(s1.previous_y + s1.img.height)][int(s1.previous_x)] = 0;
  }
  
  if (s1.previous_x + s1.img.width < width && s1.previous_x + s1.img.width > 0) {
  screenOwnership[int(s1.previous_y)][int(s1.previous_x + s1.img.width)] = 0;
  screenOwnership[int(s1.previous_y + s1.img.height)][int(s1.previous_x + s1.img.width)] = 0;
  }
  
  if (s1.current_x > 0) {
  screenOwnership[int(s1.current_y)][int(s1.current_x)] = 1;
  screenOwnership[int(s1.current_y + s1.img.height)][int(s1.current_x)] = 1;
  }
  if (s1.current_x + s1.img.width < width) {
  screenOwnership[int(s1.current_y)][int(s1.current_x + s1.img.width)] = 1;
  screenOwnership[int(s1.current_y + s1.img.height)][int(s1.current_x + s1.img.width)] = 1;
  }
  if (frameCount == 2) {
  for (int i= 0; i< height; i ++) {
    for (int j = 0; j < width; j++) {
      if (screenOwnership[i][j] == 1) {
        print (j, i);
        println();
      }
    }
  }
  }
}

void checkForCollision() {
  for (int i = int (player.y) - player.currentSwimmer.height / 2; i < int (player.y) +player.currentSwimmer.height / 2; i++) {
    for (int j = int(player.x) - player.currentSwimmer.width / 2; j < int(player.x) + player.currentSwimmer.width / 2; j ++) {
      currentTile = screenOwnership[i][j];
      if (i == 145 && j == 2) {
        print(currentTile);
      }
      if (currentTile == 1) {
        player.lose();
      } else if (currentTile == 2) {
        player.collectCoin();
        // c1.moveCoin();
      } else if (currentTile == 3) {
        player.onBoatGoingLeft();
      } else if (currentTile == 4) {
        player.onBoatGoingRight(); 
      }
    }
  }
}




//Each lane is going to be 35 pixels in height -- so there will be 10 lanes 
//(350 pixels of water total)
//counting for each lane starts at the top of the screen
//each time the swimmer moves 35 pixels
//Odd number lanes move in +x direction
//even number lanes move in -x direction
