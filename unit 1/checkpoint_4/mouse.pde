void mousePressed() {
}
void mouseReleased() {
  if (dist(750, 30, mouseX, mouseY)<25) {
    if (MODE<3) {
      MODE ++;
    } else {
      MODE =1;
    }
  }
  if (dist(50, 30, mouseX, mouseY)<25) {
    if (MODE>1) {
      MODE --;
    } else {
      MODE =3;
    }
  }
}
void tactiler() {
  if (dist(750, 30, mouseX, mouseY)<25) {
    stroke(#6D8AF0);
  } else {
    stroke(#000000);
  }
}
void tactilel(){
  if (dist(50, 30, mouseX, mouseY)<25) {
    stroke(#6D8AF0);
  } else {
    stroke(#000000);
  }
}
