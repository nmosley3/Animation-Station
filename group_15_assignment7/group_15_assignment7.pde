Coin c1; 
Shark s1,s2,s3;
Sailboat sb1, sb2, sb3;
Swimmer player;
Button startOver;

ArrayList<Lifes> livesleft = new ArrayList<Lifes>();
int lastKey;
int [][] screenOwnership;
float currentTile = 0;

void setup(){
  
  size(600,400);
  
  //initialize coin
  c1 = new Coin("coin",6);
  
  //initialize sharks
  s1 = new Shark(5);
  s2 = new Shark(2);
  s3 = new Shark(7);
  
  // initialize sailboats
  sb1 = new Sailboat(9);
  sb2 = new Sailboat(6);
  sb3 = new Sailboat(3);
  
  
  startOver = new Button(170,100,200,color(159,69,196),"Start Over");
  
  //inialize player
  player = new Swimmer();
  
  livesleft.add(new Lifes(10,353));
  livesleft.add(new Lifes(30,353));

  
  screenOwnership = new int[height][width];
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j ++) {
      screenOwnership[i][j] = 0; 
    }
  }
  
  coinUpdateScreenOwnership();

  
}

void draw(){
  
  display_background();
  
  for (Lifes live : livesleft){
    live.display();
  }
  
  
  c1.display();
  
  s1.display();
  s2.display();
  s3.display();
  s1.move();
  s2.move();
  s3.move();
  sb1.display();
  sb1.move();
  sb2.display();
  sb2.move();
  sb3.display();
  sb3.move();
  
  player.display();
  
   if (keyPressed) {
      player.keyPressed();
    }
      
  sharkUpdateScreenOwnership();
  checkForCollision();
  
  

}


void display_background(){
  
  background(125, 213, 234);
  
  //these two rectangles display the background scene
  fill(#F4A460);
  noStroke();
  //this rect is where the score/timer will be displayed 
  rect(0, 380, 600, 20);
  //These squares are the pier
  rect(0, 350, 280, 30);
  rect(320, 350, 280,30);
  
} 

void sharkUpdateScreenOwnership() {
  
  // reset previous shark hitbox to 0
  if (s1.previous_x > 0 && s1.previous_x < width) {
    screenOwnership[int(s1.previous_y)][int(s1.previous_x)] = 0;
    screenOwnership[int(s1.previous_y + s1.img.height)][int(s1.previous_x)] = 0;
  }
  
  if (s1.previous_x + s1.img.width < width && s1.previous_x + s1.img.width > 0) {
    screenOwnership[int(s1.previous_y)][int(s1.previous_x + s1.img.width)] = 0;
    screenOwnership[int(s1.previous_y + s1.img.height)][int(s1.previous_x + s1.img.width)] = 0;
  }
  
  // set current shark's hitbox to 1
  if (s1.current_x > 0) {
    screenOwnership[int(s1.current_y)][int(s1.current_x)] = 1;
    screenOwnership[int(s1.current_y + s1.img.height)][int(s1.current_x)] = 1;
  }
  if (s1.current_x + s1.img.width < width) {
    screenOwnership[int(s1.current_y)][int(s1.current_x + s1.img.width)] = 1;
    screenOwnership[int(s1.current_y + s1.img.height)][int(s1.current_x + s1.img.width)] = 1;
  }
  
}

void checkForCollision() {
  
  // for each pixel the player covers, check if it is occupied by a hitbox
  for (int i = int (player.y) - player.currentSwimmer.height / 2; i < int (player.y) +player.currentSwimmer.height / 2; i++) {
    for (int j = int(player.x) - player.currentSwimmer.width / 2; j < int(player.x) + player.currentSwimmer.width / 2; j ++) {
      currentTile = screenOwnership[i][j];
      
      // player intersects with a shark (1)
      if (currentTile == 1) {
        
        if (livesleft.size()>0){
        livesleft.remove(livesleft.size()-1);
        player.lose();
        }
        else{
          
          //When gameover() function is in place, we don't need 
          //player.lose() function, Rakshana: this is where the call to the buttons
          //could go...?
          player.lose();
          gameover();
          // Displays score and reset button
          // "Game Over" banner is disappearing though ***
          strokeWeight(3);
          stroke(0);
          fill(color(159,69,196));
          rect(170,100,200,100);
          fill(color(255));
          textSize(15);
          text("Game over!" + "\n" + "Score: ",235,130);
          fill(0);
          // Displays button
          startOver.display();
          if (mousePressed) {
            if(mouseX > startOver.x && mouseX < (startOver.x + startOver.w + 50) && mouseY > startOver.y && mouseY < startOver.y + startOver.w) {
              // Takes you back to initial screen to begin game again
              // NEED ACTION HERE TO START OVER GAME
              println("Hooray");
          
            }
          }
          // FOR WHEN THE PLAYER WINS AND WANTS TO RESTART
          /*
          strokeWeight(3);
          stroke(0);
          fill(color(159,69,196));
          rect(170,100,200,100);
          fill(color(255));
          textSize(15);
          text("You won!" + "\n" + "Score: ",235,130);
          fill(0);
          // Displays button
          startOver.display();
          if (mousePressed) {
            if(mouseX > startOver.x && mouseX < (startOver.x + startOver.w + 50) && mouseY > startOver.y && mouseY < startOver.y + startOver.w) {
              // Takes you back to initial screen to begin game again
              // NEED ACTION HERE TO START OVER GAME
              println("Hooray");
          
            }
          }
          */

          
          
        }
      
      // player intersects with a coin (2)
      } else if (currentTile == 2) {
        player.collectCoin();
        c1.moveCoin();
        coinUpdateScreenOwnership();
        s1.increase_speed();
        s2.increase_speed();
        
      // player intersects with a westbound ship (3)
      } else if (currentTile == 3) {
        player.onBoatGoingLeft();
        
      // player intersects with a eastbound ship (4)
      } else if (currentTile == 4) {
        player.onBoatGoingRight(); 
      }
    }
  }
  
}

void coinUpdateScreenOwnership() {
  
  // set the old coins hitbox to 0
  screenOwnership[int(c1.previous_y)][int(c1.previous_x)] = 0;
  screenOwnership[int(c1.previous_y + c1.coinHeight)][int(c1.previous_x)] = 0;
  screenOwnership[int(c1.previous_y)][int(c1.previous_x + c1.coinWidth)] = 0;
  screenOwnership[int(c1.previous_y + c1.coinHeight)][int(c1.previous_x + c1.coinWidth)] = 0;
  
  // set the new coin's hitbox to 2
  screenOwnership[int(c1.current_y)][int(c1.current_x)] = 2;
  screenOwnership[int(c1.current_y + c1.coinHeight)][int(c1.current_x)] = 2;
  screenOwnership[int(c1.current_y)][int(c1.current_x + c1.coinWidth)] = 2;
  screenOwnership[int(c1.current_y + c1.coinHeight)][int(c1.current_x + c1.coinWidth)] = 2;
  
}

void gameover(){
}


//Each lane is going to be 35 pixels in height -- so there will be 10 lanes 
//(350 pixels of water total)
//counting for each lane starts at the top of the screen
//each time the swimmer moves 35 pixels
//Odd number lanes move in +x direction
//even number lanes move in -x direction