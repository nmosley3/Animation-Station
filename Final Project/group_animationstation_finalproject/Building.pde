class Building {
  int x, buildingType, numBlocks;
  PImage base, top, block;
  int baseHeight, blockHeight, topHeight;
  int buildingWidth;
  int buildIndex;
  int modifier;
  int maxBlocks;
  
  Building (int x, int buildingType, int numBlocks) {
    this.x = x;
    this.buildingType = buildingType;
    this.numBlocks = numBlocks;
    this.modifier = 3;
    this.maxBlocks = 15;
    
    base = loadImage("building" + str(buildingType) + "Base.png");
    base.resize(100 * modifier, 100 * modifier);
    top = loadImage("building" + str(buildingType) + "Top.png");
    top.resize(100 * modifier, 100 * modifier);
    block = loadImage("building" + str(buildingType) + "Block.png");
    block.resize(100 * modifier, 100 * modifier);

    
    if (buildingType == 1) {
      baseHeight = 52 * modifier;
      blockHeight = 5 * modifier;
      topHeight = 19 * modifier;
      this.buildingWidth = 34 * modifier;
    }

  }
  
  
  void addBlock () {
    if (this.numBlocks < this.maxBlocks) {
      this.numBlocks += 1;
    }
    
  }
  
  void subtractBlock() {
    if (this.numBlocks > 0) {
      this.numBlocks -= 1;
    }
  }
  
  void moveLeft() {
    for (int i = 0; i < allBuildings.size(); i++) {
      if ((this.x > allBuildings.get(i).x - buildingPadding && this.x < allBuildings.get(i).x + allBuildings.get(i).buildingWidth + buildingPadding) == false) { 
        return;  
      }
    }
    this.x -= 10;
  }
  
  void moveRight() {
    for (int i = 0; i < allBuildings.size(); i++) {
      if ((this.x > allBuildings.get(i).x - buildingPadding && this.x < allBuildings.get(i).x + allBuildings.get(i).buildingWidth + buildingPadding) == false) { 
        return;  
      }
    }
    this.x += 5;
  }
  
  
  void display () {
    buildIndex = 530 - baseHeight;
    image(this.base, x, buildIndex);
    for (int i = 0; i < numBlocks; i++) {
      buildIndex -= blockHeight;
      image(this.block, x, buildIndex);
    }
    buildIndex -= topHeight;
    image(this.top, x, buildIndex);
    }
    
  
  
  
}
