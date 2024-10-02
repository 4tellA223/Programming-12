class Mover {
  //instance
  float x, y;
  float r=random(0,255);
  float g=random(0,255);
  float b=random(0,255);
  Mover() {
    x=width/2;
    y=height/2;
  }
  void show() {
    stroke(0);
    strokeWeight(5);
     fill(r,g,b);
    circle(x, y, 100);
  }
  void act() {
     
    x= x+ random(-2,2);
    y = y+random(-2,2);
  }
}
