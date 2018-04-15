Table possumData;  
float[] sex, ages, headlength, skulllength, totlength, tail, ftlength, chest, belly;
String[] features = {"Head Length (mm)", "Skull Width (mm)","Total Length (cm)","Tail Length (cm)", "Foot Length (mm) "};

float [][] x_y_arrays = {headlength, skulllength, totlength, tail, ftlength};

//made this change, need to make sure this is still OK
int x_axis_id = 0;
int y_axis_id = 0;

boolean x_checked = false;
boolean y_checked = false; 

float x_axis_max = 70; 
float y_axis_max = 60;
float x_axis_min = 0;
float y_axis_min = 0; 

Radio_Button[] x_axis_buttons = new Radio_Button[5];
Radio_Button[] y_axis_buttons = new Radio_Button[5]; 
DataPoint[] datapts; 

PFont courier;

void setup(){
  
  size(850,600);
  background(255);
  
  //load data
  possumData = loadTable("possum.csv", "header");
  int num_row = possumData.getRowCount();
  
  //initialize the array of datapoints
  datapts = new DataPoint[num_row];
  
  // create the correct data arrays
  sex = new float[num_row];
  ages = new float[num_row];
  x_y_arrays[0] = new float[num_row];
  x_y_arrays[1] = new float[num_row];
  x_y_arrays[2] = new float[num_row];
  x_y_arrays[3] = new float[num_row];
  x_y_arrays[4] = new float[num_row];

  
  int x = 650;
  int xy = 40;
  int yy = 320;
  //create button arrays 
  for (int i = 0; i<x_axis_buttons.length; i++){
    x_axis_buttons[i] = new Radio_Button(x,xy,10,color(0), color(255),x_axis_buttons,i);
    y_axis_buttons[i] = new Radio_Button(x, yy,10,color(0), color(255),y_axis_buttons,i);
  
    xy += 25;
    yy += 25;
    
  }
  
  int row_count = 0;
  
  //create the correct size array 
  for (TableRow row : possumData.rows()){
    
    sex[row_count] = row.getFloat("sex");
    ages[row_count] = row.getFloat("age");
    x_y_arrays[0][row_count] = row.getFloat("hdlngth (mm)");
    x_y_arrays[1][row_count] = row.getFloat("skullw (mm)");
    x_y_arrays[2][row_count] = row.getFloat("totlngth (cm)");
    x_y_arrays[3][row_count] = row.getFloat("tail (cm)");
    x_y_arrays[4][row_count] = row.getFloat("footlgth (mm) ");

    
    
    row_count += 1;
     
  }
  
  
  
}

void draw(){
  
  background(255);
  
  graph_display(features[x_axis_id], features[y_axis_id],x_axis_max,y_axis_max,x_axis_min,y_axis_min);
  
  label_buttons();
  
  
  
  if (x_checked && y_checked){
    
    background(255);

     x_axis_max = getMax(x_y_arrays[x_axis_id]);
     y_axis_max = getMax(x_y_arrays[y_axis_id]);
     x_axis_min = getMin(x_y_arrays[x_axis_id]);
     y_axis_min = getMin(x_y_arrays[y_axis_id]);
     //println(x_axis_max);
     //println(y_axis_max);
     
     graph_display(features[x_axis_id], features[y_axis_id],x_axis_max,y_axis_max,x_axis_min,y_axis_min);
     label_buttons();
    
   //go through each item in each list and create the desired data points and display them 
  for (int i = 0; i <datapts.length; i++){

  //   //need to include the x value, the y value, the age and gender
    datapts[i] = new DataPoint(x_y_arrays[x_axis_id][i],x_y_arrays[y_axis_id][i],ages[i],sex[i], datapts, x_axis_max, y_axis_max, x_axis_min, y_axis_min);
    datapts[i].display();
  //   //create each data point and then display each datapoint 
  //  //for (DataPoint d : datapts){
    
  //  //  d.display();
  //  //}
  //}
  
  }
  
  
}

}

void label_buttons(){
  
  textFont(createFont("Courier", 20));
  text("X-Axis", 650,20);
  text("Y-Axis",650,300);
  
  
  textFont(createFont("Courier", 15));
  for (int i = 0; i<x_axis_buttons.length; i++) {
    x_axis_buttons[i].display();
    y_axis_buttons[i].display();
    fill(0);
    text(features[i],x_axis_buttons[i].x + 20,x_axis_buttons[i].y);
    text(features[i],y_axis_buttons[i].x + 20,y_axis_buttons[i].y);
  }
  

}
void graph_display( String x_axis, String y_axis, float x_max, float y_max, float x_min, float y_min){
  
  //in the button class, must figure these things out, can have a max function but need to pass 
  //back the correct values...
  
  fill(0);
  stroke(3);
  //x-line
  line(60,550,600,550);
  //y-line
  line(60,550,60,50);
  
  textFont(createFont("Courier", 20));
  text("Comparing Possum Measurements", 190, 40);
  text(x_axis, 320, 590);
  
  pushMatrix();
  translate(10,270);
  rotate(HALF_PI);
  translate(-10,-270);
  text(y_axis, 10,270);
  popMatrix();


  label_x(x_max,x_min);
  label_y(y_max,y_min);
  
  
}
  
void label_x(float x_max, float x_min){
  
    //labeling the x_axis
  float x = 0;
  //find the incremental increase in steps 
  float value_inc = (x_max - x_min) / 15;
  float line_inc = 540/15;
  float val_to_print = x_min;
  String output;
  
  textFont(createFont("Courier", 10));
  for (int i = 0; i<15;i++){
    
    
    
    line(x + 60,545,x + 60,555);
    output = String.format("%.2f", val_to_print);
    //output = String.valueOf(val_to_print);
    text(output, x + 45, 570); 
    x += line_inc;
    val_to_print += value_inc;
    
  }

} 
  void label_y(float y_max, float y_min){
  
  //labeling the x_axis
  float y = 600;
  //find the incremental increase in steps 
  float value_inc = (y_max - y_min) / 15;
  float line_inc = 500/15;
  float val_to_print = y_min;
  String output;
  
  textFont(createFont("Courier", 10));
  
  for (int i = 0; i<15;i++){
    
    
    
    line(55,y - 50,65,y - 50);
    output = String.format("%.2f", val_to_print);
    //output = String.valueOf(val_to_print);
    text(output, 25, y-45); 
    y -= line_inc;
    val_to_print += value_inc;
    
  }
  }

  void mousePressed(){
    
     
    for (int i = 0; i <x_axis_buttons.length; i++){
      
      
      if(x_axis_buttons[i].isOver(mouseX, mouseY)){
          x_axis_id = i;
          x_checked = true;
      }
      if(y_axis_buttons[i].isOver(mouseX, mouseY)){
        
          y_axis_id = i;
          y_checked = true;
      } 
    }
    
     
   }
   
  

  
  float getMax(float[] array){
    
    float max = 0; 
    
    for (int i = 0; i<array.length; i++){
      if (array[i] > max){
        max = array[i];
      }
    }
    
    return max; 
  }
  
    float getMin(float[] array){
    
    float min = 900; 
    
    for (int i = 0; i<array.length; i++){
      if (array[i] < min){
        min = array[i];
      }
    }
    
    return min; 
  }