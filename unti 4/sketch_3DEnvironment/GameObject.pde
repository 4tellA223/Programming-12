class GameObject{
//fields

  PVector loc;
  float size;
  float lives;
  
//constructor
  
  GameObject(){
    loc = new PVector(0,0,0);
    size = 10;
    lives = 1;
  }
  
// constructor (float, float ,float, float);
  
  GameObject(float x, float y, float z, float s){
    lives = 1;
    loc = new PVector(x, y, z);
    size = s;
  }
  
// methods

  void act(){
  
  }
  
  void show(){
    pushMatrix();
    
    translate(loc.x,loc.y,loc.z);
    fill(white);
    stroke(100);
    box(size);
    
    popMatrix();
  }


}
