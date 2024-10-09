class Mover {

  //instance variables
  PVector loc;
  PVector vel;
  float d;
  boolean alive =true;

  /////////////////////////////////CONSTRUCTION
  Mover() {
    d = 100;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector(1,0);
    vel.rotate(radians(random(0,360)));
  }
  
  Mover(float x, float y){
   d = 100;
    loc = new PVector (x, y);
    vel = new PVector(1,0);
    vel.rotate(radians(random(0,360)));
  }

  //behavier methods
  void act() {
    move();
    bounceOfEdge();
    checkForDeletion();
  }
  
  void checkForDeletion(){
    if(dist(loc.x,loc.y,mouseX,mouseY)<d/2 && mousePressed){
      alive =false;
    }
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
    if(alive){fill(255,50);}
    else{ fill(255,0,0,50);}
    circle(loc.x, loc.y, d);
  }

  //connects
  void connect() {
    for (int i = 0; i<movers.size(); i++) {
      Mover other = movers.get(i);
      
      float dist = dist(loc.x, loc.y, other.loc.x, other.loc.y);
      if (dist <=200) {
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(2);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }
}
