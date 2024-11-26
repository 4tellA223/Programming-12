import fisica.*;
FWorld world;

color black = #000000;
color green = #00FF00;
color blue  = #0000FF;
color lightpink = #e67cb8;
color darkpink = #c2046f;
color orange = #ff7e00;
color red    = #ed1c24;

PImage map;
int gridSize =32;
float zoom=1.5;

boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey;
FPlayer player;
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;

//game
PImage bridge, lava[];
ArrayList<FGameObject> terrain;
int numFrames = 6;
String pre = "lava";
String post = ".png";
int speed;


void setup() {
  size(600, 600);

  Fisica.init(this);
  terrain =  new ArrayList<FGameObject>();
  map = loadImage("map.png");
  bridge = loadImage("bridge.png");
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
      } else if (c == orange) { // bridge
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      } else if (c == red) { // lava
        FLava lava = new FLava(x*gridSize, y*gridSize);
        terrain.add(lava);
        world.add(lava);
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
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
