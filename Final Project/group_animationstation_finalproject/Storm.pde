class Storm{
  

  //PShape storm, cloud;
  PImage cloud; 
  Raindrop[] raindrops = new Raindrop[20]; 
  float xPos = -20;
  //float yPos = 35;
  //float xPos = 100;
  float yPos = 100;
  
  //Do we want to make the background dark and stormy if a storm comes?? 
  
  Storm(){
    
    cloud = loadImage("cloud.png");
    cloud.resize(cloud.width/8,cloud.height/8);
    
    //create a new raindrop for each item in array
    for (int i = 0; i<raindrops.length; i++){
       raindrops[i] = new Raindrop(int(random(xPos+10,xPos+150)),int(random(yPos+20,yPos+45)));
      
    }
    
    
    //createShape(GROUP);
    
    //cloud = loadShape("cloud.svg");
    
    
    //storm.addChild(cloud);
    //How do we attach the rain clouds to this??
 
  }
  
  void display(){
    
    for (Raindrop rd : raindrops){
      rd.display();
    }
    image(cloud, xPos, yPos);
    image(cloud, xPos + 70, yPos - 5);
    image(cloud, xPos + 45, yPos + 15);
     
    
  }
  
  void move(){
    
      //make sure raindrop xposition is in accordance with cloud
      if (xPos < 800){
      
      this.xPos += 1; 

      }
      else{
      this.xPos = -20;
      resetRaindrops();
      

      }
    //go through each item in the list and make raindrop move
    for (Raindrop rd: raindrops){
      
      rd.xPos = rd.xPos + 1;
      //make sure raindrop xposition is in accordance with cloud
      //if (xPos < 800){
     
      //rd.xPos = rd.xPos + 1;
      //}
      //else{

      //rd.xPos = int(random(xPos+10,xPos+150));
      //}
    
      
      if (rd.yPos < this.yPos + 100){
        
        rd.yPos = rd.yPos + 1; 

      }
      else{
        
        rd.yPos = int(random(this.yPos+20,this.yPos+45));

      }
      
    }
  }
  
  void setPosition(){
    this.xPos = -20;
    this.yPos = 100;
    
    resetRaindrops();
  }
  
  void resetRaindrops(){
    for (int i = 0; i<raindrops.length; i++){
       raindrops[i].setPosition(int(random(xPos+10,xPos+150)),int(random(yPos+20,yPos+45)));
    }
  }
  
}