//import java.util.Random;

class Coin{
  
  PImage[] images; 
  int imageCount;
  int frame = 0;
  int lane;
  int current_quad = 1;
  //int[] quad_array = new int[]{1,2,3,4};
  
  float current_x = 100;
  float current_y = 100;
  
  float previous_x = 100;
  float previous_y = 100;
  
  int coinWidth, coinHeight;
  
  //values for timer 
  int animationTimer = 0;
  int speed = 67;
  
 
  Coin(String object, int count){
    
     coinWidth = 25;
     coinHeight = 25;
    
     this.imageCount = count;
     
     //create array with size of number of frames
     images = new PImage[imageCount];
     
     //go through for loop and create files and add 
     //to array 
     for (int i = 0; i<imageCount; i++){
       //use nf for image count
       String filename = object + nf(i+1,2) + ".png";
       images[i] = loadImage(filename);
       images[i].resize(coinWidth, coinHeight);
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
  
  //void move(){
    
  //  int new_quad = current_quad;
  //  while (new_quad == current_quad){
      
  //    //get random int
  //    new_quad = 1 + rand.nextInt(4);
  //  }
   
  //   if (new_quad == 1) {
  //     lane = rand.nextInt(5) + 1;
  //     current_y= ((lane-1)*35) + 5;
  //     current_x = rand.nextInt(200) + 50;        
  //   }
  //   else if (new_quad == 2){
  //     lane = rand.nextInt(5) + 1;
  //     current_y= ((lane-1)*35) + 5;
  //     current_x = rand.nextInt(200) + 350; 
       
  //   }
  //   else if (new_quad == 3){
  //     lane = rand.nextInt(5) + 6;
  //     current_y= ((lane-1)*35) + 5;
  //     current_x = rand.nextInt(200) + 50; 
       
  //   }
  //   else{
  //     lane = rand.nextInt(5) + 6;
  //     current_y= ((lane-1)*35) + 5;
  //     current_x = rand.nextInt(200) + 350; 
  //   }
     
  //   current_quad = new_quad;
  //  //pass it what quadrant it is in and calculate random variables based on that
  //}
  
  // Maddie: write code for moving the coin here
  // When you're done, try moving the swimmer over the coin to see if it works
  void moveCoin() {
    
    int new_quad = current_quad;
    while (new_quad == current_quad){
      
      //get random int
      new_quad = int(random(1,5));
    }
    
      current_quad = new_quad;
      previous_x = current_x;
      previous_y = current_y;
       
     if (new_quad == 1) {
       lane = int(random(1,6));
       current_y= ((lane-1)*35) + 5;
       current_x = int(random(50,251));      
     }
     else if (new_quad == 2){
       lane = int(random(1,6));
       current_y= ((lane-1)*35) + 5;
       current_x = int(random(350,551));
       
     }
     else if (new_quad == 3){
       lane = int(random(6,11)); 
       current_y= ((lane-1)*35) + 5;
       current_x = int(random(50,251)); 
       
     }
     else{
       lane = int(random(6,11));
       
       current_y= ((lane-1)*35) + 5;
       current_x = int(random(350,551));
     }
     
     
     
    
    //pass it what quadrant it is in and calculate random variables based on that
    // I just need these two lines of code
    //previous_x = current_x;
    //previous_y = current_y;
    
  }
  
}

    
  
  