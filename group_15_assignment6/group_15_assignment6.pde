Trapeze t1,t2,t3; 

void setup(){
  
  size(600,600);
  t1 = new Trapeze(0,60,60,84.8);
  t2 = new Trapeze(20,40,60,56.52);
  t3 = new Trapeze(40,20,60,28.26);
}

void draw(){
  
  background(150,150,150);
  t1.display(t2.current_x,t2.current_y);
  t2.display(t3.current_x,t3.current_y);
  t3.display(60,0);
  
  t1.applyForce();
  t2.applyForce();
  t3.applyForce();
  
  
  
}