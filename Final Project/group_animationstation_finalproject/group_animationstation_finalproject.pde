import controlP5.*; 

public enum GameState {
  
  STARTGUI, PLAYSCREENGUI, LOADCITYGUI
  
}


// Variables for building //
int currentBuildingIndex = 1;
int buildingPadding = 20;
int currentEditBuildingIndex = 0;
int currentDeleteBuildingIndex = 0;

ArrayList<Building> allBuildings;
Building newBuilding;

Boolean placingBuilding = false;
Boolean editingBuilding = false;
Boolean deletingBuilding = false;

PImage editingImg;
PImage deletingImg;


// Variables for Building //

GameState state;
ControlP5 playScreenGUI, startGUI, loadCityGUI;

RadioButton bed, bldgimgs, soundrb, birdrb, stormrb;
PImage blg, blg2; 
Group bldgkey, legend;
Boolean display_images = true;

PFont miniml;

// Variables for GUI's
PImage skyline;
PFont castellar;
PFont arial;
String textValue = "";

Button createNewCity;
Button loadExistingCity;


void setup(){
  
  allBuildings = new ArrayList<Building>();
  editingImg = loadImage("editing.png");
  editingImg.resize(100, 56);
  deletingImg = loadImage("deleting.png");
  deletingImg.resize(48, 60);
  
  size(1000,600);
  textFont(createFont("Miniml",15));
  
  //this is the default GUI
  //Rakshana -- when you have your code working, change default
  //screen to STARTGUI
  //state = GameState.PLAYSCREENGUI; 
  state = GameState.STARTGUI;
  createPlayScreen();
  
  //RAKSHANA: I created 2 calls to create your two GUIS, put your code in those calls
  //also, note the GUI names I created above and make sure to use those
  createStartScreen();
  createLoadScreen();
  
  //RAKSHANA: In your event calls, make sure to switch the state. If the user presses play new
  //game: switch the game state to PLAYSCREENGUI (Code:  state = GameState.PLAYSCREENGUI; )
  //If the user presses load existing, switch the game state to LOADCITYGUI 
  //(Code: state = GameState.LOADCITYGUI;) 
  
  
 
}



void draw() {
 
  switch(state){
    
    case STARTGUI: 
      startGUI.show();
      playScreenGUI.hide();
      loadCityGUI.hide();
      break;
      
    
    case PLAYSCREENGUI:
      textFont(createFont("Miniml",15));

      background(98,204,232);
      noStroke();
      fill(98,232,130);
      rect(0,530,800,70);
      playScreenGUI.show();
        if (display_images){
            displayBuildingImages();
            }
       
       startGUI.hide();
       loadCityGUI.hide();
       break;
      
    case LOADCITYGUI:
    
      background(color(25,96,193));
  
      skyline = loadImage("skyline.jpg");
      // Setting up background image
      pushMatrix();
      scale(1.2);
      image(skyline,0,0);
      popMatrix();
        
      stroke(0);
      fill(255);
      textSize(30);
      textFont(castellar);
      text("City Skyline", 385,345);
      textSize(20);
      text("Enter name of previously created city",290,400);
      startGUI.hide();
      playScreenGUI.hide();
      loadCityGUI.show();
      break;
    
    default:
      //Good practice to have a default screen. 
      startGUI.show();
      playScreenGUI.hide();
      loadCityGUI.hide();
      break;
      
    
  }
  
  displayAllBuildings();
  if (editingBuilding && allBuildings.size() > 0) {
    image(editingImg, allBuildings.get(currentEditBuildingIndex).x + allBuildings.get(currentEditBuildingIndex).buildingWidth / 2 - editingImg.width / 2, 565 - editingImg.height / 2);
  }
  
  if (deletingBuilding && allBuildings.size() > 0) {
    image(deletingImg, allBuildings.get(currentDeleteBuildingIndex).x + allBuildings.get(currentDeleteBuildingIndex).buildingWidth / 2 - deletingImg.width / 2, 565 - deletingImg.height / 2);

  }
  
}

