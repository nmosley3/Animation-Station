import controlP5.*;

// Sound functionality
import processing.sound.*;
SoundFile main;
SoundFile rain;
SoundFile bird;

String path;
String path2;
String path3;

int soundCount;
int rainSoundCount;
int birdSoundCount;

SaveFile newSave;
String saveCityName, loadCityName;
String[] buildingsLoaded, buildingData;

File loadFile, saveFile;


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
Boolean savingCity = false;

PImage editingImg;
PImage deletingImg;

// Booleans for sound
Boolean mainSound = true;
Boolean rainSound = false;
Boolean birdSound = false;

// Variables for Maddie's GUIs
GameState state;
ControlP5 playScreenGUI, startGUI, loadCityGUI;

controlP5.Textfield cityNameInput;
controlP5.Button saveCityButton, playScreenMenuButton, loadScreenMenuButton;

RadioButton bed, bldgimgs, soundrb, birdrb, stormrb;
PImage blg, blg2; 
Group bldgkey, legend;
Boolean display_images = true;
PFont miniml;

// Variables for Rakshana's GUIs
PImage skyline;
PFont castellar;
PFont magneto;
PFont arial;
String textValue = "";
Button createNewCity;
Button loadExistingCity;

//Variables for Birds & Storm
Bird[] birdflock = new Bird[15]; 
Boolean showBirds = false; 
//Raindrop rd;
Storm storm; 
Boolean showStorm = false; 

void setup(){
  
  allBuildings = new ArrayList<Building>();
  editingImg = loadImage("editing.png");
  editingImg.resize(100, 56);
  deletingImg = loadImage("deleting.png");
  deletingImg.resize(48, 60);
  
  // Loading sound file
  path = sketchPath("urban_traffic.mp3");
  main = new SoundFile(this,path);
  main.play();
  
  path2 = sketchPath("rain_storm.mp3");
  rain = new SoundFile(this,path2);
  
  path3 = sketchPath("birds_chirping.mp3");
  bird = new SoundFile(this, path3);
  
  
  size(1000,600);
  textFont(createFont("Miniml",15));
  
  state = GameState.STARTGUI;
  createPlayScreen();
  
  createStartScreen();
  createLoadScreen();
  
  
  
  //Create Array of Birds
  
  for (int i = 0; i < birdflock.length; i++){
    
    birdflock[i] = new Bird(int(random(0,100)),int(random(50,150)), int(random(1,80)));
  }

  //create a storm 
  storm = new Storm();
 
}



