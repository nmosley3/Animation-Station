// Assigning value for gravity force
float g = 0.06;
// Assigning value for acceleration
float a = 0.02;

class CannonBall {
  // Attributes: color, x and y coorinates, velocity force for x, velocity force for y
  color c;
  float x;
  float y;
  float vx;
  float vy;
  
  // Constructor
  CannonBall(color C, float X, float Y, float VX, float VY) {
    this.c = C;
    this.x = X;
    this.y = Y;
    this.vx = VX;
    this.vy = VY;
  }
   
  // Creating the cannonball and displaying it
  void display() {   
    stroke(0);
    fill(this.c);
    ellipse(this.x,this.y,30,30);

  }
  
  // Cannonball launches from cannon and moves through ring of fire
  void launch_cannon() { 
    //CannonBall c2;
    // Applying velocity
    this.x += this.vx;
    this.y -= this.vy;
    // Applying acceleration
    this.vy -= a;
    // Applying gravity
    this.vy -= g;
    
    // Once the cannonball goes through the ring of fire, changes color
    if (this.x >= 500) {
      this.c = color(random(0,255),int(random(0,255)),int(random(0,255)));
      //c2 = new CannonBall(color(56,240,223),125,490,4,4);      
      //c2.display();
    
    }
    
  }   
  
}

  
    