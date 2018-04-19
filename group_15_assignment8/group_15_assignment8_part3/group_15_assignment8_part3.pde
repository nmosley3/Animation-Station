// Arraylist to hold all feeds
ArrayList<ArrayList<Headline>> allFeeds;
int currentFeedIdx;

// Array list for the headlines in each feed
ArrayList<Headline> allHeadlines;
ArrayList<Headline> allHeadlines2;
ArrayList<Headline> allHeadlines3;
ArrayList<Headline> allHeadlines4;
ArrayList<Headline> allHeadlines5;

// list of radio_buttons to pass into each button object
Radio_Button[] radioButtons = new Radio_Button[5];
ArrayList<Headline> currentFeed;

// variables to track selected button
int button_id;
Boolean button_checked;

// fonts
PFont headerFont;
PFont categoryFont;

// variable to track y position of text
int printYPosition;

int currentPage;
int headlinesOnLastPage;

String date, date1, date2, date3, date4;

PageNavigationButton Next, Previous;


void setup(){
  
  currentPage = 0;
  headlinesOnLastPage = 0;
  
  Previous = new PageNavigationButton(190, 18, 30, 70, 0);
  Next = new PageNavigationButton(900, 18, 30, 70, 1);

  
  size(1000, 500);
  background(255);
  
  allFeeds = new ArrayList<ArrayList<Headline>>();
  
  currentFeedIdx = 0;
  
  // create fonts for header and body
  headerFont = createFont("Impact", 32);
  categoryFont = createFont("Copperplate Gothic Bold", 18);
  
  
  // Load all the News Feeds
  //
  //
  // XML World News
  XML root = loadXML("https://www.cnbc.com/id/100727362/device/rss/rss.xml").getChild("channel");
  XML[] headlines = root.getChildren("item");
  allHeadlines = new ArrayList<Headline>();
  int numHeadline = 0;
  
  for (XML l: headlines) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    date = l.getChild("pubDate").getContent();
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
    date1 = l.getChild("pubDate").getContent();
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
    date2 = l.getChild("pubDate").getContent();
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
    date3 = l.getChild("pubDate").getContent();
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
    date4 = l.getChild("pubDate").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline5);
    allHeadlines5.add(newHeadline);
    numHeadline5 += 1;
  }   
  
  // Initialize buttons
  radioButtons[0] = new Radio_Button(85, 90 * (1) - 15, 15, color(0), color(255), radioButtons, 0, "World News", date);
  radioButtons[1] = new Radio_Button(85, 90 * (2) - 15, 15, color(0), color(255), radioButtons, 1, "US News", date1);
  radioButtons[2] = new Radio_Button(85, 90 * (3) - 15, 15, color(0), color(255), radioButtons, 2, "US Economy", date2);
  radioButtons[3] = new Radio_Button(85, 90 * (4) - 15, 15, color(0), color(255), radioButtons, 3, "Technology", date3);
  radioButtons[4] = new Radio_Button(85, 90 * (5) - 15, 15, color(0), color(255), radioButtons, 4, "Media", date4);
  
  
  // Add all feeds to the allFeeds list
  allFeeds.add(allHeadlines);
  allFeeds.add(allHeadlines2);
  allFeeds.add(allHeadlines3);
  allFeeds.add(allHeadlines4);
  allFeeds.add(allHeadlines5);
  
  radioButtons[0].isOver = true;
  
}

void draw(){
  background(230);
  
  printYPosition = 85;
  
  Next.display();
  Previous.display();
  
  // draw the blue rectangle on the left
  fill(color(169,192,233));
  rect (0, 0, 170, height);
  
  
  // draw radio buttons and their text
  for (int i = 0; i < radioButtons.length; i++) {
    radioButtons[i].display();
  }
  
  
  // draw the feed
  currentFeed = allFeeds.get(currentFeedIdx);
  for (int i = currentPage * 5; i < (currentPage + 1) * 5; i++) {
    currentFeed.get(i).display();
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
  text("CNBC " + currentButton.text + ", " + currentButton.date, 150 + 850 / 2 - textWidth(currentButton.text + "CNBC " + ", " + currentButton.date) / 2, 45);
  
}



void mousePressed(){
  
  if (mouseX > 190 && mouseX < 260 && mouseY > 18 && mouseY < 48) {
    Previous.changePage();
  } else if (mouseX > 900 && mouseX < 970 && mouseY > 18 && mouseY < 48){
    Next.changePage();
  }
    
    for (int i = 0; i < radioButtons.length; i++){
      if(radioButtons[i].isOver(mouseX, mouseY)){
          button_id = i;
          button_checked = true;
      } 
    }  
    
}
