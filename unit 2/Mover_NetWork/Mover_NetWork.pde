int num=50;
ArrayList<Mover> movers;
void setup() {
  size(800, 800);
  movers = new ArrayList();

  //for (int i = 0; i<movers.size(); i++) {
  //  movers.add(new Mover());
  //}

  for (int i = 0; i<num; i++) {
    movers.add(new Mover());
  }
}

void draw() {
  background(#3C62CE);
  for (int i=0; i<movers.size(); i++) {
    Mover m = movers.get(i);

    m.act();
    m.show();
    m.connect();

    if (m.alive==false) {
      movers.remove(i);
    }
  }
}

//void mouseReleased(){
//  movers.add(new Mover(mouseX,mouseY));

//}
