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
int currentHeadlineIdx;
Headline currentHeadline;

String date, date1, date2, date3, date4;

PageNavigationButton Next, Previous;


void setup(){
  
  currentPage = 0;
  currentHeadlineIdx = 0;
  
  Previous = new PageNavigationButton(190, 18, 30, 70, 0);
  Next = new PageNavigationButton(910, 18, 30, 70, 1);

  
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
  date = root.getChild("pubDate").getContent();
  XML[] headlines = root.getChildren("item");
  allHeadlines = new ArrayList<Headline>();
  int numHeadline = 0;
  
  for (XML l: headlines) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    String url = l.getChild("link").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline, url);
    allHeadlines.add(newHeadline);
    numHeadline += 1;
  } 
  
 
  //XML US News
  XML root2 = loadXML("https://www.cnbc.com/id/15837362/device/rss/rss.html").getChild("channel");
  date1 = root2.getChild("pubDate").getContent();
  XML[] headlines2 = root2.getChildren("item");
  allHeadlines2 = new ArrayList<Headline>();
  int numHeadline2 = 0;
  
  for (XML l: headlines2) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    String url = l.getChild("link").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline2, url);
    allHeadlines2.add(newHeadline);
    numHeadline2 += 1;
  } 
  
  //XML Economy
  XML root3 = loadXML("https://www.cnbc.com/id/20910258/device/rss/rss.html").getChild("channel");
  date2 = root3.getChild("pubDate").getContent();
  XML[] headlines3 = root3.getChildren("item");
  allHeadlines3 = new ArrayList<Headline>();
  int numHeadline3 = 0;
  
  for (XML l: headlines3) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    String url = l.getChild("link").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline3, url);
    allHeadlines3.add(newHeadline);
    numHeadline3 += 1;
  } 
  
  //XML Technology
  XML root4 = loadXML("https://www.cnbc.com/id/19854910/device/rss/rss.html").getChild("channel");
  date3 = root4.getChild("pubDate").getContent();
  XML[] headlines4 = root4.getChildren("item");
  allHeadlines4 = new ArrayList<Headline>();
  int numHeadline4 = 0;
  
  for (XML l: headlines4) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    String url = l.getChild("link").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline4, url);
    allHeadlines4.add(newHeadline);
    numHeadline4 += 1;
  } 
  
  //XML Media
  XML root5 = loadXML("https://www.cnbc.com/id/10000110/device/rss/rss.html").getChild("channel");
  date4 = root5.getChild("pubDate").getContent();
  XML[] headlines5 = root5.getChildren("item");
  allHeadlines5 = new ArrayList<Headline>();
  int numHeadline5 = 0;
  
  for (XML l: headlines5) {
    String headline = l.getChild("title").getContent();
    String description = l.getChild("description").getContent();
    String url = l.getChild("link").getContent();
    Headline newHeadline = new Headline(headline, description, numHeadline5, url);
    allHeadlines5.add(newHeadline);
    numHeadline5 += 1;
  }   
  
  // Initialize buttons
  radioButtons[0] = new Radio_Button(85, 90 * (1) - 15, 15, color(0), color(255), radioButtons, 0, "World News", date, color(#000099));
  radioButtons[1] = new Radio_Button(85, 90 * (2) - 15, 15, color(0), color(255), radioButtons, 1, "US News", date1, color(#cc0000));
  radioButtons[2] = new Radio_Button(85, 90 * (3) - 15, 15, color(0), color(255), radioButtons, 2, "US Economy", date2, color(#ffcc00));
  radioButtons[3] = new Radio_Button(85, 90 * (4) - 15, 15, color(0), color(255), radioButtons, 3, "Technology", date3, color(#009900));
  radioButtons[4] = new Radio_Button(85, 90 * (5) - 15, 15, color(0), color(255), radioButtons, 4, "Media", date4, color(#9900cc));
  
  
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
  
  // draw the blue rectangle on the left
  fill(color(169,192,233));
  rect (0, 0, 170, height);
  
  fill(color(255));
  rect (170, 356, 830, 132);
  
  fill(0);
  rect (185, 54, width - 20 - 180, 3);
  rect (185, 355, width - 20 - 180, 3);
  
  
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
  text(" CNBC " + currentButton.text + ", " + currentButton.date, 150 + 850 / 2 - textWidth(currentButton.text + "CNBC " + ", " + currentButton.date) / 2, 45);
  
  checkForMousePosition();
  displayDescription();
  
  Next.display();
  Previous.display();
  
}



void mousePressed(){
  
  if (mouseX > 190 && mouseX < 260 && mouseY > 18 && mouseY < 48) {
    Previous.changePage();
    return;
  } else if (mouseX > 900 && mouseX < 970 && mouseY > 18 && mouseY < 48){
    Next.changePage();
    return;
  }
  
  if (mouseX > 190 && mouseY < 360 && mouseY > 60) {
    link(currentHeadline.url);
  }
  
    
    for (int i = 0; i < radioButtons.length; i++){
      if(radioButtons[i].isOver(mouseX, mouseY)){
          button_id = i;
          button_checked = true;
      } 
    }  
    
}

void checkForMousePosition() {
  if (mouseX > 190 && mouseY < 360 && mouseY > 80) {
    currentHeadlineIdx = floor((mouseY - 60) / 60); 
  }
}

void displayDescription() {
  currentHeadline = currentFeed.get((currentPage * 5) + currentHeadlineIdx);
  currentHeadline.displayDescription();
}
