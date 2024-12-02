class FThwomp extends FGameObject {
  int frame = 0;


  FThwomp(float x, float y) {
    super();
    setName("thwomp");
    setPosition(x, y);
    setFriction(34);
    setStatic(true);
    setRotatable(false);
  }

  void act() {
    detect();
  }


  void detect() {
    attachImage(thwomp[0]);
    if (player.getX()>=getX() && player.getX()<=getX()+ gridSize) {
      setStatic(false);
      attachImage(thwomp[1]);
    }
    if (checkForCollisions("ground")) {
      attachImage(thwomp[0]);
      setPosition(160, 352);
      setStatic(true);
    }
    //kill
    if (checkForCollisions("player")) {
      if (player.getY() >= getY() - gridSize/2) {
        player.setPosition(80, 0);
        setStatic(true);
        setPosition(160, 352+17);
      }
    }
  }

  void move() {
    float vx = getVelocityX();
    setVelocity( vx, 40*-1);
  }
}
