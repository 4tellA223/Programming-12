class Gif {
  PImage[] frames;
  int speed, Frame,numFrames;
  float x, y, w, h;

  Gif(String pre, String post, int n, int s, float x, float y) {
    frames = new PImage[n];
    numFrames = n;
    speed = s;
    Frame = 0;
    this.x= x;
    this.y= y;
    

    for (int i = 0; i<numFrames; i++) {
      frames[i] = loadImage(pre+i+post);
    }
    w = frames[0].width;
    h = frames[0].height;
  }
  Gif(String pre, String post, int n, int s, float x, float y,float w, float h){
  frames = new PImage[n];
    numFrames = n;
    speed = s;
    Frame = 0;
    this.x= x;
    this.y= y;
    this.w = w;
    this.h= h;
     for (int i = 0; i<numFrames; i++) {
      frames[i] = loadImage(pre+i+post);
    }
  }
  void show(){
    if(Frame == numFrames) Frame = 0;
    image(frames[Frame],x,y,w,h);
    if(frameCount % speed ==0) Frame++;
   
  }
}
