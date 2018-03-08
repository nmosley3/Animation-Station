class Balloon{
  
  float x;
  float y; 
  float z; 
  float radius;
  float triangle_height;
  color c;
  float string_rotate;
  int direction;
  
  PShape balloon, sphere, cone, string;
  
  
  //constructor
  Balloon(float x, float y, float z, float radius, float triangle_height, color c){
    
    this.x = x;
    this.y = y;
    this.z = z;
    this.radius = radius;
    this.triangle_height = triangle_height;
    this.c = c;
    this.string_rotate = 0;
    this.direction = 1;
 
   balloon = createShape(GROUP);
   //pushMatrix();
   
   sphere = createShape(SPHERE,radius);
   pushMatrix();
   //sphere.translate(x,y,z);
   
   sphere.setFill(c);
   sphere.setStroke(c);
   popMatrix();
   //popMatrix();
   
   
   
   string = createShape();
   string.beginShape();
   //string.vertex(x,y+radius,z);
   //string.bezierVertex(x+(radius/1.6), y+(radius*1.8),z,x+(radius/2.2),y+(radius*1.5),z,x,y+(radius*2.5),z);
   //string.bezierVertex(x-(radius*.5),y+(radius*2.8),z,x-radius,y+(radius*3.2),z,x,y+(radius*4.2),z);
   string.vertex(0,radius,0);
   string.bezierVertex((radius/1.6), (radius*1.8),0,(radius/2.2),(radius*1.5), 0, 0 , (radius*2.5), 0);
   string.bezierVertex((radius*.5),(radius*2.8), 0, radius, (radius*3.2), 0, 0, (radius*4.2), 0);
   string.noFill();
   string.endShape();
   
   //add everything to the group
   balloon.addChild(sphere);

   balloon.addChild(string);

   
  }
  
   void display() {
   
   pushMatrix();
   //translate(x,y,z);
   //shape(sphere);
   //translate(x-radius,y-radius,0);
   shape(balloon);
   //translate(-x,-y,-z);
   popMatrix();
   
  }
  
  void move(float inc_x, float inc_y, float inc_z){
    
    if(this.x+radius < width && this.y-radius < height){
      
      this.x += inc_x;
      this.y += inc_y;
      this.z += inc_z;  
      
      pushMatrix();
      balloon.translate(inc_x,inc_y,inc_z);
      popMatrix();
    }
    
  }
  
  void rotate(){
    
    pushMatrix();
    balloon.translate(x,y,z);
    balloon.rotateY(radians(1));
    balloon.translate(-x,-y,-z);
    //shape(balloon);
    popMatrix();
    
  }
  
  void shake_string(){
    
    if (string_rotate == 10){
      direction = -1;
    }
    if (string_rotate == -10){
      direction = 1;
    }
    
    pushMatrix();
    string.translate(x,y+radius,z);
    string.rotate(radians(direction*0.5));
    string.translate(-x,-(y+radius),-z);
    //shape(balloon);
    popMatrix();
    
    string_rotate += (direction*0.5);
    
  }
}