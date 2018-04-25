import controlP5.*; 

ControlP5 cp5;
RadioButton bed, bldgimgs;
PImage blg, blg2; 
Group bldgkey, legend;
Boolean display_images = true;

PFont miniml;

void setup(){
  
  size(1000,600);
  textFont(createFont("Miniml",15));
  cp5 = new ControlP5(this);
  
  //create my desired group
  legend = cp5.addGroup("legend")
                     .setPosition(810,100)
                     .setSize(170,220)
                     .activateEvent(true)
                     .setBackgroundColor(color(252,243,227));
  
  //This block of code took care of ARROWS
  //Having a hard time getting the pictures loaded...
  PImage[] u_arrows = {loadImage("button_up.png"), loadImage("button_up_2.png")};
  cp5.addButton("up")
     .setPosition(110,10)
     .setImages(u_arrows)
     .setSize(u_arrows[0].width/2,u_arrows[0].width/2)
     .setGroup(legend)
     ;
     
   PImage[] r_arrows = {loadImage("button_right.png"), loadImage("button_right_2.png")};
   cp5.addButton("right")
     .setPosition(140,30)
     .setImages(r_arrows)
     .setSize(r_arrows[0].width/2,r_arrows[0].width/2)
     .setGroup(legend)
     ;
     
    PImage[] d_arrows = {loadImage("button_down.png"), loadImage("button_down_2.png")};
    cp5.addButton("down")
     .setPosition(110,50)
     .setImages(d_arrows)
     .setSize(d_arrows[0].width/2,d_arrows[0].width/2)
     .setGroup(legend)
     ;
     
    PImage[] l_arrows = {loadImage("button_left.png"), loadImage("button_left_2.png")};
    cp5.addButton("left")
     .setPosition(80,30)
     .setImages(l_arrows)
     .setSize(l_arrows[0].width/2,l_arrows[0].width/2)
     .setGroup(legend)
     ;
    
   //Radio Buttons for Build, Edit, Delete
   bed = cp5.addRadioButton("radioButtonbed")
             .setPosition(100,90)
             .setSize(20,20)
             .setColorLabel(color(0))
             .setItemsPerRow(1)
             .addItem("Build",0)
             .addItem("Edit",1)
             .addItem("Delete",2)
             .setGroup(legend)
             ;
   
   blg = loadImage("bldg_placeholder.jpg");
   blg2 = loadImage("bldg_placeholder_2.png");
   blg.resize(blg.width/5,blg.width/5);
   blg2.resize(blg2.width/5,blg2.width/5);
   bldgimgs = cp5.addRadioButton("radioButtonbldgs")
                 .setPosition(15,10)
                 .setItemsPerRow(1)
                 //.setImages(blg,blg,blg2)
                 .setSize(20,20)
                 .setColorLabel(color(0))
                 .addItem("Bldg1",0)
                 .addItem("Bldg2",1)
                 .addItem("Bldg3",2)
                 .setGroup(legend)
                 ;
  
  

       
  
}



void draw() {
  
  background(98,204,232);
  noStroke();
  fill(98,232,130);
  rect(0,530,800,70);
  
  //Might put this in its own method to clean up draw loop
  if (display_images){
    
    fill(252,243,227);
    noStroke();
    rect(810,350,170,180);
    fill(0);
    text("For Reference:",820,370);
    
    image(blg,820,380);
    text("Building One", 865, 400);
    image(blg2,820,430);
    text("Building Two", 865, 455);
    image(blg, 820, 480);
    text("Building Three", 865, 505);
    
  }
}

void controlEvent(ControlEvent theEvent){
  
  //check to see what radio button this is from
  if (theEvent.isFrom(bldgimgs)){
    
    //check which functionality is being pressed
    if (theEvent.getValue() == 0.0){
      println("Building One Chosen");
      //Nathan: Put Bldg1 properties here 
      //maybe a Boolean that allows code to know which top to create
    }
    else if (theEvent.getValue() == 1.0){
      println("Building Two Chosen");
      //Nathan: Put Bldg2 properties here 
      //maybe a Boolean that allows code to know which top to create
    }
    else {
      println("Building Three Chosen");
      //Nathan: Put Bldg3 properties here 
      //maybe a Boolean that allows code to know which top to create
    }
    
  }
  else if (theEvent.isFrom(bed)){
    if (theEvent.getValue() == 0.0){
      println("Build Functionality");
      //Nathan: Put Build Functionality Here or call what method you need
      //probably good to put a boolean value here because only clicked
      //or called once when the button pressed
    }
    else if (theEvent.getValue() == 1.0){
      println("Edit Functionality");
      //Nathan: Put Edit Functionality Here or call what method you need
      //probably good to put a boolean value here because only clicked
      //or called once when the button pressed
    }
    else {
      println("Delete Functionality");
      //Nathan: Put Delete Functionality Here or call what method you need
      //probably good to put a boolean value here because only clicked
      //or called once when the button pressed
    }
    
  }
  else if(theEvent.isGroup()){
    if (theEvent.getGroup() == legend && theEvent.getGroup().isOpen()){
      
      //If we get here, we can display the desired images
      display_images = true; 
      
      
    }
    else{
      display_images = false;
    }
  }
}

public void up(){
  println("The up arrow is being pressed");
  //Nathan put increasing height info here
  //you can put an if statement here to make sure the 
  //bldg doesn't go past max_height 
}

public void down(){
  println("The down arrow is being pressed");
  //Nathan put decreasing height info here
  //you can put an if statement here to make sure the 
  //bldg doesn't go below min_height 
}

public void right(){
  println("The right arrow is being pressed");
  //means right arrow is being pressed, not sure what functionality
  //you want here
}

public void left(){
  println("The left arrow is being pressed");
  //means left arrow is being pressed, not sure what functionality
  //you want here
}