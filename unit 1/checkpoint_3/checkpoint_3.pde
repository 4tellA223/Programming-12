boolean day, night;
int daytime =#1AC0FF;
int nighttime =#0A99A7;
float moonY = 100;
float sunY = 500;
void setup() {
  size(800, 800);
  night =true;
  day = false;
}
void draw() {
  if (day) {
    background(daytime);
  } else {
    background(nighttime);
  }
  strokeWeight(1);



  //house

  fill(#06763B);
  rect(0, 500, 800, 800);
  usagi(300, 300);
 
}




void usagi(int x, int y) {
  pushMatrix();
  
  
  fill(#F7DEA7);
  ellipse(x+20, y+5, 230, 180);
  mouth(x, y);
  
  translate(x, y);
  eyeBrows();
  
  translate(x-314, y-305);
  eyes();
  
  translate(x-245, y-300);
  eyes();

  ears();
  translate(x-355,y-300);
  ears();

  popMatrix();
}

void eyes() {
  pushMatrix();
  //meimao(r
  fill(#050505);
  circle(0, 0, 20);
  fill(#FFFFFF);
  circle(5, 4, 8);
  popMatrix();
}
void mouth(int x, int y) {
  fill(0, 0, 0);
  strokeWeight(3);
  stroke(1);
  line (x+10, y+20, x+30, y+25);
  line (x+30, y+20, x+10, y+25);
}
void ears() {
  pushMatrix();
  strokeWeight(0);
  fill(#F7DEA7);
  ellipse(0, -110, 30, 100);
  fill(#F7A7F6);
  ellipse(0, -110, 10, 60);
  //fill(#F7DEA7);
  // ellipse(x+30,y-110,30,100);
  //  fill(#F7A7F6);
  //  ellipse(x+30,y-110,10,60);
  popMatrix();
}
void eyeBrows() {
  fill(0, 0, 0);
  ellipse(43, -25, 51, 60);
  fill(#F7DEA7);
  noStroke();
  ellipse(-7+45, -20, 65, 65);


  //meimao(l
  fill(0, 0, 0);
  ellipse(-30, -20, 51, 60);
  fill(#F7DEA7);
  noStroke();
  ellipse(-23, -15, 65, 65);
}
