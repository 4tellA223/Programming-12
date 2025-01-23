class Bullet extends GameObject {

  //fields

  PVector dir;
  float speed;

  //constructor
  Bullet() {
    super(eyeX, eyeY, eyeZ, 10);
    speed = 50;
    float vx = cos(leftRightHeadAngle);
    float vy = tan(upDownHeadAngle);
    float vz = sin(leftRightHeadAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }

  //methods
  void act() {


    int hitx = int(loc.x + 2000)/gridSize;
    int hity = int(loc.z + 2000)/gridSize;
    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0;
      for (int i = 0; i < 5; i++) {
        objects.add(new Particle(loc));
      }
    }
  }
}
