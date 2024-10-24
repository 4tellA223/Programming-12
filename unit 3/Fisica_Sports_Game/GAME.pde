void game() {
  background(sky);
  
  if (makeAssets) {
    makeBall();
    basketRight();
    basketLeft();
    makePlayer1();
    makePlayer2();
    
    makeAssets=false;
  }
  
  MovingPlayer();
  if (hitGround(basket1)) {
      reset();
      score1++;
    }
    if (hitGround(basket2)) {
      reset();
      score2++;
    }
    
   if (score1 ==2 || score2 ==2) {
    MODE=GAMEOVER;
  }
  
  world.step();
  world.draw();
}

//=======================================================================================
void makePlayer1() {
  //setups
  player1 = new FBox(105, 125);
  player1.setPosition(width/2+200, height/2);

  //set visuals
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
void makePlayer2() {
  //setups
  player2 = new FBox(105, 125);
  player2.setPosition(width/2-200, height/2);

  //set visuals
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
void makeBall() {
  ball = new FCircle(80);
  ball.setPosition(width/2, height/2);

  //set visuals
  ball.attachImage(ballImg);
  ballImg.resize(80, 80);

  //physical properties
  ball.setDensity(0.4);
  ball.setFriction(0.1);
  ball.setRestitution(0.9);
  world.add(ball);
}

//======================================================================================

void basketRight() {
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
  basket1.setSensor(true);
  basket1.setGrabbable(false);

  //put it in the world
  world.add(basket1);
}

//=========================================================================================
void basketLeft() {
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
  basket2.setSensor(true);
  basket2.setGrabbable(false);

  //put it in the world
  world.add(basket2);
}

//=====================================================================================
void MovingPlayer() {
  //moving
  player2_vx = player2.getVelocityX();
  player2_vy = player2.getVelocityY();

  if (dkey) player2.setVelocity(450, player2_vy);
  if (akey) player2.setVelocity(-450, player2_vy);
  if (wkey) player2.setVelocity(player2_vx, -550);
  if (skey) player2.setVelocity(player2_vx, 550);

  player1_vx = player1.getVelocityX();
  player1_vy = player1.getVelocityY();

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
  player1.setVelocity(0, 0);
  player2.setPosition(width/2-200, height/2);
  player2.setVelocity(0, 0);
  ball.setPosition(width/2, height/2);
  ball.setAngularVelocity(0);
  ball.setVelocity(0, 0);
}
