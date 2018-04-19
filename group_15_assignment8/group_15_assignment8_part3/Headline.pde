PFont bodyFont;

class Headline {
  String headline;
  String description;
  int numHeadline;
  String[] wordsInHeadline;
  int printXPosition;
  Headline[] headlines;
  
  Headline (String headline, String description, int numHeadline, Headline[] headlines) {
    this.headline = headline;
    this.description = description;
    this.numHeadline = numHeadline;
    bodyFont = createFont("Gothic", 22);
    
    this.wordsInHeadline = split(headline, " ");
    
    this.headlines = headlines;
  
  }
  
   boolean isOver(int mousex, int mousey){
    
    if (dist(mousex,mousey,x,y) < outerRadius) {
      
      for (int i = 0; i < radiobuttons.length; i++){
        if (i == id){
          radiobuttons[i].isOver = true;
          
          //call here to draw the correct data points 
          //would this be done in an OK order??
          
          
        }
        else{
          radiobuttons[i].isOver = false; 
        }
        
        
      }
      return true;
      
    } 
    else{
      return false;
    }
    
  }
  
  void display() {
    printXPosition = 210;
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
    
    printYPosition += 40;

  }
  
 }
