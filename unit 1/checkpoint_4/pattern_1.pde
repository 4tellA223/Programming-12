void pattern1() {
  background(pink);



  fill(255);
  int xcp =0;
  int ycp= 0;
  while (ycp<900) {
    while (xcp<900) {
      cp(xcp, ycp);
      xcp+=100;
    }
    ycp+=100;
    xcp = 0;
  }
  //right
  tactiler();
  fill(255);
  circle(750, 30, 50);
  fill(0, 0, 0);
  triangle(740, 10, 740, 50, 770, 30);


  //left
  fill(255);
  tactilel();
  fill(255);
  circle(50, 30, 50);
  fill(0);
  triangle(30, 30, 60, 50, 60, 10);
}
void cp(int x, int y) {
  noStroke();
  int count=1;
  for (int i = 150; i>0; i-=20) {
    if (count == 1) {
      fill(#16423C);
    } else if (count ==2) {
      fill(#6A9C89);
    } else if (count == 3) {
      fill(#C4DAD2);
    } else if (count == 4) {

      fill(#E9EFEC);
    }

    circle(x, y, i);
    if (count<4) {
      count++;
    } else {
      count =1;
    }
  }
}
