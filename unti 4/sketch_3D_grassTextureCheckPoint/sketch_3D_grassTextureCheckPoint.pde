float rotx, roty, rotz;
PImage dirt, grassTop, grassside;

void setup() {
  size(800, 800, P3D);
  dirt = loadImage("Dirt_(texture)_JE2_BE2.png");
  grassTop = loadImage("Grass_Block_Top_C.png");
  grassside = loadImage("Grass_Block_Side.png");

  textureMode(NORMAL);
}
void draw() {
  background(0);
  grassBlock( grassTop, dirt, grassside,width/2, height/2, 0);
}
void mouseDragged() {
  rotx =rotx + (pmouseY-mouseY)*0.01;
  roty = roty + (pmouseX-mouseX)*-0.01;
}
