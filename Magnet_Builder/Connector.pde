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
    //Magnet oldMagnet = shapeList.get((C2.ID-1));
    //Magnet newMagnet = new Magnet(oldMagnet.x,oldMagnet.y,oldMagnet.size,oldMagnet.rotation+PI,oldMagnet.shape,oldMagnet.colour);  //shapeList.get(this.ID).rotation;
    //shapeList.remove((C2.ID-1)); 
    //shapeList.add(newMagnet);
    float changeInRotation;
    float initialRotation = this.rotation;
    float twoRotation = C2.rotation;
    
    changeInRotation = (initialRotation - twoRotation);
    
    
    shapeList.get(this.ID).rotation -= 2*changeInRotation;//shapeList.get(C2.ID).rotation;
    
    
    if (shapeList.get(this.ID).locked == false)
      shapeList.get(this.ID).locked = true;
    else 
      shapeList.get(this.ID).locked = false;
      
    println(shapeList.get(this.ID).locked);
    shapeList.get(this.ID).placeConnectors();
    println("snap");
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
