//instance var
color lightblue = #00CEFF;
color darkblue = #0C7993;

color lightpink = #F098E4;

color darkpink = #C65EB9;

Button a ,b;

void setup(){
size(800,800);
background(0);
a = new Button("BLUE",200,200,250,200,darkblue,lightblue);
b = new Button("PINK",200,500,250,200,darkpink,lightpink);
}
void draw(){
a.show();
b.show();
}
