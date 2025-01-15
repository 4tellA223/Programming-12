import java.awt.Robot;
//Robot for Mouse
Robot rbt;

//MAP VARIABLES
int gridSize;
PImage map;

PImage walls;

//Color pallette
color black = #000000;
color white = #FFFFFF;

//Control Variable
boolean skipFrame;
boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  //DEFAULT
  
  fullScreen(P3D);
  //size(800, 600, P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  gridSize = 100;
  
  loadImage();

  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;

  focusX = width/2;
  focusY = height/2;
  focusZ = 10;

  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;

  //noCursor();

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;
}
//========================================================================================================================
void loadImage(){
  

  //initialize map
  map = loadImage("map.png");
  walls = loadImage("Stone_Bricks.png");
  textureMode(NORMAL);
  
}
//=========================================================================================================================
void draw() {
  background(0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  
  drawFloor(-2000,2000,1000,0);
  drawFloor(-2000,2000,100,height);
  drawFocalPoint();
  controlCamera();
  drawMap();
}
//====================================================================================================
void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}
//=======================================================================================================
void drawFloor(int Xmin, int Xmax, int lines,int ypoint) {
  background(0);
  stroke(255);
  for (int x = Xmin; x <= Xmax; x+=lines) {
    line(x, ypoint, -2000, x, ypoint, 2000);
    line(Xmin, ypoint, x, Xmax, ypoint, x);
  }
}
void controlCamera() {
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);

  //KEY CONTROL
  if (wkey) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX) *0.01;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;
  }
  
  focusX = eyeX + cos(leftRightHeadAngle)*300 ;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300 ;
  
  
  // MOUSE CONTROLING FOCAL POINTS
  //leftRightHeadAngle( = leftRightHeadAngle +(mouseX - pmouseX)*0.01;
  //upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
}
// +====================================DRAW MAP()===================================

void drawMap(){
  for(int x = 0; x< map.width; x++){
    for(int y = 0; y < map.height; y++){
      color c = map.get(x,y);
      if( c!= white){
        pushMatrix();
        fill(c);
        stroke(100);
        translate(x*gridSize-2050,height/2, y*gridSize-2000);
        box(gridSize,height,gridSize);
        popMatrix();
      }
    }
  }
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
