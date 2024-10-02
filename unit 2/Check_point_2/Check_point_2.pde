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
    touchingRect();
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);


    textAlign(CENTER, CENTER);
    textChange();
    textSize(w/4);
    text(text, x, y);



    if(mouseReleased && mouseX>x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY< y+h/2){
    clicked = true;
    }else{
     clicked =false;
    }
  }

  void touchingRect() {
    //rect
    rectMode(CENTER);
    if (mouseX >x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY< y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
  }
  void textChange() {
    if (mouseX >x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY< y+h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
  }
  
  
}
