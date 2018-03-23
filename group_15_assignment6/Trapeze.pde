class Trapeze{
  
  //float space = 5;
  float current_x, current_y;
  float ending_x, ending_y;
  float resting_x, resting_y;
  
  //float len_rope;
  //float resting_x, resting_y;
  float vx, vy; //x and y axis velocities
  float ks = 0.005; //spring stiffness
  float kd = 0.02; // damping force
  float m = 1.0;
  //float accel = 0.03;
  
  
  Trapeze(float starting_x, float starting_y, float resting_x, float resting_y){
    
    this.current_x = starting_x;
    this.current_y = starting_y;
    this.resting_x = resting_x;
    this.resting_y = resting_y;
    //this.ending_x = ending_x;
    //this.ending_y = ending_y;
    //Here just set current position to resting x and resting y
    //because at the beginning we don't want any forces applied!!!
    
  }
  
  void move(float newx, float newy) {
    
    current_x = newx;
    current_y = newy;
  }
  
  void applyForce(){
    
    float forceX = -((ks * (current_x - resting_x)) + kd*vx);
    float ax = forceX/m;
    vx = vx + ax;
    current_x += vx;
    //ending_x = ((ending_x - starting_x) + ending_x + vx); 
    
    float forceY = -((ks * (current_y - resting_y)) + kd*vy);
    float ay = forceY/m;
    vy = vy + ay;
    current_y += vy;
    //ending_y = ((ending_y - starting_y) + ending_y + vy); 
  }
  
  void display(float x, float y){
    stroke(90,69,69);
    strokeWeight(3);
    line(current_x, current_y, x, y);
    
  }
  
  
}