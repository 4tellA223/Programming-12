// +====================================DRAW MAP()===================================

void drawMap() {
  for (int x = 0; x< map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if ( c == dullBlue) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, walls, walls, walls, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, walls, walls, walls, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, walls, walls, walls, gridSize);
      }
      if ( c == brown) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, logTop, logTop, logSide, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, logTop, logTop, logSide, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, logTop, logTop, logSide, gridSize);
      }if( c == red){
        texturedCube1(x*gridSize-2000, height, y*gridSize-2000 ,"e7a88e87-ce19-4254-8bb5-41dbf9006f4c-", "png" , gridSize, 10);
      }
    }
  }
}
//====================================================================================================
void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}
//=======================================================================================================
void drawFloor(int Xmin, int Xmax, int lines, int ypoint) {
  stroke(255);
  strokeWeight(1);
  int x = Xmin;
  int z = Xmin;
  while (z < Xmax) {
    texturedCube(x, ypoint, z, oakplank, oakplank, oakplank, lines);
    x += lines;
    if ( x >= Xmax) {
      x = Xmin;
      z += lines;
    }
  }
}

//========================================================
