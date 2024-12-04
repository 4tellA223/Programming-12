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

      if (c == green) {   //GROUND
        b.setFillColor(green);
        b.setName("ground");
        world.add(b);
      }
    }
  }
}
