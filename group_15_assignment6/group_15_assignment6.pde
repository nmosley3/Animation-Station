Trapeze t1,t2,t3; 
PImage person;

void setup(){
  
  size(600,600);
  t1 = new Trapeze(40,60,100,84.8);
  t2 = new Trapeze(60,40,100,56.52);
  t3 = new Trapeze(80,20,100,28.26);
  person = loadImage("Trapeze Person.jpg");
  person.resize(40,80);
}

void draw(){
  
  background(255);
  //t1.move(0,60);
  //t2.move(t1.ending_x,t1.ending_y);
  t1.display(t2.current_x,t2.current_y);
  
  t2.display(t3.current_x,t3.current_y);
  //t3.move(t2.ending_x,t2.ending_y);
  t3.display(100,0);
  stroke(90,69,69);
  strokeWeight(3);
  line(t1.current_x-20,t1.current_y,t1.current_x+20,t1.current_y);
  image(person,t1.current_x-20,t1.current_y+3);
  
  //t1.display(t2.current_x,t2.current_y);
  //t2.display(t3.current_x,t3.current_y);
  //t3.display(60,0);
  
  t1.applyForce();
  t2.applyForce();
  t3.applyForce();
  
  
  
}