float rotx, roty, rotz;

void setup() {
  size(800, 800, P3D);
}
void draw() {
  background(255);

  //SPHERE
  pushMatrix();
  translate(width/2,height/2-300,0);
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  sphere(40);
  popMatrix();

  //CUBE
   cube(width/2,height/2,0, #FF0000,200);
  cube(0,0,0,#0000FF,200);
}
void mouseDragged() {
  rotx =rotx + (pmouseY-mouseY)*0.01;
  roty = roty + (pmouseX-mouseX)*-0.01;
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();

  fill(c);
  stroke(0);
  strokeWeight(3);
  box(size);//L,W,H (side length)
  popMatrix();
}
