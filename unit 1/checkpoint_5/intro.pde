void intro(){
  background(#2BA579);
  textFont(game);
  textSize(100);
  text("PULL THE ROPE",60,100);
  
  textFont(introduction);
  textSize(20);
  text("Click as fast as you can to pull hard ",170,200);
  text("Pull the player into the river to win ",170,300);
  text("Press 'a' to pull on the blue team",170,400);
   text("Press 'right arrow' to pull on the blue team",170,500);

}

void introClicks(){
  mode =GAME;

}
