class Balloon{
  
  float x;
  float y; 
  float z; 
  float radius;
  float triangle_height;
  color c;
  float string_rotate;
  int direction;
<<<<<<< HEAD
=======
  int string_count = 0;
>>>>>>> 42856a2435f43ef0f7d2f4f37748ce56634de0ec
  
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
<<<<<<< HEAD
   
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
=======
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
>>>>>>> 42856a2435f43ef0f7d2f4f37748ce56634de0ec
   string.noFill();
   string.endShape();
   
   //add everything to the group
   balloon.addChild(sphere);
<<<<<<< HEAD
   //balloon.addChild(cone);
   balloon.addChild(string);
=======

   balloon.addChild(string);

>>>>>>> 42856a2435f43ef0f7d2f4f37748ce56634de0ec
   
  }
  
   void display() {
   
   pushMatrix();
<<<<<<< HEAD
   translate(x,y,z);
   //shape(sphere);
   //translate(x-radius,y-radius,0);
   shape(balloon);
=======
   //translate(x,y,z);
   //shape(sphere);
   //translate(x-radius,y-radius,0);
   shape(balloon);
   //translate(-x,-y,-z);
>>>>>>> 42856a2435f43ef0f7d2f4f37748ce56634de0ec
   popMatrix();
   
  }
  
  void move(float inc_x, float inc_y, float inc_z){
    
    if(this.x+radius < width && this.y-radius < height){
      
      this.x += inc_x;
      this.y += inc_y;
<<<<<<< HEAD
      this.z += inc_z;    
=======
      this.z += inc_z;  
      
      pushMatrix();
      balloon.translate(inc_x,inc_y,inc_z);
      popMatrix();
>>>>>>> 42856a2435f43ef0f7d2f4f37748ce56634de0ec
    }
    
  }
  
  void rotate(){
    
    pushMatrix();
    balloon.translate(x,y,z);
    balloon.rotateY(radians(1));
<<<<<<< HEAD
    balloon.translate(-x,-y,z);
=======
    balloon.translate(-x,-y,-z);
>>>>>>> 42856a2435f43ef0f7d2f4f37748ce56634de0ec
    //shape(balloon);
    popMatrix();
    
  }
  
  void shake_string(){
    
<<<<<<< HEAD
=======
   // if (string_count < 60){
   //   string = createShape();
   //   string.beginShape();
   // //string.vertex(x,y+radius,z);
   // //string.bezierVertex(x+(radius/1.6), y+(radius*1.8),z,x+(radius/2.2),y+(radius*1.5),z,x,y+(radius*2.5),z);
   ////string.bezierVertex(x-(radius*.5),y+(radius*2.8),z,x-radius,y+(radius*3.2),z,x,y+(radius*4.2),z);
   //  string.vertex(0,radius,0);
   //  string.bezierVertex((radius/1.6), (radius*1.8),0,(radius/2.2),(radius*1.5), 0, 0 , (radius*2.5), 0);
   //  string.bezierVertex((radius*.5),(radius*2.8), 0, radius, (radius*3.2), 0, 0, (radius*4.2), 0);
   //  string.noFill();
   //  string.endShape();
     
     
   // }
   // else if (string_count < 120){
      
   //   string = createShape();
   //   string.beginShape();
   // //string.vertex(x,y+radius,z);
   // //string.bezierVertex(x+(radius/1.6), y+(radius*1.8),z,x+(radius/2.2),y+(radius*1.5),z,x,y+(radius*2.5),z);
   ////string.bezierVertex(x-(radius*.5),y+(radius*2.8),z,x-radius,y+(radius*3.2),z,x,y+(radius*4.2),z);
   //  string.vertex(0,radius,0);
   //  string.bezierVertex((radius/2), (radius*1),0,(radius/-2.2),(radius*1.8), 0, 0 , (radius*3), 0);
   //  string.bezierVertex((radius*1),(radius*2), 0, radius*0.8, (radius*2), 0, 0, (radius*3), 0);
   //  string.noFill();
   //  string.endShape();
      
   // }
   // else if (string_count <180) {
   // }
   // else{
   //   string_count = 0;
   // }
    
   // string_count+=1;
   // balloon.addChild(string);
    
    
>>>>>>> 42856a2435f43ef0f7d2f4f37748ce56634de0ec
    if (string_rotate == 10){
      direction = -1;
    }
    if (string_rotate == -10){
      direction = 1;
    }
    
    pushMatrix();
    string.translate(x,y+radius,z);
<<<<<<< HEAD
    string.rotate(radians(direction*0.5));
    string.translate(-x,-(y+radius),-z);
=======
    string.rotateY(radians(direction*0.5));
    string.translate(-x,-(y+radius),-z);
    //shape(balloon);
>>>>>>> 42856a2435f43ef0f7d2f4f37748ce56634de0ec
    popMatrix();
    
    string_rotate += (direction*0.5);
    
  }
}