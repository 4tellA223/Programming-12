void gameover() {
  textFont(game);
  image(backgroundImg, 0, 0, width, height);

  if (score1 ==2) {
    textSize(128);
    fill(#292EFF);
    text("WINNER IS PLAYER1!", width/2, height/2);
  } else if (score2 ==2) {
    textSize(128);
    fill(#FF676C);
    text("WINNER IS PLAYER2!", width/2, height/2);
  }
}

void gameoverClick() {
  if (mouseX>0 && mouseX<width&& mouseY>0 && mouseY<height) {
      score1 = 0;
    score2 = 0;
    MODE = INTRO;
    reset();
  }
}
