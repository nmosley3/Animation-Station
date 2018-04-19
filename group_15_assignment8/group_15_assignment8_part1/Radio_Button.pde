// Class reference - Maddie Pellman (group_15_assignment8_part2)
class Radio_Button{
  
  float x,y;
  int outerRadius, innerRadius;
  color outerColor, innerColor; 
  int id; 
  
  Radio_Button[] radiobuttons; 
  boolean isOver = false; 
  
  Radio_Button(float x, float y, int or, color oc, color ic, Radio_Button[] rg, int id){
    
    this.x = x;
    this.y = y;
    this.outerRadius = or;
    this.innerRadius = or/2; 
    this.outerColor = oc;
    this.innerColor = ic; 
    this.id = id; 
    
    //why do I need to pass this in?? 
    //how do they become a part of this list? 
    this.radiobuttons = rg;
    
  }
  
  
  //makesure we pass in the correct id
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
  
  
  void display(){
    noStroke();
    fill(outerColor);
    ellipse(x,y,outerRadius*2,outerRadius*2);
    
    if(isOver){
      fill(innerColor);
      ellipse(x,y,innerRadius*2,innerRadius*2);
    }

  } 
  
  
}