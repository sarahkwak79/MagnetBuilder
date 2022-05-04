import g4p_controls.*;
int x = 100;
int y = 100;
boolean canDrag = false;
String shapeChoice = "Red";
float i;
ArrayList<Magnet> shapeList = new ArrayList<Magnet>();
ArrayList<Connector> cList = new ArrayList<Connector>();
int pos = 30;
int indexWithMinDist = -1;
final int RADIUS = 20;
color sky = color(66, 245, 209);
color yellow = color(245, 239, 66);
color white = color(255, 255, 255);
color red = color(255, 0, 0);
color orange = color(225, 165, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color purple = color(70, 255, 130);
color shapeColor = red;
int click = 0;
long clickTime1 = 0;
boolean doubleClicked = false;
boolean hasSelected = false;

String colourChoice = "";


void setup(){
  size(400, 400);
  createGUI();
}



void draw(){
  background(0);
  fill(255);
  cList = new ArrayList<Connector>();
  //rect(0, 290, 400, 400);
  
  if (indexWithMinDist != -1){
    shapeList.get(indexWithMinDist).x = mouseX;
    shapeList.get(indexWithMinDist).y = mouseY;
  }
  //try {
  for (Magnet mg: shapeList){

    mg.placeConnectors();
    
    if (shapeList.indexOf(mg) == indexWithMinDist) 
      fill(sky);
    else {
    for (Connector C : mg.Connectors) {
        fill(255);
        circle(C.x, C.y, 3);
        cList.add(C);
        fill(mg.colour);
        //for (Connector C2 : mg.Connectors) {
        //  //println("loop");
        //  //println(C.x, C2.x, C.y, C2.y);
        //  if (C.x <= C2.x && C2.x <= C.x + 50 && C.y <= C2.y && C.y <= C.y + 50 && C.ID != C2.ID) {
        //    println("close");
        //  }

        //}
      }
      //println(mg.Connectors);
      //fill(255);
    }
    //println(cList);
    for (Connector C : cList) {
        for (Connector C2 : cList) {
          //println(C.x, C2.x, C.y, C2.y);
          //println(C.ID, C2.ID);
          if (C.x <= C2.x && C2.x <= C.x + 10 && C.y <= C2.y && C2.y <= C.y + 10 && C.ID != C2.ID) {
            if (shapeList.get(C.ID).locked == false)
              C.snapTo(C2);
            break;
          }
        }
      }
      
    //}


    if (mg.isSelected){
      stroke(153);
      strokeWeight(4);
    }
    
    polygon(mg.x, mg.y, mg.size, mg.rotation, mg.shape);
    noStroke();
  //}
  //catch (Exception e) {
  }
 
}

void polygon(float x, float y, float r, float rotation, int points) {
  float angle = TWO_PI / points;
  beginShape();
  if (points == 3){
    i = 6;
    r = 22;
  }
  if (points == 4){
    i = 4;
    r = 28;
  }
  if (points == 5){
    i = 3.3;
    r = 34;
  }
  if (points == 6){
    i = 3;
    r = 40;
  }
  for (float a = (PI/i) + rotation; a < (TWO_PI) + rotation; a += angle) {
    float sx = x + cos(a) * r;
    float sy = y + sin(a) * r;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void mousePressed(){
  println(mouseX + " " + mouseY);
  
    click++;
  long curTime = System.currentTimeMillis();
  if (click == 1){
    clickTime1 = curTime;
    doubleClicked = false;
  }
  if (click == 2){
    if (System.currentTimeMillis() - clickTime1 < 500){
       doubleClicked = true;
       click = 0;
    }else {
      clickTime1 = curTime;
      doubleClicked = false;
      click = 1;
    }
  }
 
  if (!doubleClicked && mouseY < 290){
    for(Magnet mg: shapeList)
      mg.isSelected = false;
  }
 
  if (shapeList.size() < 1) return;
  indexWithMinDist = 0;
  double minDist = 100000;
  for (int i = 0; i < shapeList.size(); i++){
    double dist = Math.sqrt(Math.pow(mouseX - shapeList.get(i).x, 2) 
                  + Math.pow(mouseY - shapeList.get(i).y, 2));
    if (dist < minDist){
      indexWithMinDist = i;
      minDist = dist;
    }
  }
  double inRange = Math.sqrt(Math.pow(mouseX - shapeList.get(indexWithMinDist).x, 2) 
                  + Math.pow(mouseY - shapeList.get(indexWithMinDist).y, 2));
  println(inRange + " " + RADIUS + " " + (inRange < RADIUS));
  if (inRange < RADIUS){
    println("Set x and y as mouse position");
    shapeList.get(indexWithMinDist).x = mouseX;
    shapeList.get(indexWithMinDist).y = mouseY;
    shapeList.get(indexWithMinDist).locked = false;
  } else {
    indexWithMinDist = -1;
  }
  /*
  if (x <= mouseX && mouseX <= x + 50 && y <= mouseY && mouseY <= y + 50)  {
       System.out.println("Can move");
       canDrag = true;
  } else
      println("Can not move");
  */
}

void mouseReleased(){
  if (doubleClicked && indexWithMinDist != -1){
    hasSelected = true;
    shapeList.get(indexWithMinDist).isSelected = true;
  } else {
    hasSelected = false;
  }
  indexWithMinDist = -1;
  
  
  //x = mouseX;
  //y = mouseY;
  //canDrag = false;
}

Board mainBoard = new Board();

