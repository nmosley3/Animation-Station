class Shark{
  
  PImage img;
  int lane; 
  float current_x;
  float current_y;
  float multiplier = 1.0;
  //this is an array that holds the speeds for each lane
  float[] speeds = new float[]{1,-2,0.5,-1.8,2.1,-0.9,0.3,-1.2,1.9,-1.6};
  
  Shark(int lane){
    
    this.lane = lane;
    
    //determine which side to start the shark on
    if (lane % 2 == 0){
      img = loadImage("shark.png");
      current_x = 600;
      print("here");
    }
    else{
      img = loadImage("shark2.png");
      current_x = 0;
    }
    
    img.resize(50,25);
    current_y = ((lane-1)*35)+5;
    
  }
  
  void display(){
    
    image(img,current_x,current_y);
    print(current_x);
  }
  
  void move(){
    
    current_x = current_x + (speeds[lane-1]*multiplier);
    
  }
  
  void increase_speed(){
    
    multiplier += 0.02;
    
  }
}