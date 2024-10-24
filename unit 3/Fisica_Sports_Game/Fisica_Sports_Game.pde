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

//colour
color sky = #5AB8D3;
color red = #DE001A;
color green = #1A812C;
color blue = #004DCE;

boolean makeAssets = true;

//image
PImage player1Img, player2Img, ballImg;
PImage backgroundImg, introBackground;

//players
float player1_vx, player1_vy, player2_vx, player2_vy;
FBox player1, player2;
FCircle ball;

//assets
FPoly ground;
FBox basket1, basket2;

void setup() {
  fullScreen();
  createWorld();
  MODE = INTRO;

  //setup
  player1Img = loadImage("Player1.png");
  player2Img = loadImage("Player2.png");
  ballImg = loadImage("ball.png");
  backgroundImg= loadImage("background.jpg");

  game = createFont("Games.ttf", 128);
  introBackground = loadImage("Intro.jpg");

  groundGrass();
}

//==================================================================================

void groundGrass() {
  ground = new FPoly();

  //plot the vertices of this platform
  ground.vertex(0, height-100);
  ground.vertex(width, height-100);
  ground.vertex(width, height);
  ground.vertex(0, height);

  // define properties
  ground.setStatic(true);
  ground.setFillColor(green);
  ground.setFriction(0.1);

  //put it in the world
  world.add(ground);
}

void draw() {
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
