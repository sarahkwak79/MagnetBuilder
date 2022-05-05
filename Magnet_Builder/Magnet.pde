class Magnet {
  // fields
  int shape; //number of sides
  color colour;
  int size;  //radius in polygon
  float rotation;
  int numConnectors;
  ArrayList <Connector> Connectors = new ArrayList<Connector>();
  int x;
  int y;
  boolean isSelected;
  int ID;
  boolean locked;

  // constructor
  Magnet(int x, int y, int size, float r, int shape, color shapeColor) {

    this.shape = shape;
    this.size = size;
    this.rotation = r;
    this.x = x;
    this.y = y;
    this.colour = shapeColor;
    this.isSelected = false;
    this.locked = false;

    this.ID = shapeList.size();
  }


  // methods
  
  //void scrubList() {
  //  Connectors = new ArrayList<Connector>(); 
  //}

   void placeConnectors() {
    Connectors = new ArrayList<Connector>(); 
    float angle = TWO_PI / this.shape;
    float r2 = 1;
    float j = 1;
      
      if (this.shape == 3) {
        j = 6;
        r2 = 12;
      }
      if (this.shape == 4) {
        j = 4;
        r2 = 20;
      }
      if (this.shape == 5) {
        j = 3.3;
        r2 = 28;
      }
      if (this.shape == 6) {
        j = 3;
        r2 = 35;
      }
      float rotationCounter = 0;
      for (float a = (PI/j)+this.rotation; a <= (TWO_PI)+this.rotation; a += angle) {
        float sx = x + (cos(a + (angle/2)) * r2);
        float sy = y + (sin(a + (angle/2)) * r2);
        
        Connectors.add(new Connector(this.rotation + rotationCounter, 20, this.ID, sx, sy, this.shape)); //(PI/j) + 
        
        rotationCounter += TWO_PI/this.shape;

      }
    
  }

  void place() {
  }
  
  //void getConnectors() {
  //  return Connectors;
  //}


  //void drawMagnets() {
  //  for (Magnet m : magnets) {
  //    fill(m.colour);
  //    rect(m.x, m.y, m.size, m.size);
  //  }
  //}
}
