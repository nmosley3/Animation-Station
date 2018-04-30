class Storm{
  

  PShape storm, cloud;
  Raindrop[] raindrops; 
  float xPos = -20;
  float yPos = 35;
  
  //Do we want to make the background dark and stormy if a storm comes?? 
  
  Storm(){
    
    storm = createShape(GROUP);
    
    cloud = loadShape("cloud.svg");
    
    storm.addChild(cloud);
    //How do we attach the rain clouds to this??
    
    
    
    
    
  }
  
}