
ArrayList<ArrayList<Headline>> allFeeds;
int currentFeedIdx;

ArrayList<Headline> allHeadlines;
ArrayList<Headline> allHeadlines2;
ArrayList<Headline> allHeadlines3;
ArrayList<Headline> allHeadlines4;
ArrayList<Headline> allHeadlines5;

Radio_Button[] radioButtons = new Radio_Button[5];

ArrayList<Headline> currentFeed;

int button_id;
Boolean button_checked;

PFont headerFont;

void setup(){
  
  size(1000, 500);
  background(255);
  
  // Initialize buttons
  radioButtons[0] = new Radio_Button(85, 90 * (1) - 15, 15, color(0), color(255), radioButtons, 0, "World News");
  radioButtons[1] = new Radio_Button(85, 90 * (2) - 15, 15, color(0), color(255), radioButtons, 1, "US News");
  radioButtons[2] = new Radio_Button(85, 90 * (3) - 15, 15, color(0), color(255), radioButtons, 2, "US Economy");
  radioButtons[3] = new Radio_Button(85, 90 * (4) - 15, 15, color(0), color(255), radioButtons, 3, "Technology");
  radioButtons[4] = new Radio_Button(85, 90 * (5) - 15, 15, color(0), color(255), radioButtons, 4, "Media");
  
  allFeeds = new ArrayList<ArrayList<Headline>>();
  
  currentFeedIdx = 0;
  
  // create fonts for header and body
  headerFont = createFont("Copperplate Gothic Bold", 32);
  
  // XML World News
  XML root = loadXML("https://www.cnbc.com/id/100727362/device/rss/rss.xml").getChild("channel");
  XML[] headlines = root.getChildren("item");
  allHeadlines = new ArrayList<Headline>();
  int numHeadline = 0;
  
  for (XML l: headlines) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline);
    allHeadlines.add(newHeadline);
    numHeadline += 1;
  } 
  
 
  //XML US News
  XML root2 = loadXML("https://www.cnbc.com/id/15837362/device/rss/rss.html").getChild("channel");
  XML[] headlines2 = root2.getChildren("item");
  allHeadlines2 = new ArrayList<Headline>();
  int numHeadline2 = 0;
  
  for (XML l: headlines2) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline2);
    allHeadlines2.add(newHeadline);
    numHeadline2 += 1;
  } 
  
  //XML Economy
  XML root3 = loadXML("https://www.cnbc.com/id/20910258/device/rss/rss.html").getChild("channel");
  XML[] headlines3 = root3.getChildren("item");
  allHeadlines3 = new ArrayList<Headline>();
  int numHeadline3 = 0;
  
  for (XML l: headlines3) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline3);
    allHeadlines3.add(newHeadline);
    numHeadline3 += 1;
  } 
  
  //XML Technology
  XML root4 = loadXML("https://www.cnbc.com/id/19854910/device/rss/rss.html").getChild("channel");
  XML[] headlines4 = root4.getChildren("item");
  allHeadlines4 = new ArrayList<Headline>();
  int numHeadline4 = 0;
  
  for (XML l: headlines4) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline4);
    allHeadlines4.add(newHeadline);
    numHeadline4 += 1;
  } 
  
  //XML Media
  XML root5 = loadXML("https://www.cnbc.com/id/10000110/device/rss/rss.html").getChild("channel");
  XML[] headlines5 = root5.getChildren("item");
  allHeadlines5 = new ArrayList<Headline>();
  int numHeadline5 = 0;
  
  for (XML l: headlines5) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline5);
    allHeadlines5.add(newHeadline);
    numHeadline5 += 1;
  }   
  
  // Add all feeds to the allFeeds list
  allFeeds.add(allHeadlines);
  allFeeds.add(allHeadlines2);
  allFeeds.add(allHeadlines3);
  allFeeds.add(allHeadlines4);
  allFeeds.add(allHeadlines5);
  
  radioButtons[0].isOver = true;
  
}

void draw(){
  background(215);
  
  // draw the blue rectangle on the left
  fill(color(52,76,135));
  rect (0, 0, 170, height);
  
  
  // draw radio buttons and their text
  for (int i = 0; i < radioButtons.length; i++) {
    radioButtons[i].display();
  }
  
  
  // draw the feed
  currentFeed = allFeeds.get(currentFeedIdx);
  for (int i = 0; i < 5; i++) {
    //if (textWidth(currentFeed.get(i).headline) + 100 > width) {
      currentFeed.get(i).display();
    //}
  }
  
  // get the current radio button idx
  for (int i=0; i < radioButtons.length; i++) {
    if (radioButtons[i].isOver == true) {
      currentFeedIdx = i;
    }
  }
  
  // draw the title
  Radio_Button currentButton = radioButtons[currentFeedIdx];
  textFont(headerFont);
  strokeWeight(20);
  text(currentButton.text, 150 + 850 / 2 - textWidth(currentButton.text) / 2, 45);
  
}

void mousePressed(){
    
     
    for (int i = 0; i < radioButtons.length; i++){
      
      
      if(radioButtons[i].isOver(mouseX, mouseY)){
          button_id = i;
          button_checked = true;
      } 
    }  
}
