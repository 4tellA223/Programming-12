 class FLever extends FGameObject {
   boolean open = false;

  FLever(float x, float y) {
    super();
    setName("lever");
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
    setSensor(false);
  }
  
  void act() {
    animate();
  }
  void animate(){
    if(ekey && checkForCollisions("player") && !open){
      count--;
      open = true;
      print(count);
    }
    if(!open)attachImage(closeLever);
      else if(open){
        attachImage(openLever);
      }
  }

  
}
