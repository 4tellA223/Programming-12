class Particle extends GameObject {

  PVector v;
  int timer = 200;
  

  Particle(PVector loc) {
    super(loc.x, loc.y, loc.z, 2);
    v = PVector.random3D();
    v.mult(random(8,10));
    //dir = loc.random3D();
  }

  //methods

  void act() {

    loc.add(v);
    int hitx = int(loc.x + 2000)/gridSize ;
    int hity = int(loc.z + 2000)/gridSize ;
    if (map.get(hitx, hity) ==  white ) {
      v.setMag(0);
    } 
    if(timer >= 100) timer-= 3;
    
  }

  void show() {
    pushMatrix();
    
    
    translate(loc.x, loc.y, loc.z);
    noStroke();
    fill(white,timer);
    sphere(5);
    

    popMatrix();
  }
}
