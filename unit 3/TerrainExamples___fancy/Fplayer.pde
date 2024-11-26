class FPlayer extends FGameObject {
  //fields
  int frame;
  int direction;
  final int L = -1;
  final int R = 1;

  FPlayer() {
    super();
    frame = 0;
    direction =R;
    setPosition(180, 0);
    setRotatable(false);
    setName("player");
    setFillColor(red);
  }
  void act() {
    handleInput();
    collisions();
    animate();
  }
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (vy == 0) {
      action = idle;
    }
    if (akey) {
      action = run;
      setVelocity(-500, vy);
    }
    if (dkey) {
      action = run;
      setVelocity(500, vy);
    }
    if (wkey) {
      setVelocity(vx, -250);
      action = jump;
    }
  }
  void collisions() {
    if (checkForCollisions("player")) {
      if (checkForCollisions("spike"))setPosition(200, 0);
      if (checkForCollisions("lava"))setPosition(200, 0);
    }
  }
  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if(direction == R)attachImage(action[frame]);
      if(direction == L)attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
}
