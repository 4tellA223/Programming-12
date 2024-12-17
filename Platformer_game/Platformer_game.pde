import fisica.*;
FWorld world;

//VARIABLE
int gridSize = 32;
float zoom = 1.5;
boolean keyReleased, wasPressed;

//Map variables
PImage map;
PImage background;
PImage grasstop;
PImage grassbottom;
PImage spikes,spikesRight,spikesLeft;
PImage openLever, closeLever;
PImage walls;

float respondX = 80;
float respondY = 180;
int count = 3;

int MODE = 1;
final int INTRO   = 0;
final int MAPA    = 1;
final int MAPB    = 2;
final int GAMEOVER= 3;

//PLAYER VAIRABLE
FPlayer player;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, spacekey,ekey,zkey;
PImage[] action;
PImage[] idle;
PImage[] aim;
PImage[] run;
PImage[] jump;
PImage[] mughead;

//COLORS
color grass = #a8e61d;
color blueCuphead = #00b7ef;
color spike = #b4b4b4;
color black = #000000;
color lever = #ff7e00;

//GAME
ArrayList<FGameObject> npc;
ArrayList<FGameObject> lve;



//=========================================SETUP==============================================

void setup() {

  //DEFAULT
  //fullScreen();
  size(900,900);
  Fisica.init(this);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  npc = new ArrayList();
  lve= new ArrayList();
 

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
  grasstop = loadImage("texture/grass_top.png");
  grassbottom = loadImage("texture/grass_mid.png");
  spikes = loadImage("texture/spike.png");
  spikesRight =loadImage("texture/spike_right.png");
  spikesLeft = loadImage("texture/spike_left.png");
  openLever = loadImage("texture/Lever_open.png");
  closeLever = loadImage("texture/Lever_close.png");
  walls = loadImage("texture/wall.png");

  //RESIZE
  grasstop.resize(gridSize, gridSize);
  grassbottom.resize(gridSize, gridSize);
  background.resize(width, height);
  spikes.resize(gridSize,gridSize);
  spikesRight.resize(gridSize,gridSize);
  spikesLeft.resize(gridSize,gridSize);
  openLever.resize(gridSize,gridSize);
  closeLever.resize(gridSize,gridSize);
  walls.resize(gridSize,gridSize);


  //PLAYER MOVEMENT ===================================================
  //IDLE
  idle = new PImage[5];

  for (int i = 0; i<idle.length; i++) {
    idle[i] = loadImage("cuphead/idle/cuphead_idle_000" + i + ".png");
    idle[i].resize(gridSize, gridSize);
  }

  //RUN
  run = new PImage[16];

  for (int i = 1; i<= run.length; i++) {
    run[i-1] = loadImage("cuphead/run/cuphead_run_000" + i + ".png");
    run[i-1].resize(gridSize, gridSize);
  }

  //JUMP
  jump = new PImage[8];

  for (int i = 1; i <= jump.length; i ++) {
    jump[i-1] = loadImage("cuphead/jump/cuphead_jump_000" + i + ".png");
    jump[i-1].resize(gridSize, gridSize);
  }

  action = idle;

  //==========================CHARACTER IMAGE==========================

  //mughead
   mughead = new PImage[5];
  for (int i = 1; i <= mughead.length; i ++) {
    mughead[i-1] = loadImage("NPC/MugHead/mugman_idle_000" + i + ".png");
    mughead[i-1].resize(gridSize, gridSize);
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
  if(!zkey)translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
  
  for (int i = 0; i<npc.size(); i++) {
    FGameObject n = npc.get(i);
    n.act();
  }
  for(int i = 0; i < lve.size();i++){
    FGameObject l = lve. get(i);
    l.act();
  }
 
}
