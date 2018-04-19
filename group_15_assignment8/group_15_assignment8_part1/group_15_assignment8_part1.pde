// Line Graph
// Line Graph Reference: https://gist.github.com/kadamwhite/d407218cf2f8e44e979a
Table table;
Radio_Button[] start_buttons = new Radio_Button[6];
Radio_Button[] end_buttons = new Radio_Button[6];
int[] dates_choices = {1871, 1890, 1910, 1930, 1950, 1970};
// Values for button ID
int start_id = 0;
int end_id = 0;
int s;
int e;
IntList new_dates;
IntList d;
IntList new_flow;
int min;


// Values for booleans for buttons
boolean start_checked = false;
boolean end_checked = false;

void setup() {
  size(800,800);
  
  table = loadTable("Nile.csv", "header");
  println(table.getRowCount());
  for (TableRow r: table.rows()) {
    String time = r.getString("time");
    String value = r.getString("value");
    
  }
 
  
  int x = 600;
  int xy = 40;
  int yy = 40;
  // Creating button arrays
  for (int n=0; n < start_buttons.length; n++) {
    start_buttons[n] = new Radio_Button(x,xy,8,color(203,68,197), color(0), start_buttons,n);
    end_buttons[n] = new Radio_Button(x + 100,yy,8,color(203,68,197), color(0), end_buttons, n);
    xy += 25;
    yy += 25;
    
  }
  
 
}

void draw() {
  
  
  background(color(230,235,242));
  // Displays radio buttons
  label_buttons();
  
  // Displays graph if none of the radio buttons are selected
  if (start_checked == false && end_checked == false) {
    
    stroke(0);
    display_graph();
  }
  
  // If radio buttons are selected, then displays graph accordingly
  else if (start_checked == true && end_checked == true) {
    if(start_id >= end_id) {
      textSize(25);
      text("Start date must be less than end date!",300,300);
    }
    
    else {
      stroke(0);
      display_custom_graph();
    }
  }

}

void label_buttons() {
  textSize(15);
  text("Start Date", 600, 20);
  text("End Date", 700,20);
  for (int m = 0; m<start_buttons.length; m++) {
    start_buttons[m].display();
    end_buttons[m].display();
    fill(0);
    text(dates_choices[m], start_buttons[m].x + 40, start_buttons[m].y + 5);
    text(dates_choices[m], end_buttons[m].x + 40, end_buttons[m].y + 5);
  }
  
}

