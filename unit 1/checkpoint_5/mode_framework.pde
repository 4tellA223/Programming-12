int mode;
int i=1;
final int INTRO   = 0;
final int GAME    = 1;
final int GAMEOVER= 2;
boolean p1, p2;
boolean akey, rkey;
int p1Timer = 3;
int p2Timer = 3;
int p1x = 200;
int p2x = 600;
float p1Size = 1;
float p2Size = 1;

int p1win = 0;
int p2win = 0;

PFont game;
PFont introduction;
int roundWaitTimer = 100;
int legmoveTimer=100;


int countdownTimer = 3;
boolean iscountdown = false; 
int countdownDuration = 60; 
int countdownFrame = 0;
void setup() {
  size(800, 600);
  mode = INTRO;
  game = createFont("Games.ttf",128);
  introduction = createFont("GameOnlineDemoRegular.ttf",128);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("ERROR: MODE DNE, MODE = " + mode);
  }
}
