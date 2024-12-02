import fisica.*;
FWorld world;

color black = #000000;
color green = #00FF00;
color gray  = #464646;
color yellow = #fff200;
color purple = #2f3699;
color orange = #ff7e00;
color red    = #ed1c24;
color lightGray = #b4b4b4;

PImage map;
int gridSize =32;
float zoom=1.5;

boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey;
FPlayer player;
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;
PImage[] goomba;
PImage[] thwomp;
PImage[] HammerBro;
PImage Hammer;

//game
PImage bridge, lava[];
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
int numFrames = 6;
String pre = "lava";
String post = ".png";
String preg = "goomba";
int speed;

//game image
PImage brick;


void setup() {
  size(600, 600);
  //load image
  brick = loadImage("brick.png");
  map = loadImage("map.png");
  bridge = loadImage("bridge.png");
  
  brick.resize(gridSize,gridSize);

  Fisica.init(this);
  terrain =  new ArrayList<FGameObject>();
  enemies = new ArrayList();

 
  loadWorld(map);
  loadPlayer();
  speed = 45;

  // load character image
  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");

  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");

  run = new PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");
  
  //enemies--------------------
  goomba = new PImage[2];
  goomba[0] = loadImage("goomba0.png");
  goomba[1] = loadImage("goomba1.png");
  goomba[0].resize(gridSize,gridSize);
  goomba[1].resize(gridSize,gridSize);
  
  thwomp = new PImage[2];
  thwomp[0] = loadImage("thwomp0.png");
  thwomp[1] = loadImage("thwomp1.png");
  thwomp[0].resize(gridSize*2,gridSize*2);
  thwomp[1].resize(gridSize*2,gridSize*2);
  
  HammerBro = new PImage[2];
  HammerBro[0] = loadImage("hammerbro0.png");
  HammerBro[1] = loadImage("hammerbro1.png");
  HammerBro[0].resize(gridSize,gridSize);
  HammerBro[1].resize(gridSize,gridSize);
  
  Hammer = loadImage("hammer.png");

  action = idle;
}

void loadWorld(PImage img) {
  world = new FWorld(-3000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  //map create
  for (int  y = 0; y<img.height; y++) {
    for (int x = 0; x < img.width; x++ ) {
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setNoStroke();
      b.setStatic(true);
      b.setGrabbable(false);
      b.setFriction(46);

      color c = img.get(x, y); //color of current pixel
      color s = img.get(x, y+1); // color below current pixel
      color w = img.get(x-1, y); // color west of current pixel
      color e = img.get(x+1, y); //color east of current pixel

      if (c == black) {
        b.setFillColor(green);
        b.setName("ground");
        world.add(b);
      }else if(c == gray){
        b.setName("wall");
        b.attachImage(brick);
        world.add(b);
      } 
      else if (c == orange) { // bridge
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      } else if (c == red) { // lava
        FLava lava = new FLava(x*gridSize, y*gridSize);
        terrain.add(lava);
        world.add(lava);
      }
      else if(c == yellow){
      FGoomba gmb = new FGoomba(x*gridSize,y*gridSize);
      enemies.add(gmb);
      world.add(gmb);
      }else if(c == lightGray){
        FThwomp twp = new FThwomp(x*gridSize, y*gridSize+17);
        enemies.add(twp);
        world.add(twp);
      }else if(c == purple){//Hammer bro
        FHammerBro hmb = new FHammerBro(x*gridSize, y*gridSize);
        enemies.add(hmb);
        world.add(hmb);
      }
    }
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}


void draw() {
  background(#FFFFFF);
  drawWorld();
  actWorld();
}

void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i<enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
