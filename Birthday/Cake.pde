class Cake {
  PShape birthdayCake = createShape(GROUP);
  PShape top1 = createShape();
  PShape bottom1 = createShape();
  PShape body1 = createShape();
  PShape top2 = createShape();
  PShape bottom2 = createShape();
  PShape body2 = createShape();
  float x, y, z, r1, h1, r2, h2;
  
  Cake (float x, float y, float z, float r1, float h1, float r2, float h2) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.r1 = r1;
    this.h1 = h1;
    this.r2 = r2;
    this.h2 = h2;
    
    float angle = TWO_PI / 30;
    float halfHeight1 = h1 / 2;
    float halfHeight2 = h2 / 2;
    float xx, yy;
    
    fill(color(255,0,0));
    top1.beginShape();
    top1.fill(color(#C15260));
    for (float i = 0; i < TWO_PI; i += angle) {
      xx = cos(i) * r1;
      yy = sin(i) * r1;
      top1.vertex (xx, -halfHeight1, yy);
    }
    top1.endShape(CLOSE);
    bottom1.beginShape();
    bottom1.fill(color(#9F7143));
    for (float i = 0; i < TWO_PI; i += angle) {
      xx = cos(i) * r1;
      yy = sin(i) * r1;
      bottom1.vertex (xx, halfHeight1, yy);
    }
    bottom1.endShape(CLOSE);
    body1.beginShape(TRIANGLE_STRIP);
    body1.noStroke();
    body1.fill(color(#FCE9AF));
    for (float i = 0; i < TWO_PI; i += angle) {
      xx = cos(i) * r1;
      yy = sin(i) * r1;
      body1.vertex( xx, halfHeight1, yy);
      body1.vertex( xx, -halfHeight1, yy);
      }
    body1.endShape(CLOSE); 
    
    // Second cylinder
    
    top2.beginShape();
    top2.fill(color(#C15260));
    for (float i = 0; i < TWO_PI; i += angle) {
      xx = cos(i) * r2;
      yy = sin(i) * r2;
      top2.vertex (xx, -halfHeight2 - h1, yy);
    }
    top2.endShape(CLOSE);
    bottom2.beginShape();
    for (float i = 0; i < TWO_PI; i += angle) {
      xx = cos(i) * r2;
      yy = sin(i) * r2;
      bottom2.vertex (xx, halfHeight2 - h1, yy);
    }
    bottom2.endShape(CLOSE);
    body2.beginShape(TRIANGLE_STRIP);
    body2.noStroke();
    body2.fill(color(#FCE9AF));
    for (float i = 0; i < TWO_PI; i += angle) {
      xx = cos(i) * r2;
      yy = sin(i) * r2;
      body2.vertex( xx, halfHeight2 - h1, yy);
      body2.vertex( xx, -halfHeight2 - h1, yy);
      }
    body2.endShape(CLOSE);
    birthdayCake.addChild(top1);
    birthdayCake.addChild(bottom1);
    birthdayCake.addChild(body1);
    birthdayCake.addChild(top2);
    birthdayCake.addChild(bottom2);
    birthdayCake.addChild(body2);
  }
  
  void display () {
    pushMatrix();
    translate(this.x, this.y, this.z);
    //rotate(-frameCount);
    shape(birthdayCake);
    popMatrix();
    
  }
  
}