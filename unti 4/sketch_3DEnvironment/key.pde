void keyPressed() {
  if (key == 'w' || key =='W') wkey = true;
  if (key == 'a' || key =='A')akey = true;
  if (key == 'd' || key =='D')dkey = true;
  if (key == 's' || key =='S')skey = true;
  if (key == ' ') upkey =true;
}

void keyReleased() {
  if (key == 'w' || key =='W')wkey = false;
  if (key == 'a' || key =='A')akey = false;
  if (key == 'd' || key =='D')dkey = !true;
  if (key == 's' || key =='S')skey = false;
  if (key == ' ') upkey = !true;
}
