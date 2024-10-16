color sky = #5AB8D3;
color red = #DE001A;
boolean makeBall = true;

//assets
FPoly topPlatform;
FPoly basket;

void game() {
  background(sky);
  if (frameCount % 20 == 0) {  //Every 20 frames ...
    player1();
  }
  //ball
  if (makeBall) {
    ball();
    basket();
    makeBall=false;
  }

  world.step();
  world.draw();
}

//=======================================================================================
void player1() {
  pushMatrix();
  //translate
  translate(100, 100);

  popMatrix();
}
//==========================================================================================
void ball() {
  FCircle ball = new FCircle(40);
  ball.setPosition(width/2, height/2);

  //physical properties
  ball.setDensity(0.8);
  ball.setFriction(1);
  ball.setRestitution(0.9);
  world.add(ball);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  //gravity
  world.setGravity(0, 900);
}
//======================================================================================
void basket() {
basket = new FPoly();

  //plot the vertices of this platform
basket.vertex(0, 0);
basket.vertex(0, 20);
basket.vertex(20, 20);
basket.vertex(20, 0);
basket.vertex(30, 0);
basket.vertex(30, 30);
basket.vertex(-10, 30);
basket.vertex(-10, 0);
basket.vertex(0, 0);

  // define properties
basket.setStatic(true);
basket.setFillColor(red);
basket.setFriction(0);

  //put it in the world
  world.add(basket);
}
