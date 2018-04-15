class DataPoint{
  
  color sex; 
  float age; 
  //float x_value;
  //float y_value; 
  float x_display;
  float y_display; 
  DataPoint[] datapts; 
  float radius;
  float x_max, y_max;
  
  float x_range = 540;
  float y_range = 500;
  
  float max_radius = 20; 
  float max_age = 9;
  
  DataPoint(float x_value, float y_value, float age, float sex_num, DataPoint[] datapts, float x_max, float y_max, float x_min, float y_min){
     if (sex_num == 1){
       this.sex = color(240,75,229);
     }
     else{
       this.sex = color(48,100,209);
     }
     
     //this.x_max = x_max;
     //this.y_max = y_max; 
     
     
     //float x_percentage = x_value/x_max;
     //float y_percentage = y_value/y_max; 
     
     this.x_display = ((x_value-x_min)/(x_max-x_min))*x_range + 60; 
   
     this.y_display = y_range-(((y_value-y_min)/(y_max-y_min))*y_range)+50;

     this.radius = (age/max_age)*max_radius;
     
     this.datapts = datapts;
  }
  
  void display(){
    
    noStroke();
    fill(sex);
    ellipse(x_display,y_display,radius*2,radius*2);
  }
  

}