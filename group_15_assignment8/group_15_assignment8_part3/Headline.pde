PFont bodyFont;

class Headline {
  String headline;
  String description;
  int numHeadline;
  String[] wordsInHeadline;
  String[] wordsInDescription;
  int printXPosition;
  int printYPositionDescription;
  String url;
  
  Headline (String headline, String description, int numHeadline, String url) {
    this.headline = headline;
    this.description = description;
    this.numHeadline = numHeadline;
    this.url = url;
    bodyFont = createFont("Gothic", 22);
    
    this.wordsInHeadline = split(headline, " ");
    this.wordsInDescription = split(description, " ");    
  
  }
  
  
  void display() {
    printXPosition = 210;
    printYPosition = 80 + (this.numHeadline % 5) * 60;
    textFont(bodyFont);
    fill(0);
    ellipse(printXPosition - 16, printYPosition - 6, 8, 8);
    for (int i = 0; i < wordsInHeadline.length; i++) {
      if (printXPosition + 20 + textWidth(wordsInHeadline[i]) > width) {
        printXPosition = 210;
        printYPosition += 25;
      }
      text(this.wordsInHeadline[i] + " ", printXPosition, printYPosition);
      printXPosition += textWidth(wordsInHeadline[i] + " ");
    }

  }
  
  void displayDescription() {
    
    printXPosition = 200;
    printYPositionDescription = 400;
    textFont(bodyFont);
    textSize(24);
    fill(0);
    for (int i = 0; i < wordsInDescription.length; i++) {
      if (printXPosition + 20 + textWidth(wordsInDescription[i]) > width) {
        printXPosition = 200;
        printYPositionDescription += 25;
      }
      text(this.wordsInDescription[i] + " ", printXPosition, printYPositionDescription);
      printXPosition += textWidth(wordsInDescription[i] + " ");
    }
    
  }
  
 }
