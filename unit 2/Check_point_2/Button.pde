//instance var
color lightblue = #00CEFF;
color darkblue = #0C7993;
 boolean mouseReleased,wasPressed;
color lightpink = #F098E4;
PImage U;
color darkpink = #C65EB9;

Button a ,b;

void setup(){
size(400,800);
  U = loadImage("U.png");
background(0);
a = new Button("BLUE",200,200,250,200,darkblue,lightblue);
b = new Button(U,200,500,250,200,darkpink,lightpink);

}
void draw(){
  click();
a.show();
b.show();
}
