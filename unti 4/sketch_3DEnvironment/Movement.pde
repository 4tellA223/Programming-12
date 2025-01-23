void move() {
  pushMatrix();
  //KEY CONTROL
  if (wkey && canMoveForward() ) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey && canMoveBack()) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey && canMoveLeft()) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey && canMoveRight()) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX) *0.01;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;
  }
  
  if(upkey){
    Bullet b = new Bullet();
    objects.add(b);
  }

  focusX = eyeX + cos(leftRightHeadAngle)*300 ;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300 ;


  // MOUSE CONTROLING FOCAL POINTS
  //leftRightHeadAngle( = leftRightHeadAngle +(mouseX - pmouseX)*0.01;
  //upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }

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


boolean canMoveRight() {
  float righty, rightx, rightz;
  int mapx, mapy;

  righty = eyeY;
  rightx = eyeX + cos(leftRightHeadAngle + radians(90)) * 200;
  rightz = eyeZ + sin(leftRightHeadAngle + radians(90)) * 200;

  mapx = int(rightx + 2000) / gridSize;
  mapy = int(rightz + 2000) / gridSize;
  if (map.get(mapx, mapy) == white ) {
    return true;
  }
  return false;
}
boolean canMoveLeft() {
  float lefty, leftx, leftz;
  int mapx, mapy;

  lefty = eyeY;
  leftx = eyeX + cos(leftRightHeadAngle - radians(90)) * 200;
  leftz = eyeZ + sin(leftRightHeadAngle - radians(90)) * 200;

  mapx = int(leftx + 2000) / gridSize;
  mapy = int(leftz + 2000) / gridSize;
  if (map.get(mapx, mapy) == white ) {
    return true;
  }
  return false;
}


boolean canMoveBack() {
  float backx, backy, backz;
  int mapx, mapy;

  backy = eyeY;
  backx = eyeX + cos(leftRightHeadAngle - radians(180)) * 200;
  backz = eyeZ + sin(leftRightHeadAngle - radians(180)) * 200;

  mapx = int(backx + 2000 ) / gridSize ;
  mapy = int(backz + 2000) / gridSize;

  if (map.get(mapx, mapy) == white  ) {
    return true;
  }
  return false;
}
