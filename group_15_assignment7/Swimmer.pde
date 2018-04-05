class Swimmer {
  float x, y, startingX, startingY;
  float speed;
  PImage swimmingManLeft, swimmingManUp, swimmingManRight, swimmingManDown;
  int direction;
  PImage[] swimmingManDirections;
  
  
  Swimmer() {
    this.startingX = 290;
    this.startingY = 330;
    this.x = 290;
    this.y = 330;
    this.speed = 10;
    
    // load the images of the swimmer for each direction
    this.swimmingManLeft = loadImage("swimmingManLeft.png");
    this.swimmingManUp = loadImage("swimmingManUp.png");
    this.swimmingManRight = loadImage("swimmingManRight.png");
    this.swimmingManDown = loadImage("swimmingManDown.png");
    
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
    print ("SWIMMER KEY PRESSED");
    if (key == CODED); {
      if (keyCode == LEFT) {
        print ("LEFT");
        this.x -= this.speed;
        direction = 0;
      } else if (keyCode == RIGHT) {
        this.x += this.speed;
        direction = 2;
      } else if (keyCode == UP) {
        this.y -= this.speed;
        direction = 1;
      } else if (keyCode == DOWN) {
        this.y += this.speed;
        direction = 3;
      }
    }
  }
  
  // display the swimmer according to its current direction
  void display() {
    image(swimmingManDirections[direction], this.x, this.y);   
  }
  
}
