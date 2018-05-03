class SaveFile {
  String fileName;
  // ArrayList<Building> allBuildings;
  PrintWriter output;
  Building currentBuilding;
  String outputString;
  
 
  SaveFile(String fileName) {
    this.fileName = fileName;
  }
  
  void outputSaveFile () {
    output = createWriter(fileName + ".txt");
    // writes the data of each building to the file
    for (int i = 0; i < allBuildings.size(); i ++) {
      currentBuilding = allBuildings.get(i);
      outputString = str(currentBuilding.x) + ", " + str(currentBuilding.buildingType) + ", " + str(currentBuilding.numBlocks);
      output.println(outputString);
    }
    
    // writes the remaining data to the file and closes the file
    output.flush();
    output.close();
    
  }
  
  void loadSaveFile() {
    
    
  }
  
}
