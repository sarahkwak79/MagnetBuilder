import g4p_controls.*;
int x = 100;
int y = 100;
boolean canDrag = false;
String shapeChoice = "Red";
float i;
ArrayList<Magnet> shapeList = new ArrayList<Magnet>();
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
  rect(0, 290, 400, 400);
  
  if (indexWithMinDist != -1){
    shapeList.get(indexWithMinDist).x = mouseX;
    shapeList.get(indexWithMinDist).y = mouseY;
  }
  //try {
  for (Magnet mg: shapeList){
    if (shapeList.indexOf(mg) == indexWithMinDist) 
      fill(sky);
    else {
      fill(mg.colour);
      for (Connector C : mg.Connectors) {
        //fill(255);
        rect(C.x, C.y, 3, 3);

    }
    }


    if (mg.isSelected){
      stroke(153);
      strokeWeight(4);
    }
    
    polygon(mg.x, mg.y, mg.size, mg.rotation, mg.shape);
    noStroke();
  }  
  //}
  //catch (Exception e) {
  //}
  
  /*if (canDrag)
    if (shapeChoice.equals("Triangle"))
      polygon(mouseX, mouseY, 50, 0, 3);
      
    if (shapeChoice.equals("Square"))
      polygon(mouseX, mouseY, 50, 0, 4);
      
    if (shapeChoice.equals("Pentagon"))
      polygon(mouseX, mouseY, 50, 0, 5);
      
    if (shapeChoice.equals("Hexagon"))
      polygon(mouseX, mouseY, 50, 0, 6);
    
  else{
    if (shapeChoice.equals("Triangle"))
      polygon(100, 100, 50, 0, 3);
      
    if (shapeChoice.equals("Square"))
      polygon(100, 100, 50, 0, 4);
      
    if (shapeChoice.equals("Pentagon"))
      polygon(100, 100, 50, 0, 5);
      
    if (shapeChoice.equals("Hexagon"))
      polygon(100, 100, 50, 0, 6);
  }
  */
 
}

void polygon(float x, float y, float r, float rotation, int points) {
  float angle = TWO_PI / points;
  beginShape();
  if (points == 3)
    i = 6;
  if (points == 4)
    i = 4;
  if (points == 5)
    i = 3.3;
  if (points == 6)
    i = 3;
  for (float a = PI/i; a < TWO_PI; a += angle) {
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



//void draw(){
//  background(200);
//  for (Magnet m : mainBoard.magnets) {
//    if (m.canDrag) {
//      m.x = mouseX;
//      m.y = mouseY;
//    }
//      //rect(mouseX, mouseY, 50, 50);

//  println(mouseX, mouseY);
//  }
  
//  mainBoard.drawMagnets();
  
//}

//void mousePressed(){
//  System.out.println("click!");
  
//  for (Magnet m : mainBoard.magnets){
//    if (m.x <= mouseX && mouseX <= m.x + 50 && m.y <= mouseY && mouseY <= m.y + 50)  {
//         System.out.println("Can move");
//         m.canDrag = true;
//    }
//    else
//      println("Can not move");
      
//  }
  
//  // create a new magnet and place it at the mouses coordinates 

//  mainBoard.magnets.add( new Magnet ("square", red, 50, 0, 4, mouseX, mouseY));
//  println(mainBoard.magnets);
      
      
      
      
  
//}

//void mouseReleased(){
//  System.out.println("released!");
//  x = mouseX;
//  y = mouseY;
  
//  for (Magnet m : mainBoard.magnets) {
//    m.canDrag = false;
//  }
//}
