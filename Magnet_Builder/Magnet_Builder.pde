import g4p_controls.*;
import processing.sound.*;

//SOUND FILES
SoundFile breakSound;
SoundFile connectSound;
SoundFile placeSound;
SoundFile releaseSound;

ArrayList<Magnet> shapeList = new ArrayList<Magnet>();
ArrayList<Connector> cList = new ArrayList<Connector>();
boolean canDrag = false;
String shapeChoice = "";
float i;
int pos = 80;
int indexWithMinDist = -1;
int RADIUS = 30;

//COLOURS
color white = color(255);
color red = color(255, 0, 0);
color orange = color(255, 69, 0);
color yellow = color(255, 215, 0);
color green = color(50, 205, 50);
color blue = color(0, 0, 255);
color purple = color(148, 0, 211);
color pink = color(255, 0, 255);
color grey = color(192, 192, 192);

color shapeColor = grey;
String colourChoice = "";

//VARIABLES FOR DOUBLE CLICK
int click = 0;
long clickTime1 = 0;
boolean doubleClicked = false;
boolean hasSelected = false;



void setup() {
  size(900, 700);
  createGUI();
  breakSound = new SoundFile(this, "BreakSound.mp3");
  connectSound = new SoundFile(this, "Connect Sound.mp3");
  placeSound = new SoundFile(this, "Place Sound.mp3");
  releaseSound = new SoundFile(this, "Release Sound.mp3");
}

void draw() {
  background(0);
  fill(255);
  rect(20, 550, 580, 130);
  fill(0);
  rect(22, 552, 576, 126);
  cList = new ArrayList<Connector>();

  if (indexWithMinDist != -1) {  //for moving the magnets
    shapeList.get(indexWithMinDist).x = mouseX;
    shapeList.get(indexWithMinDist).y = mouseY;
  }
  try {
    for (Magnet mg : shapeList) {

      mg.placeConnectors();

      if (shapeList.indexOf(mg) == indexWithMinDist) 
        fill(mg.colour, 80);
      else {
        for (Connector C : mg.Connectors) {
          fill(255);
          circle(C.x, C.y, 3);
          cList.add(C);
          fill(mg.colour);    
        }
      }
     
      for (Connector C : cList) {   //Make the magnets snap to each other
        for (Connector C2 : cList) {
          if ( C.ID != C2.ID && sqrt(pow(C.x - C2.x, 2) + pow(C.y - C2.y, 2)) < 25) { 
            if (shapeList.get(C.ID).locked == false)
              C.snapTo(C2);
            break;
          }
        }
      }


      if (mg.isSelected) {
        stroke(255);
        strokeWeight(4);
      }

      polygon(mg.x, mg.y, mg.size, mg.rotation, mg.shape); // draws the magnets
      noStroke();
    }
  }
  catch (Exception e) {
  }
}

//DRAWING SHAPE 
void polygon(float x, float y, float r, float rotation, int points) {
  float angle = TWO_PI / points;
  beginShape();
  if (points == 3) {
    i = 6;
    r = 22;
  }
  if (points == 4) {
    i = 4;
    r = 28;
  }
  if (points == 5) {
    i = 3.3;
    r = 34;
  }
  if (points == 6) {
    i = 3;
    r = 40;
  }
  for (float a = (PI/i) + rotation; a <= (TWO_PI) + rotation; a += angle) {
    float sx = x + cos(a) * r;
    float sy = y + sin(a) * r;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


void mousePressed() {
  click++;
  long curTime = System.currentTimeMillis();

  if (click == 1) {
    clickTime1 = curTime;
    doubleClicked = false;
  }

  if (click == 2) {  // when double clicked
    if (System.currentTimeMillis() - clickTime1 < 500) {
      doubleClicked = true;
      click = 0;
    } else {
      clickTime1 = curTime;
      doubleClicked = false;
      click = 1;
    }
  }

  if (!doubleClicked) {
    for (Magnet mg : shapeList)
      mg.isSelected = false;
  }

  if (shapeList.size() < 1) 
    return;

  // find distance between mouse pressed position and shape (makes sures the cursor is in the shape when dragging it)
  indexWithMinDist = 0;
  double minDist = 100000;
  for (int i = 0; i < shapeList.size(); i++) {
    double dist = sqrt(pow(mouseX - shapeList.get(i).x, 2) + pow(mouseY - shapeList.get(i).y, 2));
    if (dist < minDist) {
      indexWithMinDist = i;
      minDist = dist;
    }
  }

  double inRange = sqrt(pow(mouseX - shapeList.get(indexWithMinDist).x, 2) + pow(mouseY - shapeList.get(indexWithMinDist).y, 2));
  if (inRange < RADIUS) {
    shapeList.get(indexWithMinDist).x = mouseX;
    shapeList.get(indexWithMinDist).y = mouseY;
    shapeList.get(indexWithMinDist).locked = false;
  } else {
    indexWithMinDist = -1;
  }
}

void mouseReleased() {
  if (doubleClicked && indexWithMinDist != -1) {
    hasSelected = true;
    shapeList.get(indexWithMinDist).isSelected = true;
  } else {
    hasSelected = false;
    releaseSound.jump(1);
    releaseSound.amp(0.2);
  }
  indexWithMinDist = -1;
}
