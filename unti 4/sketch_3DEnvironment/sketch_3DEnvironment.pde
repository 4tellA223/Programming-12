boolean wkey, akey, skey, dkey;

void setup() {
  size(800, 600, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
}

void draw() {
  background(0);
  drawFloor();
  controlCamera();
}

void drawFloor() {
  background(0);
  stroke(255);
  for (int x = -2000; x <= 2000; x+=100) {
    line(x, height, -2000, x, height, 2000);
    line(-2000, height, x, 2000, height, x);
  }
}
void controlCamera() {
}

void keyPressed() {
  if (key == 'w' || key =='W') wkey = true;
  if (key == 'a' || key =='A')akey = true;
  if (key == 'd' || key =='D')dkey = true;
  if (key == 's' || key =='S')skey = true;
}

void keyReleased() {
  if (key == 'w' || key =='W')wkey = false;
  if (key == 'a' || key =='A')akey = false;
  if (key == 'd' || key =='D')dkey = !true;
  if (key == 's' || key =='S')skey = false;
}
