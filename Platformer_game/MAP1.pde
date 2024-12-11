void mapA(PImage img) {
  loadAWorld(img);
}
//===========================================================================
void loadAWorld(PImage img) {

  //CREATE MAP
  for (int  y = 0; y<img.height; y++) {
    for (int x = 0; x < img.width; x++ ) {

      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setNoStroke();
      b.setStatic(true);
      b.setGrabbable(false);
      b.setFriction(46);

      color c = img.get(x, y); //color of current pixel
      color s = img.get(x, y+1); // color below current pixel
      color w = img.get(x-1, y); // color west of current pixel
      color e = img.get(x+1, y); //color east of current pixel
      color n = img.get(x, y-1); //color ontop of current pixel

      if (c == grass && n != grass) {   //GROUND TOP
        b.attachImage(grasstop);
        b.setName("ground");
        world.add(b);
      } else if (c == grass && n == grass) { //GROUND BOTTOM
        b.attachImage(grassbottom);
        b.setName("wall");
        world.add(b);
      }else if(c == blueCuphead){ //npc cuphead
        FMughead mgh = new FMughead(x*gridSize,y*gridSize);
        npc.add(mgh);
        world.add(mgh);
      }else if(c == spike){//spikes
        b.attachImage(spikes);
        b.setName("spikes");
        world.add(b);
      }
    }
  }
}

//void drawBG(PImage img) {
//  float xoff = map(player.getX(), 0, 64*gridSize, 300, 0);
//  println(xoff);
//  float yoff = map(player.getY(), 0, 64*gridSize, 300, 0);
//  image(img, int(xoff-500), int(yoff-450));
//}
