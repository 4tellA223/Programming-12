int num =50;
Mover[] movers;
void setup(){
  size(800,800);
  movers = new Mover[num];
  
  for(int i = 0; i<num;i++){
    movers[i] = new Mover();
  }
}

void draw(){
  background(#3C62CE);
  for(int i=0; i<num;i++){
    movers[i].act();
    movers[i].show();
    movers[i].connect();
  }
}
