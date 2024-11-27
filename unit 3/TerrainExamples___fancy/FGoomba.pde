class FGoomba extends FGameObject {

   int direction = L;
   int speed = 50;
   int frame = 0;
  
  FGoomba(float x, float y) {
    super();
    setName("Goomba");
    setPosition(x, y);
    setRotatable(false);
  }
  void act() {
    if (checkForCollisions("player")) {
      setStatic(false);
      setSensor(true);
    }
  }
}
