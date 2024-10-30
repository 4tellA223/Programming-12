import fisica.*;
boolean wkey, akey, dkey, skey, upkey, leftkey, rightkey, downkey;
int score1 = 0, score2 =0;

//font
PFont game;

//mode framework
int MODE;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
//fisica
FWorld world;

//image


void setup() {
  //imageMode(CENTER);
  MODE = INTRO;
  fullScreen();
  createWorld();
  createBodies();
  game = createFont("Games.ttf", 128);
  //introBackground = loadImage("Intro.jpg");
  
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
  world.setGravity(0, 0);
  world.setEdges();
}

void createBodies() {
}
