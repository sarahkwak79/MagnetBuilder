import g4p_controls.*;
int x = 100;
int y = 100;
boolean canDrag = false;
String shapeChoice = "";
float i;
ArrayList<Magnet> shapeList = new ArrayList<Magnet>();
int pos = 30;
int indexWithMinDist = -1;

void setup(){
  size(400, 400);
  createGUI();
}

void draw(){
  background(0);
  if (indexWithMinDist != -1){
    shapeList.get(indexWithMinDist).x = mouseX;
    shapeList.get(indexWithMinDist).y = mouseY;
  }
  for (Magnet mg: shapeList){
    polygon(mg.x, mg.y, mg.size, mg.rotation, mg.shape);
  }  
  
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

void polygon(float x, float y, float radius, float rotation, int sides) {
  float angle = TWO_PI / sides;
  beginShape();
  if (sides == 3)
    i = 6;
  if (sides == 4)
    i = 4;
  if (sides == 5)
    i = 3.3;
  if (sides == 6)
    i = 3;
  for (float a = PI/i; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void mousePressed(){
  if (shapeList.size() < 1) return;
  System.out.println("click!");
  indexWithMinDist = 0;
  double minDist = 100000;
  for (int i = 0; i < shapeList.size(); i++){
    double dist = sqrt(pow(mouseX - shapeList.get(i).x, 2))
                  + pow(mouseY - shapeList.get(i).y, 2);
    if (dist < minDist){
      indexWithMinDist = i;
      minDist = dist;
    }
  }
  shapeList.get(indexWithMinDist).x = mouseX;
  shapeList.get(indexWithMinDist).y = mouseY;
  /*
  if (x <= mouseX && mouseX <= x + 50 && y <= mouseY && mouseY <= y + 50)  {
       System.out.println("Can move");
       canDrag = true;
  } else
      println("Can not move");
  */
}

void mouseReleased(){
  System.out.println("released!");
  indexWithMinDist = -1;
  //x = mouseX;
  //y = mouseY;
  canDrag = false;
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
