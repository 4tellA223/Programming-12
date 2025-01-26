import java.awt.Robot;
//Robot for Mouse
Robot rbt;

//MAP VARIABLES
int gridSize;
PImage map;

PImage walls;
PImage logSide, logTop, oakplank;
ArrayList<PImage> lava = new ArrayList<PImage>();
int lavaFrame = 0;

//Color pallette
color black = #000000;
color white = #FFFFFF;
color dullBlue = #546d8e; // stonewall
color brown = #9c5a3c; //oak
color red = #ed1c24; // lava

//Control Variable
boolean skipFrame;
boolean wkey, akey, skey, dkey,upkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

//GAME OBJECTS
ArrayList<GameObject> objects;


void setup() {
  //CREATE GAME OBJECTS
  objects = new ArrayList();
  
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
  
  // lava
  for (int i = 0; i < 10; i++) {
    PImage lavaImage = loadImage("e7a88e87-ce19-4254-8bb5-41dbf9006f4c-" + i + ".png");
    lava.add(lavaImage);
    
  }

  textureMode(NORMAL);
}
//=========================================================================================================================
void draw() {
  background(0);
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);

  drawFocalPoint();
  move();
  drawFloor(-2000, 2000, 100, height-gridSize*3);
  drawFloor(-2000, 2000, 100, height);

  drawMap();
  
   
  
  int i = 0;
   while( i < objects.size()){
     GameObject obj = objects.get(i);
     obj.act();
     obj.show();
     if(obj.lives == 0){
       objects.remove(i);
     }else{
       i++;
     }
   }
}
