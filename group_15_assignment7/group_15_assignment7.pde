Coin c1; 
Shark s1,s2,s3,s4;
Sailboat sb1, sb2, sb3;
Swimmer player;
Button startOver;
Shark[] allSharksLeft, allSharksRight;
Sailboat[] allBoatsLeft, allBoatsRight;
Boolean noHit;
Boolean gameover;
Boolean paused;
Boolean victory;


ArrayList<Lifes> livesleft = new ArrayList<Lifes>();
int lastKey;
int [][] screenOwnership;
float currentTile = 0;

void setup(){
  
  size(600,400);
  
  gameover = false;
  paused = false;
  victory = false;
  
  //initialize coin
  c1 = new Coin("coin",6);
  
  //initialize sharks
  s1 = new Shark(5);
  s2 = new Shark(2);
  s3 = new Shark(7);
  s4 = new Shark(9);
  
  // initialize sailboats
  sb1 = new Sailboat(8);
  sb2 = new Sailboat(6);
  sb3 = new Sailboat(3);
  
  allSharksLeft = new Shark[1];
  allSharksRight = new Shark[3];
  
  allBoatsLeft = new Sailboat[2];
  allBoatsRight = new Sailboat[1];
  
  allSharksLeft[0] = s2;
  
  allSharksRight[0] = s1;
  allSharksRight[1] = s3;
  allSharksRight[2] = s4;
  
  allBoatsLeft[0] = sb1;
  allBoatsLeft[1] = sb2;
  
  allBoatsRight[0] = sb3;
  
  
  startOver = new Button(245,220,50,color(159,69,196),"Start Over");
  
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
  
  if (gameover == false && paused == false && victory == false) {
  
  for (Lifes live : livesleft){
    live.display();
  }
  
  textSize(30);
  fill(0);
  text("Score:" + player.score, 400, 382);
  
  c1.display();
  
  s1.display();
  s2.display();
  s3.display();
  s4.display();
  
  s1.move();
  s2.move();
  s3.move();
  s4.move();
  
  sb1.display();
  sb2.display();
  sb3.display();
  
  // delay the boats slightly
  if (frameCount > 120) {
    sb1.move();
  }
  sb2.move();
  sb3.move();
  
   if (keyPressed) {
     if (key == char(32)) {
       pause();
     }
      player.keyPressed();
    }
      
  sharkUpdateScreenOwnership();
  boatUpdateScreenOwnership();
  coinUpdateScreenOwnership();
  
  noHit = false;
  checkForCollision();
  
  
    player.display();
  
    // Victory condition
    if (player.score == 500){
      victory = true;   
    }
  }
  
  if (gameover) {
    gameover();
    return;
  }
  
  if (paused) {
    pause();
    if (keyCode == ENTER) {
      paused = false;
    }
    return;
  }
  
  if (victory) {
    victory();
    return;
  }
  
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


void checkForCollision() {
  
  // for each pixel the player covers, check if it is occupied by a hitbox
  if (noHit = true) {
  for (int i = int (player.y) - player.currentSwimmer.height / 2; i < int (player.y) +player.currentSwimmer.height / 2; i++) {
    for (int j = int(player.x) - player.currentSwimmer.width / 2; j < int(player.x) + player.currentSwimmer.width / 2; j ++) {
      currentTile = screenOwnership[i][j];
      
      // player intersects with a shark (1)
      if (currentTile == 1) {
        noHit = false;
        
        if (livesleft.size() > 0) {
          
          livesleft.remove(livesleft.size() - 1);
          player.lose();
        
        } else {      
          player.lose();
          gameover = true;
        }
        break;    
      
      // player intersects with a coin (2)
      } else if (currentTile == 2) {
        player.collectCoin();
        c1.moveCoin();
        coinUpdateScreenOwnership();
        s1.increase_speed();
        s2.increase_speed();
        noHit = false;
        break;
        
      // player intersects with a rightward ship (3)
      } else if (currentTile == 3) {
        player.onBoatGoingRight();
        noHit = false;
        break;
        
      // player intersects with a leftward ship (4)
      } else if (currentTile == 4) {
        player.onBoatGoingLeft(); 
        noHit = false;
        break;
      }
    }
  }
  }
  
}


// Update screen ownership for sharks
void sharkUpdateScreenOwnership() {
  
  
  // RIGHTWARD SHARKS
  for (int i = 0; i < allSharksRight.length; i++) {
  
  // reset previous shark hitbox to 0
  if (allSharksRight[i].previous_x > 0 && allSharksRight[i].previous_x < width) {
    screenOwnership[int(allSharksRight[i].previous_y)][int(allSharksRight[i].previous_x)] = 0;
    screenOwnership[int(allSharksRight[i].previous_y + allSharksRight[i].img.height)][int(allSharksRight[i].previous_x)] = 0;
  }
  
  if (allSharksRight[i].previous_x + allSharksRight[i].img.width < width && allSharksRight[i].previous_x + allSharksRight[i].img.width > 0) {
    screenOwnership[int(allSharksRight[i].previous_y)][int(allSharksRight[i].previous_x + allSharksRight[i].img.width)] = 0;
    screenOwnership[int(allSharksRight[i].previous_y + allSharksRight[i].img.height)][int(allSharksRight[i].previous_x + allSharksRight[i].img.width)] = 0;
  }
  
  // set current shark's hitbox to 1
  if (allSharksRight[i].current_x > 0) {
    screenOwnership[int(allSharksRight[i].current_y)][int(allSharksRight[i].current_x)] = 1;
    screenOwnership[int(allSharksRight[i].current_y + allSharksRight[i].img.height)][int(allSharksRight[i].current_x)] = 1;
  }
  if (allSharksRight[i].current_x + allSharksRight[i].img.width < width) {
    screenOwnership[int(allSharksRight[i].current_y)][int(allSharksRight[i].current_x + allSharksRight[i].img.width)] = 1;
    screenOwnership[int(allSharksRight[i].current_y + allSharksRight[i].img.height)][int(allSharksRight[i].current_x + allSharksRight[i].img.width)] = 1;
  }
  }
  
  //LEFTWARD SHARKS
  for (int i = 0; i < allSharksLeft.length; i++) {
  
  // reset previous shark hitbox to 0
  if (allSharksLeft[i].previous_x > 0 && allSharksLeft[i].previous_x < width) {
    screenOwnership[int(allSharksLeft[i].previous_y)][int(allSharksLeft[i].previous_x)] = 0;
    screenOwnership[int(allSharksLeft[i].previous_y + allSharksLeft[i].img.height)][int(allSharksLeft[i].previous_x)] = 0;
  }
  
  if (allSharksLeft[i].previous_x + allSharksLeft[i].img.width < width && allSharksLeft[i].previous_x + allSharksLeft[i].img.width > 0) {
    screenOwnership[int(allSharksLeft[i].previous_y)][int(allSharksLeft[i].previous_x + allSharksLeft[i].img.width)] = 0;
    screenOwnership[int(allSharksLeft[i].previous_y + allSharksLeft[i].img.height)][int(allSharksLeft[i].previous_x + allSharksLeft[i].img.width)] = 0;
  }
  
  // set current shark's hitbox to 1
  if (allSharksLeft[i].current_x > 0) {
    screenOwnership[int(allSharksLeft[i].current_y)][int(allSharksLeft[i].current_x)] = 1;
    screenOwnership[int(allSharksLeft[i].current_y + allSharksLeft[i].img.height)][int(allSharksLeft[i].current_x)] = 1;
  }
  if (allSharksLeft[i].current_x + allSharksLeft[i].img.width < width) {
    screenOwnership[int(allSharksLeft[i].current_y)][int(allSharksLeft[i].current_x + allSharksLeft[i].img.width)] = 1;
    screenOwnership[int(allSharksLeft[i].current_y + allSharksLeft[i].img.height)][int(allSharksLeft[i].current_x + allSharksLeft[i].img.width)] = 1;
  }
  }
}


// Update screen ownership for boats
void boatUpdateScreenOwnership() {
    
  
  //RIGHTWARD BOATS
  for (int i = 0; i < allBoatsRight.length; i++) {
      // reset previous shark hitbox to 0
    if (allBoatsRight[i].previous_x > 0 && allBoatsRight[i].previous_x < width) {
      screenOwnership[int(allBoatsRight[i].previous_y)][int(allBoatsRight[i].previous_x)] = 0;
      screenOwnership[int(allBoatsRight[i].previous_y + allBoatsRight[i].img.height)][int(allBoatsRight[i].previous_x)] = 0;
    }
  
    if (allBoatsRight[i].previous_x + allBoatsRight[i].img.width < width && allBoatsRight[i].previous_x + allBoatsRight[i].img.width > 0) {
      screenOwnership[int(allBoatsRight[i].previous_y)][int(allBoatsRight[i].previous_x + allBoatsRight[i].img.width)] = 0;
      screenOwnership[int(allBoatsRight[i].previous_y + allBoatsRight[i].img.height)][int(allBoatsRight[i].previous_x + allBoatsRight[i].img.width)] = 0;
    }
  
    // set current shark's hitbox to 1
    if (allBoatsRight[i].current_x > 0) {
      screenOwnership[int(allBoatsRight[i].current_y)][int(allBoatsRight[i].current_x)] = 3;
      screenOwnership[int(allBoatsRight[i].current_y + allBoatsRight[i].img.height)][int(allBoatsRight[i].current_x)] = 3;
    }
    if (allBoatsRight[i].current_x + allBoatsRight[i].img.width < width) {
      screenOwnership[int(allBoatsRight[i].current_y)][int(allBoatsRight[i].current_x + allBoatsRight[i].img.width)] = 3;
      screenOwnership[int(allBoatsRight[i].current_y + allBoatsRight[i].img.height)][int(allBoatsRight[i].current_x + allBoatsRight[i].img.width)] = 3;
    }   
  }
  
  //LEFTWARD BOATS
  for (int i = 0; i < allBoatsLeft.length; i++) {
  
  // reset previous shark hitbox to 0
  if (allBoatsLeft[i].previous_x > 0 && allBoatsLeft[i].previous_x < width) {
    screenOwnership[int(allBoatsLeft[i].previous_y)][int(allBoatsLeft[i].previous_x)] = 0;
    screenOwnership[int(allBoatsLeft[i].previous_y + allBoatsLeft[i].img.height)][int(allBoatsLeft[i].previous_x)] = 0;
  }
  
  if (allBoatsLeft[i].previous_x + allBoatsLeft[i].img.width < width && allBoatsLeft[i].previous_x + allBoatsLeft[i].img.width > 0) {
    screenOwnership[int(allBoatsLeft[i].previous_y)][int(allBoatsLeft[i].previous_x + allBoatsLeft[i].img.width)] = 0;
    screenOwnership[int(allBoatsLeft[i].previous_y + allBoatsLeft[i].img.height)][int(allBoatsLeft[i].previous_x + allBoatsLeft[i].img.width)] = 0;
  }
  
  // set current shark's hitbox to 1
  if (allBoatsLeft[i].current_x > 0) {
    screenOwnership[int(allBoatsLeft[i].current_y)][int(allBoatsLeft[i].current_x)] = 4;
    screenOwnership[int(allBoatsLeft[i].current_y + allBoatsLeft[i].img.height)][int(allBoatsLeft[i].current_x)] = 4;
  }
  if (allBoatsLeft[i].current_x + allBoatsLeft[i].img.width < width) {
    screenOwnership[int(allBoatsLeft[i].current_y)][int(allBoatsLeft[i].current_x + allBoatsLeft[i].img.width)] = 4;
    screenOwnership[int(allBoatsLeft[i].current_y + allBoatsLeft[i].img.height)][int(allBoatsLeft[i].current_x + allBoatsLeft[i].img.width)] = 4;
  }
  }
}


// Update screen ownership for the coin
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
  // Displays score and reset button
  // "Game Over" banner is disappearing though ***
  strokeWeight(3);
  stroke(0);
  fill(color(159,69,196));
  rect(170,100,260,100);
  fill(color(255));
  textSize(15);
  text("Game over!" + "\n" + "Score: " + str(player.score), 260, 140);
  fill(0);
  // Displays button
  startOver.display();
  if (mousePressed) {
    if(mouseX > startOver.x && mouseX < (startOver.x + startOver.w + 50) && mouseY > startOver.y && mouseY < startOver.y + startOver.w) {
    //Takes you back to initial screen to begin game again
    //NEED ACTION HERE TO START OVER GAME
    resetGame();      
    }
  }
}

