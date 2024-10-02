int MODE;
final int PATTERN1 = 1;
final int PATTERN2 = 2;
final int PATTERN3 = 3;
int pink = #C97C9D;
int green = #4BB294;
int blue = #8EACCD;
void setup() {
  size(800, 800);
  MODE = PATTERN3;
  rectMode(CENTER);
  
  
}



void draw() {
 
   if (MODE == PATTERN1) {
    pattern1();
  } else if (MODE == PATTERN2) {
    pattern2();
  } else if (MODE ==PATTERN3) {
    pattern3();
  } else {
    println("ERROR: MODE DNE, MODE + "+MODE);
  }
}
