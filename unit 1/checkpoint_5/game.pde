
void game() {
  textFont(game);
  if(iscountdown){
    countdown();
    return;
  }

  //is pulling boolean
  boolean isLeft = akey;
  boolean isRight = rkey;



  //player1 setup pulling//////////////////////////////////////////////////
  if (roundWaitTimer == 100 && isLeft && p1Timer > 0) {
    p1x -= 5;
    p1Timer--;
    p2x -= 5;
    // Manage leg movement
    legmoveTimer--;
    i -= 0.005;
    if (legmoveTimer < 0) {
      legmoveTimer = 100;
      i = 1; // Reset i for lift
    }
  }



  //player2 setup pulling/////////////////////////////////////////////////////
  if (roundWaitTimer == 100) {
    if (isRight && p2Timer > 0) {
      p2x += 5 ;
      p2Timer --;
      p1x+=5;
    }
  }

  //background variables
  background(#32893F);
  stroke(#FCFCFC);
  strokeWeight(10);
  fill(#77ACCE);
  rect(280, -100, 220, 900);
  scoreBoard();

  //player body///////////////////////////////////////////////////////////////////
  rope(p1x);
  player1(p1x, p1Size);
  player2(p2x, p2Size);

  if (isLeft && p1Timer>0 && roundWaitTimer ==100) {
    player1sweat(p1x);
  }
  if (isRight && p2Timer > 0 && roundWaitTimer ==100) {
    player2sweat(p2x);
  }

  //////////////////////////wining and losing vairables/////////////////////////////////
 if (p1x <= 65) {
    roundWaitTimer--;
    p2Size -= 0.005;
    if (roundWaitTimer < 0) {
      iscountdown = true;
      p1x = 200;  
      p2x = 600;
      roundWaitTimer = 1000; 
      p2Size = 1;
      p1win++;
      countdownTimer = 3; 
    }
  }

  if (p2x >= 720) {
    roundWaitTimer--;
    p1Size -= 0.005;
    if (roundWaitTimer < 0) {
      iscountdown = true;
      p1x = 200;
      p2x = 600;
      roundWaitTimer = 1000; 
      p1Size = 1;
      p2win++;
      countdownTimer = 3;
    }
  }
  if (p2win==2 || p1win ==2) {
    mode = GAMEOVER;
  }
}


//left player////////////////////////////////////////////////////////////////////
void player1(int x, float s) {
  pushMatrix();
  //translate
  translate(x, height/2);




  scale(s);
  //body
  pushMatrix();
  rotate(radians(0));
  fill(#0B0B12);
  stroke(#0B0B12);
  circle(0, 0, 60);
  popMatrix();


  //shoulders right
  pushMatrix();
  rotate(radians(-10));
  stroke(#2438FF);
  fill(#2438FF);
  rect(0, 20, 100, 13, 20);
  fill(#f6bd6c);
  stroke(#f6bd6c);
  circle(100, 26, 10);
  popMatrix();

  //shoulders left
  pushMatrix();
  rotate(radians(10));
  stroke(#2438FF);
  fill(#2438FF);
  rect(0, -26, 60, 13, 20);
  fill(#f6bd6c);
  stroke(#f6bd6c);
  circle(60, -18, 10);
  popMatrix();

  //head
  fill(#f6bd6c);
  stroke(#f6bd6c);
  circle(0, 0, 40);
  if (x==300) {
    p1 = true;
    p2 = false;
  }

  //eyes
  pushMatrix();
  noStroke();
  translate(10, -10);
  fill(0);
  circle(0, 0, 5);
  translate(10, 10);
  circle(0, 0, 5);
  popMatrix();


  popMatrix();
}


//right player

void player2(int x, float s) {
  pushMatrix();
  //translate
  translate(x, height/2);
  scale(s);

  //body
  pushMatrix();
  rotate(radians(0));
  fill(#0B0B12);
  stroke(#0B0B12);
  circle(0, 0, 60);
  popMatrix();

  //shoulders right
  pushMatrix();
  rotate(radians(10));
  stroke(#D80007);
  fill(#D80007);
  rect(0, 20, -100, 13, 20);
  fill(#f6bd6c);
  stroke(#f6bd6c);
  circle(-100, 26, 10);
  popMatrix();

  //shoulders left
  pushMatrix();
  rotate(radians(-10));
  stroke(#D80007);
  fill(#D80007);
  rect(0, -26, -60, 13, 20);
  fill(#f6bd6c);
  stroke(#f6bd6c);
  circle(-60, -18, 10);
  popMatrix();

  //head
  fill(#f6bd6c);
  stroke(#f6bd6c);
  circle(0, 0, 40);
  if (x==300) {
    p1 = true;
    p2 = false;
  }

  //eyes
  pushMatrix();
  noStroke();
  translate(-10, -10);
  fill(0);
  circle(0, 0, 5);
  translate(-10, 10);
  circle(0, 0, 5);
  popMatrix();


  popMatrix();
}


void rope(int x) {
  pushMatrix();
  translate(x+100, height/2);
  stroke(1);
  strokeWeight(2);
  fill(#C68F26);
  int x2 = -50;
  for (int x1 = 0; x1<20; x1++) {
    rect(x2, -10, 20, 20, 10);
    x2+=15;
  }
  popMatrix();
}

void player1sweat(int x) {
  fill(#72EBF5);
  pushMatrix();
  translate(x, height/2);
  rotate(radians(17));
  rect(-30, 40, 10, 30, 5);
  popMatrix();

  pushMatrix();
  translate(x, height/2);
  rotate(radians(7));
  rect(-15, 40, 10, 30, 5);
  popMatrix();
}

void player2sweat(int x) {
  fill(#72EBF5);
  pushMatrix();
  translate(x, height/2);
  rotate(radians(217));
  rect(-30, 40, 10, 30, 5);
  popMatrix();

  pushMatrix();
  translate(x, height/2);
  rotate(radians(207));
  rect(-15, 40, 10, 30, 5);
  popMatrix();
}


////////////////////////counting score///////////////////////////////////
void scoreBoard() {
  fill(255);
  textSize(30);
  circle(width/2, 0, 100);
  fill(#248BB2);
  text(p1win, width/2-30-5, 25);
  fill(#B22424);
  text(p2win, width/2+20, 25);
}

//////////////////////////countdown//////////////////////
void countdown() {
  if (iscountdown) {
    countdownFrame++;
    if (countdownFrame >= 60) {
      countdownFrame = 0; 
      countdownTimer--; 
    }

    
    if (countdownTimer < 1) {
      iscountdown = false; 
      // Reset for the next round
      countdownTimer = 3; 
      roundWaitTimer = 100;
      p1Timer = 10;
      p2Timer = 10; 
    }

  
    textSize(100);
   
    fill(255, 255, 255, 150); 
    text(countdownTimer, width / 2, height / 2); 
  }
}
