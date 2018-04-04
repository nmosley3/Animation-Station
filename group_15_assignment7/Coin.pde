class Coin{
  
  PImage[] images; 
  int imageCount;
  int frame = 0;
  
  float current_x = 100;
  float current_y = 100;
  
  //values for timer 
  int animationTimer = 0;
  int speed = 67;
  
 
  Coin(String object, int count){
    
    
     this.imageCount = count;
     //create array with size of number of frames
     images = new PImage[imageCount];
     
     //go through for loop and create files and add 
     //to array 
     for (int i = 0; i<imageCount; i++){
       
       //use nf for image count
       String filename = object + nf(i+1,2) + ".png";
       images[i] = loadImage(filename);
       images[i].resize(20,20);
     }
       
  }
  
  void display() {
    //incrememnt frame based on how often we want
    //frame to switch
    if((millis()-animationTimer) >= speed){
       frame = (frame+1)%imageCount;
       animationTimer = millis();
    }
   
    image(images[frame],current_x,current_y);     
  }
  
  void move(){
    
    //pass it what quadrant it is in and calculate random variables based on that
  }
}