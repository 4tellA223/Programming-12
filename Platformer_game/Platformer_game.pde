import fisica.*;
FWorld world;

//VARIABLE
int gridSize = 32;
float zoom = 1.5;

//Map variables
PImage map;
PImage background;
int MODE = 1;
final int INTRO   = 0;
final int MAPA    = 1;
final int MAPB    = 2;
final int GAMEOVER= 3;

//PLAYER VAIRABLE
FPlayer player;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey;
PImage[] idle;
PImage[] aim;
PImage[] run;
PImage[] jump;

//COLORS
color green = #a8e61d;


//=========================================SETUP==============================================

void setup() {

  //DEFAULT
  fullScreen();
  Fisica.init(this);

  //LOAD IMAGE
  loadImages();

  //LOAD VARIABLE
  loadWorld(map);
  loadPlayer();
}
//=======================================LOAD IMAGE=========================
void loadImages() {
  //LOAD IMAGE
  map = loadImage("map.png");
  background = loadImage("background1.png");

  //IDLE
  idle = new PImage[5];
  for (int i = 1; i<=5; i++) {
    idle[i-1] = loadImage("\cuphead\idle\cuphead_idle_000" + i + ".png");
  }
}

//==========================================LOAD WORLD=============================================

void loadWorld(PImage img) {
  //LOAD MAP
  world = new FWorld(-3000, -3000, 3000, 3000);
  world.setGravity(0, 900);

  if (MODE == MAPA) {
    mapA(img);
    //loadAWorld(img);
  } else if (MODE == MAPB) {
    mapB();
  } else {
    println("ERROR: MODE DNE, MODE = " + MODE);
  }
}
//==========================================LOAD PLAYERS=============================================

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

//==========================================DRAW=============================================

void draw() {
  background(255);
  drawWorld();
  player.act();
}

//==========================================DRAW WORLD=============================================

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
