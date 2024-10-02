class Mover {
  //instance
  float x, y;
float s = random(5,100);
  Mover() {
    x=width/2;
    y=height/2;
  }
  void show() {
    stroke(0);
    strokeWeight(5);
     fill(255);
    circle(x, y, s);
  }
  void act() {
    x= x+ random(-2,2);
    y = y+random(-2,2);
  }
}
