void keyPressed() {

  if ((key== 'a' ||key == 'A') && p1Timer > 0)akey =true;


  if (keyCode == RIGHT && p2Timer > 0)rkey =true;
}
void keyReleased() {
  if (key== 'a' ||key == 'A') {
    akey =false;
    p1Timer =3;
  }
  if (keyCode == RIGHT) {
    rkey =false;
    p2Timer =3;
  }
}
