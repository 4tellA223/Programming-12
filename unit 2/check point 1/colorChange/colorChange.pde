Mover[] myMover;
int n = 50;
void setup() {
  myMover = new Mover[n];
  size(300, 300);
  for (int i = 0; i<n; i++) {
    
    myMover[i] = new Mover();
  }
}
void draw() {
  
  for (int i = 0; i<n; i++) {
    myMover[i].act();
    myMover[i].show();
  }
}
