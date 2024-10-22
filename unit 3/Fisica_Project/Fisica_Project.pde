import fisica.*;
boolean wkey, akey, dkey, skey, upkey, leftkey, rightkey, downkey;

//mode framework
int MODE;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
//fisica
FWorld world;

void setup() {
  //imageMode(CENTER);
  MODE = GAME;
  fullScreen();
  createWorld();
  createBodies();
}
void draw() {
  world.setGravity(0, 0);
 


if (MODE == INTRO) {
  intro();
} else if (MODE == GAME) {
  game();
} else if (MODE ==GAMEOVER) {
  gameover();
} else {
  println("ERROR: MODE DNE, MODE + "+MODE);
}
}

void createWorld() {
  //initial world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}

void createBodies() {
}
