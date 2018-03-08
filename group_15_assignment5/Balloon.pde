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
   
   sphere = createShape(SPHERE,radius);
   sphere.setFill(c);
   sphere.setStroke(c);
   
   
   //cone = createShape();
   //cone.beginShape();
   //float angle = 360 / 20;
   //float halfHeight = triangle_height / 2;
   // // top
   // beginShape();
   // for (int i = 0; i < 20; i++) {
   //     float x_c = cos( radians( i * angle ) ) * (radius/10);
   //     float y_c = sin( radians( i * angle ) ) * (radius/10);
   //     vertex( x_c, y_c, -halfHeight);
   // }
   // endShape(CLOSE);
   // // bottom
   // beginShape();
   // for (int i = 0; i < 20; i++) {
   //     float x_c = cos( radians( i * angle ) ) * (radius/5);
   //     float y_c = sin( radians( i * angle ) ) * (radius/5);
   //     vertex( x_c, y_c, halfHeight);
   // }
   // endShape(CLOSE);
   // // draw body
   // beginShape(TRIANGLE_STRIP);
   // for (int i = 0; i < 20 + 1; i++) {
   //     float x1 = cos( radians( i * angle ) ) * (radius/10);
   //     float y1 = sin( radians( i * angle ) ) * (radius/10);
   //     float x2 = cos( radians( i * angle ) ) * (radius/5);
   //     float y2 = sin( radians( i * angle ) ) * (radius/5);
   //     vertex( x1, y1, -halfHeight);
   //     vertex( x2, y2, halfHeight);
   // }
   // endShape(CLOSE);
   //cone.endShape();
   
   string = createShape();
   string.beginShape();
   string.vertex(x,y+radius,z);
   string.bezierVertex(x+(radius/1.6), y+(radius*1.8),z,x+(radius/2.2),y+(radius*1.5),z,x,y+(radius*2.5),z);
   string.bezierVertex(x-(radius*.5),y+(radius*2.8),z,x-radius,y+(radius*3.2),z,x,y+(radius*4.2),z);
   string.noFill();
   string.endShape();
   
   //add everything to the group
   balloon.addChild(sphere);
   //balloon.addChild(cone);
   balloon.addChild(string);
   
  }
  
   void display() {
   
   pushMatrix();
   translate(x,y,z);
   //shape(sphere);
   //translate(x-radius,y-radius,0);
   shape(balloon);
   popMatrix();
   
  }
  
  void move(float inc_x, float inc_y, float inc_z){
    
    if(this.x+radius < width && this.y-radius < height){
      
      this.x += inc_x;
      this.y += inc_y;
      this.z += inc_z;    
    }
    
  }
  
  void rotate(){
    
    pushMatrix();
    balloon.translate(x,y,z);
    balloon.rotateY(radians(1));
    balloon.translate(-x,-y,z);
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
    popMatrix();
    
    string_rotate += (direction*0.5);
    
  }
}