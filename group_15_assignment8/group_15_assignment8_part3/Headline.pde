PFont bodyFont;

class Headline {
  String headline;
  String description;
  int numHeadline;
  
  Headline (String headline, String description, int numHeadline) {
    this.headline = headline;
    this.description = description;
    this.numHeadline = numHeadline;
    bodyFont = createFont("Copperplate Gothic Light", 18);
  }
  
  void display() {
    textFont(bodyFont);
    fill(0);
    text(this.headline, 190, 80 + (60 * numHeadline));
    textFont(bodyFont);
    text(this.headline, 205, 80 + 20 + (60 * numHeadline));

  }
  
 }
