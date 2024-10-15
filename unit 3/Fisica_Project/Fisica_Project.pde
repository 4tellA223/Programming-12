import fisica.*;

boolean wkey,akey,dkey,upkey,leftkey, rightkey;

//fisica
FWorld world;

void setup() {
  fullScreen();
  createWorld();
  createBodies();
}
void draw(){
  handlePlayerInput();
}

void createWorld() {
  //initial world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}

void createBodies(){


}
