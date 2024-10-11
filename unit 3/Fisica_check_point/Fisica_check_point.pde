import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
int cloudX =300;
int vx =5;
int vvx=1;
int cloudX1 =100;
//button
Button a ,b;
boolean mouseReleased,wasPressed;
boolean gravityClick;

//assets
PImage redBird;
PImage dirtImage;

FPoly topPlatform;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();

  //load resources
  redBird = loadImage("red-bird.png");
  dirtImage = loadImage("Minecraft-Dirt.jpg");
  a = new Button("Gravity",200,800,150,100,255,0,gravityClick);

  //initialise world
  if(gravityClick){
  makeWorld();
  }makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  
  //gravity
  if(gravityClick){
  world.setGravity(0, 0);
  }else{
    world.setGravity(0,900);
  }
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(width/2+300, height/2+100);
  bottomPlatform.vertex(width/2+320, height/2+100);
  bottomPlatform.vertex(width/2+320, height/2+300);
  bottomPlatform.vertex(width/2+700, height/2+300);
  bottomPlatform.vertex(width/2+700, height/2+100);
  bottomPlatform.vertex(width/2+720, height/2+100);
  bottomPlatform.vertex(width/2+720, height/2+330);
  bottomPlatform.vertex(width/2+300, height/2+330);
  bottomPlatform.vertex(width/2+300, height/2+100);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);
  if (frameCount % 20 == 0) {  //Every 20 frames ...

    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }
  world.step();  //get box2D to calculate all the forces and new positions

  //background cloud
  fill(255);
  ellipse(cloudX1, 100, 150, 120);
  cloudX1+=vvx;
  if (cloudX1>width+400)cloudX1=-100;

 
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  //front cloud
  ellipse(cloudX, 100, 200, 180);
  cloudX+=vx;
  if (cloudX>width+400)cloudX=-100;
  
  //front button
   click();
   a.show();
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(25, 25);
  box.setPosition(random(width), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

  //set visual
  image(dirtImage, 0, 0);
  dirtImage.resize(25, 25);
  box.attachImage(dirtImage);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}

//====================================================================================================
