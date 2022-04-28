import g4p_controls.*;

int x = 100;
int y = 100;
boolean canDrag = false;

void setup() {
  size(1200,500);
  createGUI();
}


void draw(){
  background(0);
    
  if (canDrag)
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
 
}

void polygon(float x, float y, float radius, float rotation, int points) {
  float angle = TWO_PI / points;
  beginShape();
  if (shapeChoice.equals("Triangle"))
    i = 6;
  if (shapeChoice.equals("Square"))
    i = 4;
  if (shapeChoice.equals("Pentagon"))
    i = 3.3;
  if (shapeChoice.equals("Hexagon"))
    i = 3;
  for (float a = PI/i; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


//void draw(){
  //background(200);
  
  //if (canDrag)
      //rect(mouseX, mouseY, 50, 50);
  //else
      //rect(x, y, 50, 50);
  //println(mouseX, mouseY);
}

void mousePressed(){
  System.out.println("click!");
  if (x <= mouseX && mouseX <= x + 50 && y <= mouseY && mouseY <= y + 50)  {
       System.out.println("Can move");
       canDrag = true;
  } else
      println("Can not move");
      
  // create a new magnet and place it at the mouses coordinates    
      
      
      
      
  
}

void mouseReleased(){
  System.out.println("released!");
  x = mouseX;
  y = mouseY;
  canDrag = false;
}



