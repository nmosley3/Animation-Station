class Shark{
  
  PImage img;
  int lane; 
  float current_x;
  float current_y;
  float multiplier = 1.0;
  //this is an array that holds the speeds for each lane
  float[] speeds = new float[]{1,-2,0.5,-1.8,2.1,-0.9,0.7,-1.2,1.9,-1.6};
  
  float speed;
  //float lastSpeed;
  float previous_x, previous_y;
  
  Shark(int lane){
    
    this.lane = lane;
    this.speed = speeds[lane - 1];
    //this.lastSpeed = speed;
    
    //determine which side to start the shark on
    if (lane % 2 == 0){
      img = loadImage("shark.png");
      this.current_x = 600;
      //print("here");
    } else {
      img = loadImage("shark2.png");
      this.current_x = 0;
    }
    
    img.resize(50,25);
    this.current_y = ((lane-1)*35)+5;
    
  }
  
  void display(){
    
    image(img,this.current_x, this.current_y);
  }
  
  void move(){
    
    this.previous_x = this.current_x;
    this.previous_y = this.current_y;
    //this.lastSpeed = speed;
    this.speed = (speeds[lane-1]*multiplier);
    this.current_x = this.current_x + this.speed;
    
    if (this.current_x > width) {
      this.current_x = -img.width;
    }
    
  }
  
  void increase_speed(){
    
    multiplier += 0.02;
    
  }
  

  
}