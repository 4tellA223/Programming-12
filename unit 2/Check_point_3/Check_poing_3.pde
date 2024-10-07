Gif usagi;

void setup() {
  size(800, 600);
  
  imageMode(CENTER);
  usagi = new Gif("frame_","_delay-0.04s.gif",19,5,width/2,height/2);
}
void draw() {
  background(255);
  usagi.show();
}
