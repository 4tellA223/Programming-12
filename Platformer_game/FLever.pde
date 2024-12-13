 class FLever extends FGameObject {

  FLever(float x, float y) {
    super();
    setName("lever");
    setPosition(x, y);
    setRotatable(false);
    setStatic(true);
    setSensor(true);
  }
  
  void act() {
    animate();
  }
  void animate(){
    
  }

  
}
