void pattern2() {
  background(blue);

  int count = 0;
  int c = 0;

  pushMatrix();
  rotate(radians(45));
  stroke(0);
  // horizontal c = 1
  for (int y = -1200; y<800; y+=80) {
    //veritical c = 0
    for (int x =-1200; x<1900; x+=80) {
      //color
      if (c==0) {
        fill(#D2E0FB);
        c++;
      } else if (c == 1) {
        fill(#FEF9D9);
        c++;
      } else if (c==2) {
        fill(#DEE5D4);
        c++;
      } else if (c==3) {
        fill(#7EACB5);
        c=0;
      }
      //color
      s(x, y, 60);
    }
    if (count == 0) count++;
    if (count == 1)count --;
  }
  popMatrix();

  //right
  tactiler();
  fill(255);
  circle(750, 30, 50);
  fill(0, 0, 0);
  triangle(740, 10, 740, 50, 770, 30);
  fill(0, 0, 0);

  //left
  fill(255);
  tactilel();
  fill(255);
  circle(50, 30, 50);
  fill(0);
  triangle(30, 30, 60, 50, 60, 10);
}

void s(int x, int y, int s) {

  rect(x, y, s, s, 8);
}
