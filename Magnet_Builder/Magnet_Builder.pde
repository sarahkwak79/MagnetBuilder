int x = 100;
int y = 100;
boolean canDrag = false;


void setup(){
  size(400, 400);
}


void draw(){
  background(0);
  
  if (canDrag)
      rect(mouseX, mouseY, 50, 50);
  else
      rect(x, y, 50, 50);
  //println(mouseX, mouseY);
}

void mousePressed(){
  System.out.println("click!");
  if (x <= mouseX && mouseX <= x + 50 && y <= mouseY && mouseY <= y + 50)  {
       System.out.println("Can move");
       canDrag = true;
  } else
      println("Can not move");
}

void mouseReleased(){
  System.out.println("released!");
  x = mouseX;
  y = mouseY;
  canDrag = false;
}