void displayBuildingImages(){
  
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

void createPlayScreen(){
  
  
  playScreenGUI = new ControlP5(this);
  
  //create my desired group
  legend = playScreenGUI.addGroup("legend")
                     .setPosition(810,100)
                     .setSize(170,220)
                     .activateEvent(true)
                     .setBackgroundColor(color(252,243,227));
  
  //This block of code took care of ARROWS
  //Having a hard time getting the pictures loaded...
  PImage[] arrows = {loadImage("button_up.png"), loadImage("button_up_2.png"),loadImage("button_right.png"), loadImage("button_right_2.png"),loadImage("button_down.png"), loadImage("button_down_2.png"),loadImage("button_left.png"), loadImage("button_left_2.png")};
  for (PImage item : arrows){
    //go through each item and change the size
    item.resize(item.width/2,item.width/2);
  }
  playScreenGUI.addButton("up")
     .setPosition(110,10)
     .setImages(arrows[0],arrows[1],arrows[0])
     .setSize(arrows[0])
     .setGroup(legend)
     ;
     
   
   playScreenGUI.addButton("right")
     .setPosition(140,30)
     .setImages(arrows[2],arrows[3],arrows[2])
     .setSize(arrows[0])
     .setGroup(legend)
     ;
     

    playScreenGUI.addButton("down")
     .setPosition(110,50)
     .setImages(arrows[4],arrows[5],arrows[4])
     .setSize(arrows[0])
     .setGroup(legend)
     ;
     
    playScreenGUI.addButton("left")
     .setPosition(80,30)
     .setImages(arrows[6],arrows[7],arrows[6])
     .setSize(arrows[0])
     .setGroup(legend)
     ;
    
    
   //adding Bird Button
   PImage[] sound = {loadImage("sound.png"),loadImage("mute.png")};
   for (PImage item : sound){
     item.resize(item.width/35,item.width/35);
   }
       soundrb = playScreenGUI.addRadioButton("Sound")
      .setPosition(15, 95)
      .setImages(sound[0],sound[0],sound[1])
      .setGroup(legend)
      .addItem("sound",0)
      ;
      
     //NEED TO FIGURE OUT WHY THE DISPLAY FUNCTION GOES AWAY 
   PImage[] bird = {loadImage("bird.png"),loadImage("bird_2.png")};
   for (PImage item : bird){
     item.resize(item.width/8,item.width/8);
   }
   birdrb = playScreenGUI.addRadioButton("Bird")
               .setPosition(15,170)
               .setImages(bird[0],bird[0],bird[1])
               .setGroup(legend)
               .addItem("bird",0)
               ;
   
   PImage[] storm = {loadImage("storm.png"),loadImage("storm_2.png")};
   for (PImage item : storm){
     item.resize(item.width/9,item.width/9);
   }
   stormrb = playScreenGUI.addRadioButton("Storm")
               .setPosition(70,170)
               .setImages(storm[0],storm[0],storm[1])
               .setGroup(legend)
               .addItem("storm",0)
               ;
   
   
   //Radio Buttons for Build, Edit, Delete
   bed = playScreenGUI.addRadioButton("radioButtonbed")
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
   bldgimgs = playScreenGUI.addRadioButton("radioButtonbldgs")
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


void createStartScreen(){
  
  startGUI = new ControlP5(this);
  skyline = loadImage("skyline.jpg");
  castellar = createFont("Castellar", 30);
  textFont(castellar);
  
   // Initializing buttons
  createNewCity = new Button(390,400,250,40,color(255),"Create New Skyline");
  loadExistingCity = new Button(390,470,250,40,color(255),"Load Existing Skyline");
  
  background(color(25,96,193));
  
  pushMatrix();
  scale(1.2);
  image(skyline,0,0);
  popMatrix();
  
  stroke(0);
  fill(255);
  textSize(30);
  text("City Skyline", 385,345);
  
  // Displays buttons for user to select action
  createNewCity.display();
  loadExistingCity.display();
  
  
}

void createLoadScreen(){
  
  // NEED TO CHECK TEXTBOX FUNCTIONALITY - WHEN TYPING IN BOX FOR A SECOND TIME, GOES TO NEXT SCREEN
  loadCityGUI = new ControlP5(this);
  
  arial = createFont("Arial", 12);
  textFont(arial);
  
  
 
 
  
  
  loadCityGUI.addTextfield("input")
   .setPosition(350,415)
   .setSize(200,40)
   .setFont(arial)
   .setFocus(true)
   .setColor(color(255,0,0))
  ;

  loadCityGUI.addTextfield("textValue")
    .setPosition(350,475)
    .setSize(200,40)
    .setFont(arial)
    .setAutoClear(false)
  ;
    
  loadCityGUI.addBang("clear")
    .setPosition(575,475)
    .setSize(80,40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
  ;

  
    
   loadCityGUI.addTextfield("default")
   .setPosition(20,550)
   .setFont(arial)
   .setAutoClear(false)
   ;
   

  textFont(arial);
  
}
void controlEvent(ControlEvent theEvent){
  
  //check to see what radio button this is from
  if (theEvent.isFrom(bldgimgs)){
    
    //check which functionality is being pressed
    if (theEvent.getValue() == 0.0) {
      println("Building One Chosen");
      currentBuildingIndex = 1;
    }
    else if (theEvent.getValue() == 1.0) {
      println("Building Two Chosen");
      currentBuildingIndex = 2;
    }
    else if (theEvent.getValue() == 2.0) {
      println("Building Three Chosen");
      currentBuildingIndex = 3;
    }
    
  }
  else if (theEvent.isFrom(bed)){
    if (theEvent.getValue() == 0.0) {
      println("Build Functionality");
      newBuilding = (new Building(650, currentBuildingIndex, 0));
      placingBuilding = true;
      editingBuilding = false;
      deletingBuilding = false;
    }
    else if (theEvent.getValue() == 1.0) {
      println("Edit Functionality");
      editingBuilding = true;
      placingBuilding = false;
      deletingBuilding = false;
    }
    else if (theEvent.getValue() == 2.0) {
      println("Delete Functionality");
      deletingBuilding = true;
      editingBuilding = false;
      placingBuilding = false;
    }
    
  }
  else if(theEvent.isFrom(soundrb)){
    
    println("Sound is being pressed");
    //Rakshana: Can't tell which switch it is on, but from here we can basically make a sound boolean
    //the opposite of what it was
   
    
  }
  
  else if (theEvent.isFrom(birdrb)){
    println("Bird is being pressed");
    //Rakshana: Can't tell which switch it is on, but here you can switch the sound of bird to on or off
    //even if bird is pressed -- make sure you check to see if sound is muted because that
    //will affect if the bird sound is actually displayed
  }
  
    else if (theEvent.isFrom(stormrb)){
    println("Storm is being pressed");
    //Rakshana: Can't tell which switch it is on, but here you can switch the sound of storm to on or off
    //even if storm is pressed -- make sure you check to see if sound is muted because that
    //will affect if the storm sound is actually displayed
  }
  else if(theEvent.isGroup()){
    if (theEvent.getGroup() == legend && theEvent.getGroup().isOpen()){
      
      //If we get here, we can display the desired images
      display_images = true; 
      
      
    }
    else if (theEvent.getGroup() == legend && theEvent.getGroup().isOpen() == false){
      display_images = false;
    }
  }
  
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '" + theEvent.getName() + "' : " + theEvent.getStringValue()
    );
  }
}

public void up(){
  println("The up arrow is being pressed");
  if (editingBuilding) {
    allBuildings.get(currentEditBuildingIndex).addBlock(); 
  } 
}

public void down(){
  println("The down arrow is being pressed");
  if (editingBuilding) {
    allBuildings.get(currentEditBuildingIndex).subtractBlock(); 
  }
}

public void right(){
  println("The right arrow is being pressed");
  if (editingBuilding) {
    allBuildings.get(currentEditBuildingIndex).moveRight();
  }
}

public void left(){
  println("The left arrow is being pressed");
  if (editingBuilding) {
    allBuildings.get(currentEditBuildingIndex).moveLeft();   
  }
}

void displayAllBuildings() {
  if (placingBuilding) {
    if (mouseX < 800 - newBuilding.buildingWidth) {
      newBuilding.x = mouseX;
    }
    newBuilding.display();
  }
  for (int i = 0; i< allBuildings.size(); i++) {
    allBuildings.get(i).display(); 
  }
}

void mousePressed() {
  // Code for selecting which screen to go to
  // If "Create New City" button is pressed, user is taken to the screen to create a new city
  if(state == GameState.STARTGUI && mouseX > createNewCity.x && mouseX < (createNewCity.x + createNewCity.w) && mouseY > createNewCity.y && mouseY < (createNewCity.y + createNewCity.h)) {
    println("Create new city!");
    state = GameState.PLAYSCREENGUI;
    
  }
  
  // If "Load Existing City" button is pressed, user is taken to the screen to load in an pre-existing city  
  else if(state == GameState.STARTGUI && mouseX > loadExistingCity.x && mouseX < (loadExistingCity.x + loadExistingCity.w) && mouseY > loadExistingCity.y && mouseY < (loadExistingCity.y + loadExistingCity.h)) {
    println("Load existing city!");
    state = GameState.LOADCITYGUI;
    //createLoadScreen();

  }
  
  // Code for clicking to place buildings
  if (placingBuilding) {
    if (mouseX > 0 && mouseX < 800 - newBuilding.buildingWidth) {
      for (int i = 0; i< allBuildings.size(); i++) {
        if ((mouseX > allBuildings.get(i).x && mouseX < allBuildings.get(i).x + allBuildings.get(i).buildingWidth + buildingPadding) == true) {
          return;
        }
      }
      placingBuilding = false;
      allBuildings.add(newBuilding);
      currentEditBuildingIndex = allBuildings.size() - 1;
    }

  // Code for clicking to select which building is being edited
  } else if (editingBuilding) {
    if (mouseX > 0 && mouseX < 800) {
      for (int i = 0; i< allBuildings.size(); i++) {
        if ((mouseX > allBuildings.get(i).x && mouseX < allBuildings.get(i).x + allBuildings.get(i).buildingWidth) == true) {
          currentEditBuildingIndex = i;
        }
      }
    }
  } else if (deletingBuilding) {
     if (mouseX > 0 && mouseX < 800) {
      for (int i = 0; i< allBuildings.size(); i++) {
        if ((mouseX > allBuildings.get(i).x && mouseX < allBuildings.get(i).x + allBuildings.get(i).buildingWidth) == true) {
          if (i == currentDeleteBuildingIndex) {
            allBuildings.remove(i);
            currentDeleteBuildingIndex = allBuildings.size() - 1;
          } else {
            currentDeleteBuildingIndex = i;
          }
        }
      }
     }
  }
}

// Functions for text box functionality on "Load Existing City" screen
public void clear() {
  loadCityGUI.get(Textfield.class, "textValue").clear();
}



public void input (String theText) {
  println("a textfield event for controller 'input' : "+ theText);
}
