
class PageNavigationButton {
  int x, y, w, h, directionId;
  
  
  PageNavigationButton(int x, int y, int h, int w, int directionId) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.directionId = directionId;
  }
  
  void display() {
    fill(0);
    rect(x, y, w, h);
    fill(color(169,192,233));
    rect(x + 2, y + 2, w - 4, h - 4);
    if (directionId == 0) {
      fill(0);
      text("<", x - 9 + w / 2, y + 9 + h/ 2); 
    } else if (directionId == 1) {
      fill(0);
      text(">", x - 9 + w / 2, y + 9 + h/ 2); 
    }
    
  }
  
  void changePage () {
    if (directionId == 0 && currentPage > 0) {
      currentPage -= 1;
      currentHeadlineIdx = 0;
    } else if (directionId == 1 && currentPage < 5){
      currentPage += 1;
      currentHeadlineIdx = 0;
    
  }
  
  
  
  
  
  
  
}

}
