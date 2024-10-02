// Estella Hezheng
//blcok 1-4 sep5
void setup() {
  size(800, 800);
  background(#4D83F5);
}
void draw() {
  strokeWeight(1);

  //SUN
  fill(#F5C54D);
  circle(200,200,100);
  //grass
  fill(#367106);
  rect(0,600,800,800);
  //house
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
  
  //trees
    //trunk
    rect(150,500,40,140);
    //leaves
    fill(#5AA51E);
    int leaveX = 150;
    int leaveY = 400;
    
      strokeWeight(0);
    circle(leaveX,leaveY,80);
     circle(leaveX+40,leaveY+30,80);
 circle(leaveX+20,leaveY+50,80);
     circle(leaveX+70,leaveY+60,80);
     circle(leaveX+90,leaveY+30,80);
     circle(leaveX+100,leaveY+80,80);
     circle(leaveX+40,leaveY+90,80);
     circle(leaveX-40,leaveY+30,80);
     circle(leaveX+10,leaveY+80,80);
     
     
   
  
}
