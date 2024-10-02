class Mover {
  //instance
  float x, y;

  Mover() {
    x=width/2;
    y=height/2;
  }
  void show() {
    stroke(0);
    strokeWeight(5);
     fill(random(0,255),random(0,255),random(0,255));
    circle(x, y, 100);
  }
  void act() {
    x= x+ random(-2,2);
    y = y+random(-2,2);
  }
}
