class Mover {

  //instance variables
  PVector loc;
  PVector vel;
  float d;

  /////////////////////////////////CONSTRUCTION
  Mover() {
    d = 100;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector(random(-5, 5), random(-5, 5));
  }

  //behavier methods
  void act() {
    move();
    bounceOfEdge();
  }

  void move() {
    loc.add(vel);
  }
  void bounceOfEdge() {
    if (loc.x<0||loc.x>width) 
      vel.x = -vel.x;
    else if (loc.y<0 || loc.y>height) 
      vel.y = -vel.y;
    
  }

  //show
  void show() {
    noStroke();
    fill(255, 50);
    circle(loc.x, loc.y, d);
  }

  //connects
  void connect() {
    for (int i = 0; i<num; i++) {
      float dist = dist(loc.x, loc.y, movers[i].loc.x, movers[i].loc.y);
      if (dist <=200) {
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(2);
        line(loc.x, loc.y, movers[i].loc.x, movers[i].loc.y);
      }
    }
  }
}