void draw() {
 
  switch(state){
    
    case STARTGUI:
    
      startGUI.show();
      playScreenGUI.hide();
      loadCityGUI.hide();
      
      skyline.resize(840, 300);
      castellar = createFont("Castellar", 30);
      magneto = createFont("Magneto Bold", 30);
      textFont(magneto);
      //textFont(castellar);

  
   
      //background(color(52,56,129));
      background(color(75,79,157));
      //background(color(44,41,44));
      //background(color(14,28,100));

  
      pushMatrix();
      scale(1.2);
      image(skyline,0,200);
      popMatrix();
  
      stroke(0);
      fill(255);
      textSize(60);
      text("City Skyscraper", 240,90);
  
      // Displays buttons for user to select action
      textFont(castellar);
      createNewCity.display();
      loadExistingCity.display();
      //testbird.display();
      //testbird.move();
      
      break;
      
    
    case PLAYSCREENGUI:
      textFont(createFont("Miniml",15));
      
      background(52,56,129);
      noStroke();
      fill(39,39,49);
      rect(0,530,1000,70);
      playScreenGUI.show();
      //if (display_images){
      //    displayBuildingImages();
      // }
      
      displayAllBuildings();
      if (editingBuilding && allBuildings.size() > 0) {
        image(editingImg, allBuildings.get(currentEditBuildingIndex).x + allBuildings.get(currentEditBuildingIndex).buildingWidth / 2 - editingImg.width / 2, 565 - editingImg.height / 2);
      }
  
      if (deletingBuilding && allBuildings.size() > 0) {
        image(deletingImg, allBuildings.get(currentDeleteBuildingIndex).x + allBuildings.get(currentDeleteBuildingIndex).buildingWidth / 2 - deletingImg.width / 2, 565 - deletingImg.height / 2);
      }
       
    
       startGUI.hide();
       loadCityGUI.hide();    
       
       //display birds
       if (showBirds){
         
        for (int i = 0; i < birdflock.length; i++){
          birdflock[i].display();
          birdflock[i].move();
         
         }
       }
       
       if (showStorm){
         
       //display storm
       storm.display();
       storm.move();
       
       
       }
       
       break;
      
    case LOADCITYGUI:
    
      //background(color(25,96,193));
      background(color(75,79,157));

      skyline.resize(840, 300);
      // Setting up background image
      pushMatrix();
      scale(1.2);
      image(skyline, 0, 200);
      popMatrix();
        
      stroke(0);
      fill(255);
      textFont(magneto);
      textSize(60);
      text("City Skyscraper", 240,90);
      textFont(castellar);
      textSize(15);
      text("Enter name of previously created skyline",300,140);
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
  
  cityNameInput = playScreenGUI.addTextfield("Enter the name of your city").setPosition(400, 250).setSize(200, 30).setAutoClear(false);
  cityNameInput.hide();
  saveCityButton = playScreenGUI.addButton("Save").setPosition(470, 300).setSize(60, 30);
  saveCityButton.hide();
  

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
                 
   // Button to go back to main menu              
   playScreenMenuButton = playScreenGUI.addButton("Main Menu")
     .setValue(10)
     .setPosition(820,30)
     .setSize(150,40)
     ;
     
   playScreenGUI.addButton("Save File")
     .setValue(10)
     .setPosition(820, 328)
     .setSize(150,40)
     ;
  
  
  
}


void createStartScreen(){
  startGUI = new ControlP5(this);
  //skyline = loadImage("skyline.png");
  skyline = loadImage("city.jpg");

  skyline.resize(840, 300);
  castellar = createFont("Castellar", 30);
  textFont(castellar);
  
   // Initializing buttons
  createNewCity = new Button(380,120,250,40,color(255),"Create New Skyline");
  loadExistingCity = new Button(380,180,250,40,color(255),"Load Existing Skyline");
  
  //background(color(52,56,129));
  background(color(219,181,181));
  
  pushMatrix();
  scale(1.2);
  image(skyline,0,200);
  popMatrix();
  
  stroke(0);
  fill(255);
  textSize(40);
  text("City Skyscraper", 320,200);
  
  // Displays buttons for user to select action
  createNewCity.display();
  loadExistingCity.display();
   
  
}

void createLoadScreen(){
  
  // NEED TO CHECK TEXTBOX FUNCTIONALITY - WHEN TYPING IN BOX FOR A SECOND TIME, GOES TO NEXT SCREEN
  loadCityGUI = new ControlP5(this);
  
  skyline.resize(840, 300);
  
  arial = createFont("Arial", 12);
  textFont(arial);
  
  
  loadCityGUI.addTextfield(" ")
   .setPosition(350,150)
   .setSize(300, 40)
   .setFont(arial)
   .setFocus(true)
   .setColor(color(255))
  ;
  
  loadCityGUI.addButton("Load")
    .setPosition(450, 200)
    .setSize(100, 35)
    ;
  

  /* are these necessary?
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
   */

  textFont(arial);
  
  // Button to go back to main menu              
   loadScreenMenuButton = loadCityGUI.addButton("Main Menu")
     .setValue(10)
     .setPosition(820,30)
     .setSize(150,40)
     ;
     
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
    } else {
      deletingBuilding = false;
      editingBuilding = false;
      placingBuilding = false;
    }
    
  }
  
  else if(theEvent.isFrom(soundrb)){
    
    // Toggles the button based on user selection
    if (mainSound == true) {
      mainSound = false;
    }
    
    else if (mainSound == false) {
      mainSound = true;
    }
    
    // If sound icon is "on", plays sound
    if (mainSound == true) {
      // Loading a sound file
      
      main.loop();
    }
    
    // If sound icon is "off", mutes the sound
    else if (mainSound == false) {
      main.stop();
    }
    
    
    println("Sound is being pressed");
 
  
  }
  
  else if (theEvent.isFrom(birdrb)){
    println("Bird is being pressed");
    
    birdSoundCount += 1;   
    
    showBirds = !showBirds; 
    for (int i = 0; i < birdflock.length; i++){
    
    birdflock[i].setPosition(int(random(0,100)),int(random(50,150)),int(random(0,80)));
  }

    
    // Plays sound when sound icon is "on"
    if (birdSoundCount % 2 != 0) {
      bird.loop();
      println("Birds turned on");
    }
    
    // Stops playing sound when sound icon is "off"
    else if (birdSoundCount % 2 == 0) {
      bird.stop();
      println("Birds turned off");
     
    }
    
    
  }
  
  
  
    else if (theEvent.isFrom(stormrb)){
    println("Storm is being pressed");
    
    rainSoundCount += 1; 
    
    showStorm = !showStorm;
    storm.setPosition();
    
    // Plays sound when sound icon is "on"
    if (rainSoundCount % 2 != 0) {
      println("Rain turned on");
      rain.loop();
    }
    
    // Stops playing sound when sound icon is "off"
    else if (rainSoundCount % 2 == 0) {
      println("Rain turned off");
      rain.stop();
    }
    
    
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
  if (placingBuilding && !savingCity) {
    if (mouseX < 800 - newBuilding.buildingWidth) {
      newBuilding.x = mouseX;
    }
    newBuilding.display();
  }
  for (int i = 0; i< allBuildings.size(); i++) {
    allBuildings.get(i).display(); 
  }
}

