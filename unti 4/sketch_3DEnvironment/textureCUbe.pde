void texturedCube(int x, int y, int z, PImage a, PImage b, PImage c, int s) {
  pushMatrix();
  translate(x,y,z);
  scale(s);
  //rotateX(rotx);
  //rotateY(roty);

  noStroke();


  beginShape();
  texture(a);

  //top
  // vx x,y,z,tx,ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  endShape();

  beginShape();
  texture(b);
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape();


  beginShape(QUADS);
  texture(c);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 1, 1, 0, 1);

  endShape();
  popMatrix();
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;
  fwdx = eyeX + cos(leftRightHeadAngle) * 200;
  fwdy = eyeY ;
  fwdz = eyeZ + sin(leftRightHeadAngle) * 200;

  mapx = int(fwdx + 2000) / gridSize;
  mapy = int(fwdz + 2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  }

  return false;
}