void display_graph() {
  
  // Creating an array of the dates for the x-axis
  int[] dates = new int[table.getRowCount()];
  
  for (int i = 0; i < table.getRowCount(); i++) {
    dates[i] = table.getInt(i, "time");
  }
  
  // Creating an array of the flow values for the y-axis
  int[] flow = new int[table.getRowCount()];
  for (int j = 0; j < table.getRowCount(); j++) {
    flow[j] = table.getInt(j, "value");
  }
  // Title of graph
   textSize(20);
   textAlign(CENTER);
   text("Nile River Flow Over Time",370,50);
   
  int space = 120;
  int minimum_Date = min(dates);
  int maximum_Date = max(dates);
  
  // Setting x-axis boundaries
  int min_x = 0 + space;
  int max_x = width - space;

  int minimum_Flow = min(flow);
  int maximum_Flow = max(flow);

  // Setting y-axis boundaries
  int min_y = height - space;
  int max_y = 0 + space;
 
  // Goes through the array and gets the dates and corresponding flow data
  for (int k = 1; k < dates.length; k++) {
 
      //int priorDate = table.getInt(k-1, "time");
   int priorDate = dates[k-1];
   //int newDate = table.getInt(k, "time");
   int newDate = dates[k];
   //int priorFlow = table.getInt(k-1, "value");
   int priorFlow = flow[k-1];
   //int newFlow = table.getInt(k, "value");
   int newFlow = flow[k];
   
   line(
   // Drawing the connecting lines between the datapoints
   // Changing the range of values from the original min and max to the boundaries of the screen
   map(priorDate, minimum_Date, maximum_Date, min_x, max_x),
   map(priorFlow, minimum_Flow, maximum_Flow, min_y, max_y),
   
   map(newDate, minimum_Date, maximum_Date, min_x, max_x),
   map(newFlow, minimum_Flow, maximum_Flow, min_y, max_y)
   );
   
   
   // Maps each point on the graph
   ellipse(map(priorDate, minimum_Date, maximum_Date, min_x, max_x),
   map(priorFlow, minimum_Flow, maximum_Flow, min_y, max_y),5,5);
   
   ellipse(map(newDate, minimum_Date, maximum_Date, min_x, max_x),
   map(newFlow, minimum_Flow, maximum_Flow, min_y, max_y),5,5);
   
   
   // Line for x-axis
   line(min_x,750,max_x,750);
   
   // Text label for x-axis
   textSize(15);
   text("Year", (max_x-min_x)/2 + 100,790);
   
    // Line for y-axis
   line(min_x,750,min_x,max_y);
   
   // Text label for y-axis
   pushMatrix();
   translate(width/2,height/2);
   rotate(radians(90));
   text("Flow of river (units)", min_x-100,350);
   popMatrix();
   
     
    
}

 // Draws a marker for dates (X-Axis)
 int f = 120;
 for (int x=minimum_Date; x <= maximum_Date; x+=5) {
     
     stroke(0);
     ellipse(f,750,2,2);
     String value = str(x);
     textSize(10);
     text(value,f,770);
     f += 28;
     
     
   }
   

    // Draws a marker for flows (Y-Axis)
   int g = 680; 
   for (int y = minimum_Flow; y <= maximum_Flow; y+=45.7) {
     stroke(0);
     ellipse(120,g,2,2);
     String value = str(y);
     text(value,100,g);
     g -= 28;
     
   }
   ellipse(120,750,2,2);
   text("0",100,750);
   ellipse(120,715,2,2);
   text("228",100,715);
   


}
  

  
void display_custom_graph() {
  
  // Creating an array of the dates for the x-axis
  int[] user_dates = new int[table.getRowCount()];
  
  for (int i = 0; i < table.getRowCount(); i++) {
    user_dates[i] = table.getInt(i, "time");
  }

  
  // Only holding onto dates that are within user-specified range
  ArrayList<Integer> update = new ArrayList<Integer>();  
  
  for (int m=0; m < user_dates.length-1; m++) {
    //for (int k=0; k<= update.length-1; k++) {
      if (user_dates[m] >= s &&  user_dates[m] <= e) {
        update.add(user_dates[m]);
      }
     
    }
    
  // Creating an array of the flows for the x-axis
  int[] user_flows = new int[table.getRowCount()];
  
  for (int i = 0; i < table.getRowCount(); i++) {
    user_flows[i] = table.getInt(i, "value");
  }

  
  // Only holding onto flows that are within user-specified range
  ArrayList<Integer> update_flows = new ArrayList<Integer>();  
  
  for (int m=0; m < user_flows.length-1; m++) {
    //for (int k=0; k<= update.length-1; k++) {
      if (user_dates[m] >= s &&  user_dates[m] <= e) {
        update_flows.add(user_flows[m]);
      }
     
  }
  
  //println(update_flows);
  //println(update);
  
  // Creating the line graph based on user inputs
   // Title of graph
   textSize(20);
   textAlign(CENTER);
   text("Nile River Flow Over Time",370,50);
   
  int space = 120;
  int minimum_Date = min(user_dates);

  int maximum_Date = max(user_dates);
  
  // Setting x-axis boundaries
  int min_x = 0 + space;
  int max_x = width - space;

  int minimum_Flow = min(user_flows);
  int maximum_Flow = max(user_flows);

  // Setting y-axis boundaries
  int min_y = height - space;
  int max_y = 0 + space;
 
  // Goes through the array and gets the dates and corresponding flow data
  for (int k = 1; k < update.size(); k++) {
 
      //int priorDate = table.getInt(k-1, "time");
   int priorDate = update.get(k-1);
   //int newDate = table.getInt(k, "time");
   int newDate = update.get(k);
   //int priorFlow = table.getInt(k-1, "value");
   int priorFlow = update_flows.get(k-1);
   //int newFlow = table.getInt(k, "value");
   int newFlow = update_flows.get(k);
   
   line(
   // Drawing the connecting lines between the datapoints
   // Changing the range of values from the original min and max to the boundaries of the screen
   map(priorDate, minimum_Date, maximum_Date, min_x, max_x),
   map(priorFlow, minimum_Flow, maximum_Flow, min_y, max_y),
   
   map(newDate, minimum_Date, maximum_Date, min_x, max_x),
   map(newFlow, minimum_Flow, maximum_Flow, min_y, max_y)
   );
   
   // Maps each point on the graph
   ellipse(map(priorDate, minimum_Date, maximum_Date, min_x, max_x),
   map(priorFlow, minimum_Flow, maximum_Flow, min_y, max_y),5,5);
   
   ellipse(map(newDate, minimum_Date, maximum_Date, min_x, max_x),
   map(newFlow, minimum_Flow, maximum_Flow, min_y, max_y),5,5);
   
   
   // Line for x-axis
   line(min_x,750,max_x,750);
   
   // Text label for x-axis
   textSize(15);
   text("Year", (max_x-min_x)/2 + 100,790);
   
    // Line for y-axis
   line(min_x,750,min_x,max_y);
   
   // Text label for y-axis
   pushMatrix();
   translate(width/2,height/2);
   rotate(radians(90));
   text("Flow of river (units)", min_x-100,350);
   popMatrix();
   
  
}

  // Draws a marker for dates (X-Axis)
   int f = 120;
   for (int x=minimum_Date; x <= maximum_Date; x+=5) {
     
     stroke(0);
     ellipse(f,750,2,2);
     String value = str(x);
     textSize(10);
     text(value,f,770);
     f += 28;
     
     
   }

     // Draws a marker for flows (Y-Axis)
   int g = 680; 
   for (int y = minimum_Flow; y <= maximum_Flow; y+=45.7) {
     stroke(0);
     ellipse(120,g,2,2);
     String value = str(y);
     text(value,100,g);
     g -= 28;
     
   }
   ellipse(120,750,2,2);
   text("0",100,750);
   ellipse(120,715,2,2);
   text("228",100,715);
   


  }
   
  

    

void mousePressed() {
  // For radio buttons
  
  for (int l=0; l<start_buttons.length; l++) {
    if(start_buttons[l].isOver(mouseX,mouseY)) {
      start_id = l;
      if(start_id == 0) {
        s = 1871;
      }
      
      else if(start_id == 1) {
        s = 1890;
      }
      
      else if(start_id == 2) {
        s = 1910;
      }
      
      else if(start_id == 3) {
        s = 1930;
      }
      
      else if(start_id == 4) {
        s = 1950;
      }
      
      else if(start_id == 5) {
        s = 1970;
      }
        
      print(s);
      start_checked = true;
    }
    
    if(end_buttons[l].isOver(mouseX,mouseY)) {
      end_id = l;
       if(end_id == 0) {
        e = 1871;
      }
      
      else if(end_id == 1) {
        e = 1890;
      }
      
      else if(end_id == 2) {
        e = 1910;
      }
      
      else if(end_id == 3) {
        e = 1930;
      }
      
      else if(end_id == 4) {
        e = 1950;
      }
      
      else if(end_id == 5) {
        e = 1970;
      }
        
      print(e);
      end_checked = true;
    }
  }
    
}
    
    
    
  

     
   
   
   
  
  