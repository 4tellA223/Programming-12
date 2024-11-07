  import fisica.*;
FWorld world;

color black = #000000;
color green = #22b14c;
color red   = #990030;
color blue  = #00b7ef;
color brown = #9c5a3c;
color leafs = #a8e61d;

PImage map,ice;
int gridSize =32;
float zoom=1.5;

boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey,jumpkey;
FPlayer player;

void setup() {
  
  size(600, 600);
  Fisica.init(this);
  map = loadImage("map.png");
  ice = loadImage("ice.png");
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld(-3000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  //map create
  for (int  y = 0; y<img.height; y++) {
    for (int x = 0; x < img.width; x++ ) {
      color c = img.get(x, y);
      
      if (c == green ) { //ground color
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setNoStroke();
         b.setFriction(46);
        b.setFillColor(green);
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("ground");
        world.add(b);
      }
       if (c == blue ) { //ice color
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setNoStroke();
        b.setFriction(0);
        b.setFillColor(blue);
        b.attachImage(ice);
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("ice");
        world.add(b);
      }
      if (c == brown ) { //tree trunk
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setNoStroke();
        b.setFillColor(brown);
        b.setStatic(true);
        b.setGrabbable(false);
        //behind other blocks 
        b.setSensor(true);
        b.setName("Tree Trunk");
        world.add(b);
      }
      if (c == leafs ) { //leaf green color
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setNoStroke();
         b.setFriction(46);
        b.setFillColor(leafs);
        b.setStatic(true);
        b.setGrabbable(false);
        b.setName("leafs");
        world.add(b);
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
  player.act();
}

void drawWorld(){
  pushMatrix();
  translate(-player.getX()*zoom+width/2,-player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
