//colour
color sky = #5AB8D3;
color red = #DE001A;
color green = #1A812C;

boolean makeBall = true;

//players
PImage player1Img;

//assets
FPoly ground;
FPoly basket;

void game() {
  background(sky);
  //setup
  player1Img = loadImage("Player1.png");
  
  //functions
  if (makeBall) {
    ball();
    basketRight();
    player1();
    groundGrass();
    makeBall=false;
  }

  world.step();
  world.draw();
}

//=======================================================================================
void player1() {
  //setups
  FBox player1 = new FBox(125,125);
  player1.setPosition(width/2-200,height/2);
  
  //set visuals
  image(player1Img,0,0);
  player1.attachImage(player1Img);
  player1Img.resize(105,125);
   
   //set physical properties
  player1.setDensity(0.8);
  player1.setFriction(1);
  player1.setRestitution(0.4);
  player1.setGrabable(false);
  world.add(player1);

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

void basketRight() {
  pushMatrix();
  basket = new FPoly();
  basket.setPosition(width-70, height/2);

  //plot the vertices of this platform
  basket.vertex(0, 0);
  basket.vertex(0, 30);
  basket.vertex(50, 30);
  basket.vertex(50, 0);
  basket.vertex(60, 0);
  basket.vertex(60, 40);
  basket.vertex(-10, 40);
  basket.vertex(-10, 0);
  basket.vertex(0, 0);

  // define properties
  basket.setStatic(true);
  basket.setFillColor(red);
  basket.setFriction(0);

  //put it in the world
  world.add(basket);
  popMatrix();
}
//==================================================================================

void groundGrass(){
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
