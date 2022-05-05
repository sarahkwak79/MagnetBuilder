class Connector {
  // fields

  float rotation;
  float range;
  int ID;
  float x;
  float y;
  float radius;
  int shape;

  // constructor
  Connector(float rotation, float range, int ID, float x, float y, int points) {

    this.rotation = rotation;
    this.range = range;
    this.ID = ID;
    this.x = x;
    this.y = y;


  }


  // methods
  
   void snapTo(Connector C2) {
    
    float initialRotation = this.rotation;
    float finalRotation = C2.rotation + PI;
    float changeInRotation = (finalRotation - initialRotation);
    
    shapeList.get(this.ID).rotation += changeInRotation;
    
    
    if (shapeList.get(this.ID).locked == false)
      shapeList.get(this.ID).locked = true;
    else 
      shapeList.get(this.ID).locked = false;
      
    shapeList.get(this.ID).placeConnectors();
 
  }
  
  //void detect(ArrayList sl) { // 
  //  //for (Magnet mg : sl) {
  //  //  for (Connector C : mg.Connectors())
  //  //if { // within range
  //  //check if it can be placed
  //  // if yes...
  //  //connect
  //  //change rotation to that of the original magnet
  //  // change rotation of the rest of the shape and other connectors attached
  //   // }  
  //   //}
  //  }
    
    
  //}
  
  void drawConnectors() {
    fill(0,255,0);
    circle(this.x, this.y, 30);
  }
}
