import java.awt.Robot;
//Robot for Mouse
Robot rbt;

//MAP VARIABLES
int gridSize;
PImage map;

PImage walls;
PImage logSide, logTop, oakplank;

//Color pallette
color black = #000000;
color white = #FFFFFF;
color dullBlue = #546d8e; // stonewall
color brown = #9c5a3c; //oak

//Control Variable
boolean skipFrame;
boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  //DEFAULT

  fullScreen(P3D);

  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  gridSize = 100;

  loadImage();

  eyeX = width/2;
  eyeY = 9*height/10;
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
void loadImage() {


  //initialize map
  map = loadImage("map.png");
  walls = loadImage("Stone_Bricks.png");
  logTop = loadImage("Oak_Log_Top.png");
  logSide = loadImage("Oak_Log_Side.png");
  oakplank = loadImage("oakplank.jpg");

  textureMode(NORMAL);
}
//=========================================================================================================================
void draw() {
  background(0);
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);

  drawFocalPoint();
  controlCamera();
  drawFloor(-2000, 2000, 100, height-gridSize*3);
  drawFloor(-2000, 2000, 100, height);

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
void drawFloor(int Xmin, int Xmax, int lines, int ypoint) {
  stroke(255);
  strokeWeight(1);
  int x = Xmin;
  int z = Xmin;
  while (z < Xmax) {
    texturedCube(x, ypoint, z, oakplank, oakplank, oakplank, lines);
    x += lines;
    if ( x >= Xmax) {
      x = Xmin;
      z += lines;
    }
  }
}
void controlCamera() {
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);

  //KEY CONTROL
  if (wkey && canMoveForward()) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey && canMoveLeft()) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey && canMoveRight()) {
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
//========================================================
boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;
  fwdx = eyeX + cos(leftRightHeadAngle) * 200;
  fwdy = eyeY ;
  fwdz = eyeZ + sin(leftRightHeadAngle) * 200;

  mapx = int(fwdx + 2000) / gridSize;
  mapy = int(fwdz + 2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  }

  return false;
}

boolean canMoveRight() {
  float righty, rightx, rightz;
  int mapx;

  righty = eyeY;
  rightx = eyeX + cos(leftRightHeadAngle) * 200;
  rightz = eyeZ + sin(leftRightHeadAngle) * 200;

  mapx = int(rightx + 2000) / gridSize;

  if (map.get(mapx, mapx) == white) {
    return true;
  }
  return false;
}

boolean canMoveLeft() {
  float lefty, leftx, leftz;
  int mapy;

  lefty = eyeY;
  leftx = eyeX + cos(leftRightHeadAngle) * 200;
  leftz = eyeZ = sin(leftRightHeadAngle) * 200;

  mapy = int(leftx + 2000) / gridSize ;

  if (map.get(mapy, mapy) == white) {
    return true;
  }
  return false;
}



// +====================================DRAW MAP()===================================

void drawMap() {
  for (int x = 0; x< map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if ( c == dullBlue) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, walls, walls, walls, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, walls, walls, walls, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, walls, walls, walls, gridSize);
      }
      if ( c == brown) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, logTop, logTop, logSide, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, logTop, logTop, logSide, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, logTop, logTop, logSide, gridSize);
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
