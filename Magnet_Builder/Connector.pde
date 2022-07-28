class Connector {
  // FIELDS
  float rotation;
  float range;
  int ID;
  float x;
  float y;
  float radius;
  int shape;

  // CONSTRUCTORS
  Connector(float rotation, float range, int ID, float x, float y, int points) {

    this.rotation = rotation;
    this.range = range;
    this.ID = ID;
    this.x = x;
    this.y = y;
  }
  
  void snapTo(Connector C2) {
    float changeInRotation;
 
    double d1x = shapeList.get(this.ID).x - this.x;
    double d1y = shapeList.get(this.ID).y - this.y;
    
    double d2x = C2.x - shapeList.get(C2.ID).x;
    double d2y = C2.y - shapeList.get(C2.ID).y;
    
    
    changeInRotation = (float)Math.acos((d1x * d2x + d1y * d2y)/(Math.sqrt(d1x * d1x + d1y * d1y) * Math.sqrt(d2x * d2x + d2y * d2y))) ;
    shapeList.get(this.ID).rotation +=  changeInRotation; //2*changeInRotation;//shapeList.get(C2.ID).rotation;
    
    double dx = C2.x - this.x;
    double dy = C2.y - this.y;
    
    shapeList.get(this.ID).x += dx;
    shapeList.get(this.ID).y += dy;
    
    
    if (shapeList.get(this.ID).locked == false)
      shapeList.get(this.ID).locked = true;
    else 
      shapeList.get(this.ID).locked = false;
      
    println(shapeList.get(this.ID).locked);
    shapeList.get(this.ID).placeConnectors();
    connectSound.jump(1.6);
  }
  
  //Draws the connectors
  void drawConnectors() {
    fill(0,255,0);
    circle(this.x, this.y, 30);
  }
}
