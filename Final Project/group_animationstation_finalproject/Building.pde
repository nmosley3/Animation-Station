class Building {
  int x, buildingType, numBlocks;
  PImage base, top, block;
  int baseHeight, blockHeight, topHeight;
  int buildingWidth;
  int buildIndex;
  int modifier;
  int maxBlocks;
  int newPosition;
  Building currentBuilding;
  
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
      
    } else if (buildingType == 2) {
      baseHeight = 45 * modifier;
      blockHeight = 5 * modifier;
      topHeight = 11 * modifier;
      this.buildingWidth = 20 * modifier;
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
      if (i == currentEditBuildingIndex) {
        continue;
      }
      newPosition = this.x - 10;
      currentBuilding = allBuildings.get(i);
      if ((newPosition < currentBuilding.x + currentBuilding.buildingWidth + buildingPadding && newPosition > currentBuilding.x - buildingPadding) || (newPosition - buildingPadding < 0)) { 
        return;  
      }
    }
    this.x -= 10;
  }
  
  void moveRight() {
    for (int i = 0; i < allBuildings.size(); i++) {
      if (i == currentEditBuildingIndex) {
        continue;
      }
      newPosition = this.x + 10;
      currentBuilding = allBuildings.get(i);
      if ((newPosition + this.buildingWidth > currentBuilding.x - buildingPadding && newPosition + this.buildingWidth < currentBuilding.x + currentBuilding.buildingWidth + buildingPadding) || (newPosition + this.buildingWidth > 800)) {
        return;
      }
    }
    this.x += 10;
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
