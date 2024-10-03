class Button {
  // instance var
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;


  //construct
  Button(String t, int x1, int y1, int w1, int h1, color norm, color high) {
    x =x1;
    y = y1;
    w = w1;
    h= h1;
    highlight = high;
    normal = norm;
    text = t;
    clicked = false;

    //behaving function
  }
  void show() {
    drawButton();
    drawLabel();
  }


  boolean touchingMouse() {
    return mouseX> x-w/2 && mouseX<x+w/2 && mouseY > y-h/2 && mouseY< y+h/2;
  }


  void drawButton() {
    rectMode(CENTER);
    stroke(0);
    strokeWeight(4);
    if (touchingMouse()) {
      fill(highlight);
    } else {
      fill(normal);
    }
    rect(x, y, w, h, 30);
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
    textSize(w/4);
    if (touchingMouse()) {

      fill(normal);
    } else {
      fill(highlight);
    }
    text(text, x, y);
  }
}
