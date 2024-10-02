boolean day, night;
int daytime =#1AC0FF;
int nighttime = #13195D;
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


  if (night && !day) {
    moon(moonY);
    moonY-=1;
    if (moonY<-50) {
      moonY =550;
      night = !night;
      day = true;
    }
  }
  if(day && !night){
    sun(sunY);
    sunY-=1;
      if(sunY<-50){
        sunY = 550;
        night = day;
        day = false;
      }
  }
  fill(#06763B);
  rect(0, 500, 800, 800);
  house();
}


void house() {
 stroke(0);
 fill(#0A74CE);
  rect(300, 400, 400, 300);
  fill(#CE0A3B);
  triangle(250, 400, 500, 300, 750, 400);
  fill(#0ACEC9);
  ellipse(400,450,100,30);
  strokeWeight(1);
  fill(#CE8A0A);
  rect(500,620,40,80);
   
  line(400,435,400,465);
  int y =450;
  line(350,y,450,y);
}

void moon(float moonY) {
  noStroke();
  fill(#CBC14C);
  circle(100, moonY, 50);
  fill(nighttime);
  circle(120, moonY, 50);
}
void sun(float sunY){
  stroke(0);
  fill(#F7B73E);
  circle(100,sunY,50);
}
