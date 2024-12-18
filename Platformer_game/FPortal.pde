class FPortal extends FGameObject {
  boolean open = false;
  int frame = 0;

  FPortal(float x, float y) {
    super();
    setName("portal");
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
    setSensor(true);
  }

  void act() {
    animate();
  }
  void animate() {
    if (frame == 9) frame = 0;
    attachImage(portal[frame]);
    if (frameCount % 5 ==0) frame++;
  }
}
