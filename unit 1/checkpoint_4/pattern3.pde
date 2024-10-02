void pattern3() {
  background(0);

  pushMatrix();
  rotate(radians(45));
  //black and white
  int count = 0;
  for (int x =-1000; x<1900; x+=110) {
    for (int y =-1000; y < 1900; y+=110) {
      if (count%2==0) {
        r1(x, y);
      } else {
        r2(x, y);
      }
      count++;
    }
  }
  popMatrix();
  //right
  fill(255);
  tactiler();
  fill(255);
  circle(750, 30, 50);
  fill(0);
  triangle(740, 10, 740, 50, 770, 30);

  //left
  fill(255);
  tactilel();
  fill(255);
  circle(50, 30, 50);
  fill(0);
  triangle(30, 30, 60, 50, 60, 10);

}
  //white
  void r1(int x, int y) {
    noStroke();
    int c = 0;
    for (int i=100; i>10; i-=20) {
      if (c%2==0)fill(255);
      else {
        fill(0);
      }
      rect(x, y, i, i);
      c++;
    }
  }
  //dark
  void r2(int x, int y) {
    noStroke();
    int c = 0;
    for (int i=100; i>10; i-=20) {
      if (c%2==0)fill(0);
      else {
        fill(255);
      }
      rect(x, y, i, i);
      c++;
    }
  }