void resetGame() {
  gameover = false;
  victory = false;
  c1 = new Coin("coin",6);
  player.score = 0;
  player.num_coins = 0;
  livesleft.add(new Lifes(10,353));
  livesleft.add(new Lifes(30,353));
  
}

void victory() {
  // Displays score and reset button
  // "Game Over" banner is disappearing though ***
  strokeWeight(3);
  stroke(0);
  fill(color(159,69,196));
  rect(170,100,260,100);
  fill(color(255));
  textSize(15);
  text("  Congrats! You won!" + "\n" + "           Score: " + str(player.score), 200, 140);
  fill(0);
  // Displays button
  startOver.display();
  if (mousePressed) {
    if(mouseX > startOver.x && mouseX < (startOver.x + startOver.w + 50) && mouseY > startOver.y && mouseY < startOver.y + startOver.w) {
    //Takes you back to initial screen to begin game again
    //NEED ACTION HERE TO START OVER GAME
    resetGame();      
    }
  }
}

void pause () {
  paused = true;
  strokeWeight(3);
  stroke(0);
  fill(color(159,69,196));
  rect(170,100,260,100);
  fill(color(255));
  textSize(15);
  text("      Game is paused. \n Press Enter to resume.", 215, 140);
  fill(0);
}




//Each lane is going to be 35 pixels in height -- so there will be 10 lanes 
//(350 pixels of water total)
//counting for each lane starts at the top of the screen
//each time the swimmer moves 35 pixels
//Odd number lanes move in +x direction
//even number lanes move in -x direction
