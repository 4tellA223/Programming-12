void mouseReleased() {
  if (a.touchingMouse() && g==900) {
    g = 0;
  }
  if (a.touchingMouse() && g==0) {
    g= 900;
  }
  if(b.touchingMouse()){
    Fbody = !Fbody;
  }
}
