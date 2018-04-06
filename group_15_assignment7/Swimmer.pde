class Swimmer {
  float x, y, startingX, startingY;
  float speed;
  PImage currentSwimmer, swimmingManLeft, swimmingManUp, swimmingManRight, swimmingManDown;
  int direction;
  PImage[] swimmingManDirections;
  int [][] hitBox;
  int score;
  float newX, newY;
  
  
  Swimmer() {
    this.startingX = 290;
    this.startingY = 330;
    this.x = 290;
    this.y = 330;
    this.speed = 5;
    this.score = 0;
    
    newX = this.x;
    newY = this.y;
    
    hitBox = new int [4][2];
    
    // load the images of the swimmer for each direction
    this.swimmingManLeft = loadImage("swimmingManLeft.png");
    this.swimmingManUp = loadImage("swimmingManUp.png");
    this.swimmingManRight = loadImage("swimmingManRight.png");
    this.swimmingManDown = loadImage("swimmingManDown.png");
    this.currentSwimmer = this.swimmingManUp;
    
    // sort them into a list, starting with the left direction and going clockwise
    this.direction = 1;  
    swimmingManDirections = new PImage[4];
    swimmingManDirections[0] = this.swimmingManLeft;
    swimmingManDirections[1] = this.swimmingManUp;
    swimmingManDirections[2] = this.swimmingManRight;
    swimmingManDirections[3] = this.swimmingManDown;
    
    // resize the images to 10% their original size
    for (int i = 0; i < 4; i++) {
      swimmingManDirections[i].resize(int(swimmingManDirections[i].width * 0.1), int(swimmingManDirections[i].height * 0.1)); 
    }
     
  }
  
  // check if any of the directional arrows are pressed
  // move the swimmer in that direction and change the image accordingly
  void keyPressed() {
    if (key == CODED); {
      if (keyCode == LEFT) {
        newX -= this.speed;
        direction = 0;
      } else if (keyCode == RIGHT) {
        newX += this.speed;
        direction = 2;
      } else if (keyCode == UP) {
        newY -= this.speed;
        direction = 1;
      } else if (keyCode == DOWN) {
        newY += this.speed;
        direction = 3;
      }
      if (newX - this.currentSwimmer.width / 2 > 0 && newX + this.currentSwimmer.width / 2 < width) {
        this.x = newX;
      }
      if (newY - this.currentSwimmer.height / 2> 0 && newY + this.currentSwimmer.height/ 2 < height) {
        this.y = newY;
      }  
  }
  }
  
  
  // display the swimmer according to its current direction
  void display() {
    this.currentSwimmer = swimmingManDirections[direction];
    image(this.currentSwimmer, this.x - this.currentSwimmer.width / 2, this.y - this.currentSwimmer.height / 2); 
  }
  
  
  void lose() {
    this.x = startingX;
    this.y = startingY;
    newX = this.x;
    newY = this.y;
    
    this.score = 0;
  }
  
  void collectCoin() {
    this.score += 1; 
  }
  
  
  void onBoatGoingLeft () {
     
    
  }
  
  void onBoatGoingRight () {
    
    
  }
  
  
}
