//colour
color sky = #5AB8D3;
color red = #DE001A;
color green = #1A812C;
color blue = #004DCE;

boolean makeBall = true;

//players
PImage player1Img, player2Img,ballImg;
float player1_vx, player1_vy,player2_vx,player2_vy;
FBox player1,player2;

//assets
FPoly ground;
FPoly basket;

void game() {
  background(sky);
  //setup
  player1Img = loadImage("Player1.png");
  player2Img = loadImage("Player2.png");
  ballImg = loadImage("ball.png");

  if (frameCount % 4 == 0) {  //Every 20 frames ...
    MovingPlayer();
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
  FCircle ball = new FCircle(80);
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
  basket = new FPoly();
  basket.setPosition(width-10, height/2-300);

  //plot the vertices of this platform
  basket.vertex(0,0);
  basket.vertex(0,300);
  basket.vertex(10,300);
  basket.vertex(10,0);
  
  // define properties
  basket.setStatic(true);
  basket.setFillColor(red);
  basket.setFriction(0);
  basket.setGrabbable(false);

  //put it in the world
  world.add(basket);
  popMatrix();
}
//=========================================================================================
void basketLeft() {
  pushMatrix();
  basket = new FPoly();
  basket.setPosition(5, height/2-300);

  //plot the vertices of this platform
 basket.vertex(0,0);
  basket.vertex(0,300);
  basket.vertex(10,300);
  basket.vertex(10,0);
  

  // define properties
  basket.setStatic(true);
  basket.setFillColor(blue);
  basket.setFriction(0);
  basket.setGrabbable(false);

  //put it in the world
  world.add(basket);
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
  float player1_vx = player1.getVelocityX();
  float player1_vy = player1.getVelocityY();

  if (dkey) player1.setVelocity(250, player1_vy);
  if (akey) player1.setVelocity(-250, player1_vy);
  if (wkey) player1.setVelocity(player1_vx, -550);
  if (skey) player1.setVelocity(player1_vx, 550);
  
   float player2_vx = player2.getVelocityX();
  float player2_vy = player2.getVelocityY();

  if (rightkey) player2.setVelocity(350, player2_vy);
  if (leftkey) player2.setVelocity(-350, player2_vy);
  if (upkey) player2.setVelocity(player2_vx, -650);
  if (downkey) player2.setVelocity(player2_vx, 650);
}
