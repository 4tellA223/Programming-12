class FLava extends FGameObject {
  int Frame;

  FLava(float x, float y) {
    super();
    Frame = (int)random(0, 5);
    lava = new PImage[numFrames];
    setName("lava");
    setPosition(x, y);
    for (int i = 0; i<6; i++) {
      lava[i] = loadImage(pre+i+post);
    }

    setFriction(34);
    setStatic(true);
  }

  void act() {

    if (Frame == 5) Frame = 0;
    attachImage(lava[Frame]);

    if (frameCount % 20 ==0) Frame++;
  }
}
