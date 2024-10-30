void game() {
  background(sky);
  textFont(game);
  textSize(50);
  fill(#292EFF);
  text(score1, width/2-30, 30);
  fill(#9ADEDC);
  text(":", width/2, 30);
  fill(#FF676C);
  text(score2, width/2+30, 30);




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

  ball_vx = ball.getVelocityX();
  ball_vy = ball.getVelocityY();
  int vy;
  int kick = 3;
  if (kick(player1)) {
    if (kick%2==0) {
      vy=-1050;
      ball.setVelocity(ball_vx, vy );
      player1.setVelocity(-450, 0);
      kick ++;
    }
    if (kick%3==0) {
      vy=1050;
      ball.setVelocity(ball_vx, vy );
      player1.setVelocity(-450, 0);
      kick ++;
    }
  }
  if (kick(player2)) {
    if (kick%2==0) {
      vy=1050;
      ball.setVelocity(ball_vx, vy);
      player2.setVelocity(-450, 0);
      kick ++;
    }
    if (kick%3==0) {
      vy=-1050;
      ball.setVelocity(ball_vx, vy);
      player2.setVelocity(-450, 0);
      kick ++;
    }
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
  player2 = new FBox(65, 95);
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

  if (dkey) player2.setVelocity(450, 0);
  if (akey) player2.setVelocity(-450, 0);
  if (wkey) player2.setVelocity(0, -550);
  if (skey) player2.setVelocity(0, 550);

  player1_vx = player1.getVelocityX();
  player1_vy = player1.getVelocityY();

  if (rightkey) player1.setVelocity(200, 0);
  if (leftkey) player1.setVelocity(-200, 0);
  if (upkey) player1.setVelocity(0, -450);
  if (downkey) player1.setVelocity(0, 450);
}
//==========================================================================================
void movingBall() {
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
//===============================================================================
boolean kick(FBox player) {
  ArrayList<FContact> contactList1 = ball.getContacts();
  for (int i =0; i<contactList1.size(); i++) {
    FContact myContact1 = contactList1.get(i);
    if (myContact1.contains(player))
      return true;
  }
  return false;
}
