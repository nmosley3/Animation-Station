PFont bodyFont;

class Headline {
  String headline;
  String description;
  int numHeadline;
  String[] wordsInHeadline;
  int printXPosition;
  
  Headline (String headline, String description, int numHeadline) {
    this.headline = headline;
    this.description = description;
    this.numHeadline = numHeadline;
    bodyFont = createFont("Gothic", 22);
    
    this.wordsInHeadline = split(headline, " ");
    
  
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
  
 }
