import processing.serial.*;
import processing.opengl.*;

// Jelani Woods
// Based off code by username kevinphys on github
import damkjer.ocd.*;
Camera camera;
UFO ufo;
Gaia earth;

Serial serial;
           
int sen = 3; // sensors
int div = 3; // board sub divisions

Normalize n[] = new Normalize[sen];
MomentumAverage cams[] = new MomentumAverage[sen];
MomentumAverage axyz[] = new MomentumAverage[sen];
float[] nxyz = new float[sen];
int[] ixyz = new int[sen];
int x, y, z;

float w; // board size
boolean[] flip = {
  false, true, false};

int player = 0;


PFont font;

void setup() {
  size(displayWidth, displayHeight, P3D); //OPENGL
  frameRate(30);
  
  w = displayHeight;
  font = createFont("Georgia", 32);
  textFont(font);
  textMode(SHAPE);
  
  println(Serial.list());
  serial = new Serial(this, Serial.list()[0], 115200);
  
  for(int i = 0; i < sen; i++) {
    n[i] = new Normalize();
    cams[i] = new MomentumAverage(.01);
    axyz[i] = new MomentumAverage(.13);
  }
  
  reset();
  
  //abduction
  camera = new Camera(this, 1.45 * displayHeight, 1.35 * displayHeight, 1.35 * displayHeight, 
                            0, 0, -0.25 * displayHeight);
  camera.roll(radians(-65));
  
  restartGame();
}

void draw() {
  updateSerial();
  
  background(255);
  
  if(mousePressed && mouseButton == LEFT)
    msg("defining boundaries");
    
  ufo.update(getXYZ());
  earth.update();
  camera.feed();
}

void updateSerial() {
  String cur = serial.readStringUntil('\n');
  if(cur != null) {
    //println(cur);
    String[] parts = split(cur, " ");
    if(parts.length == sen  ) {
      float[] xyz = new float[sen];
      for(int i = 0; i < sen; i++) {
        xyz[i] = float(parts[i]);
        println(xyz[i] + "* *");
        if (i == 1) 
          xyz[i] -= 150;
      }
  
      if(mousePressed && mouseButton == LEFT)
        for(int i = 0; i < sen; i++)
          n[i].note(xyz[i]);
  
      nxyz = new float[sen];
      for(int i = 0; i < sen; i++) {
        float raw = n[i].choose(xyz[i]);
        nxyz[i] = flip[i] ? 1 - raw : raw;
        cams[i].note(nxyz[i]);
        axyz[i].note(nxyz[i]);
        ixyz[i] = getPosition(axyz[i].avg);
      }
    }
  }
}

float cutoff = .2;
int getPosition(float x) {
  if(div == 3) {
    if(x < cutoff)
      return 0;
    if(x < 1 - cutoff)
      return 1;
    else
      return 2;
  } 
  else {
    return x == 1 ? div - 1 : (int) x * div;
  }
}

PVector getXYZ() {
  float h = w / 2;
  float sw = w / div; // == w/3


  float sd = sw * (div - 1);// == 2w/3
  
  
  PVector axyzVector = new PVector(
      axyz[0].avg * sd - w/5.5,  // ax * 2w/3
      axyz[2].avg * sd - w/1.1,
      -axyz[1].avg * sd + w/2.5);
  
  PVector movedOrgin = new PVector(w/4, w, w/3);
  axyzVector.add(movedOrgin);
  
  return axyzVector;
}

void restartGame(){
  ufo = new UFO(displayHeight/8);
  earth = new Gaia(ufo, displayHeight);
}

void mousePressed() {
  if(mouseButton == RIGHT){
    reset();
    if(ufo.hp == 0)
      restartGame();
  }
}

// test controls w/out 3D controller
//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == UP) {
//      y += 1;
//    }
//    else if(keyCode == LEFT) {
//      x -=1;
//    }
    
//    else if (keyCode == DOWN) {
//      y -= 1;
//    } 
//  } else {
//    x+= 1;
//  }
//}

void reset() {
  for(int i = 0; i < sen; i++) {
    n[i].reset();
    cams[i].reset();
    axyz[i].reset();
  }
}

void msg(String msg) {
  println(msg);
}