//colour
color sky = #5AB8D3;
color red = #DE001A;
color green = #1A812C;
color blue = #004DCE;

boolean makeBall = true;

//players
PImage player1Img, player2Img, ballImg;
float player1_vx, player1_vy, player2_vx, player2_vy;
FBox player1, player2;
FCircle ball;
int score1 = 0, score2 =0;

//assets
FPoly ground;
FBox basket1, basket2;

void game() {
  background(sky);
  //setup
  player1Img = loadImage("Player1.png");
  player2Img = loadImage("Player2.png");
  ballImg = loadImage("ball.png");

  if (frameCount % 2 == 0) {  //Every 20 frames ...
    MovingPlayer();
    if (hitGround(basket1)) {
      reset();
    }
    if (hitGround(basket2)) {
      reset();
    }
  }


  //functions
  if (makeBall) {
    ball();
    basketRight();
    basketLeft();
    player1();
    player2();
    groundGrass();
    makeBall=false;
  }

  world.step();
  world.draw();
}


//=======================================================================================
void player1() {
  //setups
  player1 = new FBox(125, 125);
  player1.setPosition(width/2+200, height/2);

  //set visuals
  image(player1Img, 0, 0);
  player1.attachImage(player1Img);
  player1Img.resize(105, 125);

  //set physical properties
  player1.setDensity(0.3);
  player1.setFriction(1);
  player1.setRestitution(0.4);
  player1.setGrabbable(false);
  player1.setRotatable(false);
  world.add(player1);
}
//====================================================================================================
void player2() {
  //setups
  player2 = new FBox(55, 105);
  player2.setPosition(width/2-200, height/2);

  //set visuals
  image(player2Img, 0, 0);
  player2.attachImage(player2Img);
  player2Img.resize(105, 125);

  //set physical properties
  player2.setDensity(0.3);
  player2.setFriction(1);
  player2.setRestitution(0.4);
  player2.setGrabbable(false);
  player2.setRotatable(false);
  world.add(player2);
}
//==========================================================================================
void ball() {
  ball = new FCircle(80);
  ball.setPosition(width/2, height/2);

  //set visuals
  image(ballImg, 0, 0);
  ball.attachImage(ballImg);
  ballImg.resize(80, 80);


  //physical properties
  ball.setDensity(0.1);
  ball.setFriction(0.1);
  ball.setRestitution(0.9);
  world.add(ball);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  //gravity
  world.setGravity(0, 0);
}
//======================================================================================

void basketRight() {
  pushMatrix();
  basket1 = new FBox(10, 300);
  basket1.setPosition(width-10, height/2);

  //plot the vertices of this platform
  //basket.vertex(0,0);
  //basket.vertex(0,300);
  //basket.vertex(10,300);
  //basket.vertex(10,0);

  // define properties
  basket1.setStatic(true);
  basket1.setFillColor(red);
  basket1.setFriction(0);
  basket1.setGrabbable(false);

  //put it in the world
  world.add(basket1);
  popMatrix();
}
//=========================================================================================
void basketLeft() {
  pushMatrix();
  basket2 = new FBox(10, 300);
  basket2.setPosition(5, height/2);

  //plot the vertices of this platform
  //basket.vertex(0,0);
  // basket.vertex(0,300);
  // basket.vertex(10,300);
  // basket.vertex(10,0);


  // define properties
  basket2.setStatic(true);
  basket2.setFillColor(blue);
  basket2.setFriction(0);
  basket2.setGrabbable(false);

  //put it in the world
  world.add(basket2);
  popMatrix();
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
//=====================================================================================
void MovingPlayer() {
  //moving
  float player2_vx = player2.getVelocityX();
  float player2_vy = player2.getVelocityY();

  if (dkey) player2.setVelocity(450, player2_vy);
  if (akey) player2.setVelocity(-450, player2_vy);
  if (wkey) player2.setVelocity(player2_vx, -550);
  if (skey) player2.setVelocity(player2_vx, 550);

  float player1_vx = player1.getVelocityX();
  float player1_vy = player1.getVelocityY();

  if (rightkey) player1.setVelocity(200, player1_vy);
  if (leftkey) player1.setVelocity(-200, player1_vy);
  if (upkey) player1.setVelocity(player1_vx, -450);
  if (downkey) player1.setVelocity(player1_vx, 450);
}
//======================================================================================
boolean hitGround(FBox ground) {
  ArrayList<FContact> contactList = ball.getContacts();
  for (int i =0; i<contactList.size(); i++) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(ground))
      return true;
  }
  return false;
}

void reset() {
  player1.setPosition(width/2+200, height/2);
  player2.setPosition(width/2-200, height/2);
   ball.setPosition(width/2, height/2);
}
