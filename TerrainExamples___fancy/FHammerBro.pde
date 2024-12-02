class FHammerBro extends FGameObject {

  int direction = L;
  int frame = 0;
  
  int timer = 200;

  FHammerBro(float x, float y) {
    super();
    setName("Hammer Bro");
    setPosition(x, y);
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
   ThrowHammer();
  }

  void animate() {
    if (frame >= goomba.length) frame = 0;
    if (frameCount%5 == 0) {
      if (direction == R)attachImage(HammerBro[frame]);
      if (direction == L)attachImage(reverseImage(HammerBro[frame]));
      frame++;
    }
  }
  void ThrowHammer() {
    timer--;
  
    if (timer < 0) {
      FBox hammer = new FBox(10,10);
      hammer.setPosition(getX(),getY());
      hammer.setVelocity(200*direction,-500);
      hammer.setAngularVelocity(55);
      hammer.setSensor(true);
      hammer.attachImage(Hammer);
      hammer.setName("hammer");
      world.add(hammer);
      timer=200;
    }
  }

  void collide() {
    if (checkForCollisions("wall")) {
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if (checkForCollisions("player")) {
      if (player.getY() < getY() - gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        player.lives--;
        player.setPosition(200, 0);
      }
    }
  }
  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
