class FThwomp extends FGameObject {
  int frame = 0;
  float xposition = 0;
  
  FThwomp(float x, float y) {
    super();
    setName("thwomp");
    setPosition(x,y);
    setFriction(34);
    setStatic(true);
    xposition = x;
  }
  
  void act(){
    detect();
  }
  
   
  void detect(){
    if(player.getX() == xposition ){
      setStatic(false);
      attachImage(thwomp[1]);
    }
  }
}
