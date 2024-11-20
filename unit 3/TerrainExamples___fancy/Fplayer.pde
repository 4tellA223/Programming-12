class FPlayer extends FGameObject {
  FPlayer() {
    super();
    setPosition(180, 0);
    setRotatable(false);
    setName("player");
    setFillColor(red);
  } 
  void act() {
    handleInput();
    if(checkForCollisions("spike"))setPosition(200,0);
  }
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey)setVelocity(-500, vy);
    if (dkey)setVelocity(500, vy);
    if (wkey)setVelocity(vx, -250);
  }
}
