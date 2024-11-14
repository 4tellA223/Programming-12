import fisica.*;
FWorld world;

color black = #000000;
color green = #22b14c;
color red   = #990030;
color blue  = #00b7ef;
color brown = #9c5a3c;
color leafs = #a8e61d;

PImage map, ice, grass, Trunk;
//leafs
PImage treeIntersect, treeMiddle, treeE, treeW;
int gridSize =32;
float zoom=1.5;

boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, jumpkey;
FPlayer player;

void setup() {

  size(600, 600);
  Fisica.init(this);
  map = loadImage("map.png");
  ice = loadImage("ice.png");
  ice.resize(gridSize, gridSize);
  grass= loadImage("grass.png");
  grass.resize(gridSize, gridSize);
  Trunk = loadImage("tree_trunk.png");
  Trunk.resize(gridSize, gridSize);
  treeIntersect = loadImage("tree_intersect.png");
  treeIntersect.resize(gridSize, gridSize);
  treeMiddle = loadImage("treetop_center.png");
  treeE = loadImage("treetop_e.png");
  treeE.resize(gridSize,gridSize);
  treeW = loadImage("treetop_w.png");
  treeW.resize(gridSize,gridSize);
  treeMiddle.resize(gridSize,gridSize);
  
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world = new FWorld(-3000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  //map create
  for (int  y = 0; y<img.height; y++) {
    for (int x = 0; x < img.width; x++ ) {
      color c = img.get(x, y); //color of current pixel
      color s = img.get(x, y+1); // color below current pixel
      color w = img.get(x-1, y); // color west of current pixel
      color e = img.get(x+1, y); //color east of current pixel
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setNoStroke();
      b.setStatic(true);
      b.setGrabbable(false);
      if (c == green ) { //ground color
        b.setFriction(46);
        b.setFillColor(green);
        b.attachImage(grass);
        b.setName("ground");
        world.add(b);
      }
      if (c == blue ) { //ice color
        b.setFriction(0);
        b.setFillColor(blue);
        b.attachImage(ice);
        b.setName("ice");
        world.add(b);
      }
      if (c == brown ) { //tree trunk
        b.setFillColor(brown);
        b.attachImage(Trunk);
        //behind other blocks
        b.setSensor(true);
        b.setName("Tree Trunk");
        world.add(b);
      }
       if (c == leafs &&  s ==brown ) { //leaf Intersection
        b.attachImage(treeIntersect);
        b.setName("treetop");
        world.add(b);
      }else if (c == leafs && w == leafs & e == leafs) {// mid piece
        b.attachImage(treeMiddle);
        b.setName("treetop");
        world.add(b);
      }else if( c == leafs && w != leafs){ //west endcap
        b.attachImage(treeW);
        b.setName("treetop");
        world.add(b);
      }else if(c == leafs && e != leafs){//east endcap
        b.attachImage(treeE);
        b.setName("treetop");
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

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
