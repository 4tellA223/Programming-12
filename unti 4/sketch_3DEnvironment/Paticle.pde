class Particle extends GameObject {

  PVector dir;
  int timer = 10;
  float vx, vy, vz;

  Particle( PVector loc) {
    super(loc.x, loc.y, loc.z, 5);
    float vx = random(loc.x, loc.x-50);
    float vy = random(loc.y, loc.y-50);
    float vz = random(loc.z, loc.z-50);
    dir = new PVector(vx, vy, vz);
    dir.setMag(50);
  }

  //methods

  void act() {
    if (timer >= 0) {
      dir = new PVector(loc.x, loc.y+vy, loc.z+vz);
      timer --;
    } else dir =  new PVector(loc.x, loc.y-vy, loc.z);

    int hitx = int(loc.x + 2000)/gridSize;
    int hity = int(loc.z + 2000)/gridSize;
    int hitz = int(loc.y + 2000)/gridSize;
    if (map.get(hitx, hity) == white) {
      show(hitx, hity, hitz);
    }
  }

  void show(float x1, float y1, float z1) {
    pushMatrix();

    translate(x1, y1, z1);
    fill(white);
    stroke(100);
    box(10);

    popMatrix();
  }
}