void saveFile() {
  
  cityNameInput.show();
  saveCityButton.show();
  savingCity = true;
  
}

void Save() {
  saveCityName = cityNameInput.getText();
  saveFile = new File(sketchPath(saveCityName + ".txt"));
  newSave = new SaveFile(saveCityName);
  newSave.outputSaveFile();
  println("city successfully saved");
  savingCity = false;
  cityNameInput.hide();
  saveCityButton.hide();
  
}

void Load() {
  
  loadCityName = loadCityGUI.get(Textfield.class, " ").getText();
  loadFile = new File(sketchPath(loadCityName + ".txt"));
  if (!loadFile.exists()) {
    println("That file does not exist!");
  } else {
  String [] buildingsLoaded = loadStrings(loadCityName + ".txt");
  
  allBuildings.clear();
  for (int i = 0; i < buildingsLoaded.length; i ++) {
    buildingData = buildingsLoaded[i].split(", ");
    allBuildings.add(new Building(int(buildingData[0]), int(buildingData[1]), int(buildingData[2])));
  }
  state = GameState.PLAYSCREENGUI;
  }  
}

void mainMenu() {
  println("menu() function called");
  state = GameState.STARTGUI;
  println (state);
  currentDeleteBuildingIndex = 0;
  currentEditBuildingIndex = 0;
  allBuildings.clear();
  savingCity = false;
  editingBuilding = false;
  deletingBuilding = false;
  placingBuilding = false;
  cityNameInput.hide();
  saveCityButton.hide();
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

  }
  
  if (keyPressed == true && (key == 'm' || key == 'M')) {
    println("Sound is muted");
    main.stop();
    bird.stop();
    rain.stop();
  }
  
 
  // Code for clicking to place buildings
  if (placingBuilding && !savingCity) {
    if (mouseX > 0 && mouseX < 800 - newBuilding.buildingWidth) {
      for (int i = 0; i< allBuildings.size(); i++) {
        if ((mouseX + newBuilding.buildingWidth > allBuildings.get(i).x - buildingPadding && mouseX + newBuilding.buildingWidth < allBuildings.get(i).x + allBuildings.get(i).buildingWidth + buildingPadding) || (mouseX> allBuildings.get(i).x - buildingPadding && mouseX < allBuildings.get(i).x + allBuildings.get(i).buildingWidth + buildingPadding)) {
          return;
        }
      }
      allBuildings.add(newBuilding);
      currentDeleteBuildingIndex = allBuildings.size() - 1;
      currentEditBuildingIndex = allBuildings.size() - 1;
      newBuilding = (new Building(650, currentBuildingIndex, 0));
    }

  // Code for clicking to select which building is being edited
  } else if (editingBuilding && !savingCity) {
    if (mouseX > 0 && mouseX < 800) {
      for (int i = 0; i< allBuildings.size(); i++) {
        if ((mouseX > allBuildings.get(i).x && mouseX < allBuildings.get(i).x + allBuildings.get(i).buildingWidth) == true) {
          currentEditBuildingIndex = i;
        }
      }
    }
  } else if (deletingBuilding && !savingCity) {
     if (mouseX > 0 && mouseX < 800) {
      for (int i = 0; i< allBuildings.size(); i++) {
        if ((mouseX > allBuildings.get(i).x && mouseX < allBuildings.get(i).x + allBuildings.get(i).buildingWidth) == true) {
          if (i == currentDeleteBuildingIndex) {
            allBuildings.remove(i);
            if (currentDeleteBuildingIndex > 0) {
              currentDeleteBuildingIndex = allBuildings.size() - 1;
              currentEditBuildingIndex = allBuildings.size() - 1;
            }
          } else {
            currentDeleteBuildingIndex = i;
          }
        }
      }
     }
  }
  
  // if "Save File" button is pressed
  if (mouseX > 830 && mouseX < 980 && mouseY > 328 && mouseY < 368 && state == GameState.PLAYSCREENGUI) {
    saveFile();
  }
  
  if ((state == GameState.PLAYSCREENGUI || state == GameState.LOADCITYGUI) && mouseX > 820 && mouseX < (820 + 150) && mouseY > 30 && mouseY < (30 + 40)) {
    mainMenu(); 
  }
  
}

void keyPressed() {
  if (key == CODED && editingBuilding) {
    if (keyCode == UP) {
      up();
    } else if (keyCode == LEFT) {
      left(); 
    } else if (keyCode == DOWN) {
      down(); 
    } else if (keyCode == RIGHT) {
      right(); 
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

/*
public void Menu (int theValue) {
  println("Go back to main menu");
  //state = GameState.STARTGUI;
  
}
*/
