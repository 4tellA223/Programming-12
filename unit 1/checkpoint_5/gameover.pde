void gameover() {
  textFont(game);
  if (p1win > p2win) {
    background(#2112FF);
    textSize(100);
    fill(#F7F7F7);
    text("BLUE WIN", 200, height/2);
  } else {
    background(#FF1212);
    textSize(100);
    fill(#F7F7F7);
    text("RED WIN", 200, height/2);
  }
}

void gameoverClicks() {
  if (mouseX>0 && mouseX<width && mouseY > 0 && mouseY<height) {
    mode = INTRO;
    p1win = 0;
    p2win =0;
  }
}
