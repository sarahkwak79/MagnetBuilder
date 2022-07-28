class Magnet {
  // FIELDS
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

  // CONSTRUCTORS
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

  void placeConnectors() {
    Connectors = new ArrayList<Connector>(); 
    float angle = TWO_PI / this.shape;
    int r = 1;
    float r2 = 1;
    float j = 1;

    if (this.shape == 3) {
      j = 6;
      r = 23;
      r2 = 12;
    }
    if (this.shape == 4) {
      j = 4;
      r = 27;
      r2 = 20;
    }
    if (this.shape == 5) {
      j = 3.3;
      r = 34;
      r2 = 28;
    }
    if (this.shape == 6) {
      j = 3;
      r = 40;
      r2 = 35;
    }
    for (float a = (PI/j)+this.rotation; a <= (TWO_PI)+this.rotation; a += angle) {
      float sx = x + (cos(a + (angle/2)) * r2);
      float sy = y + (sin(a + (angle/2)) * r2);
      Connectors.add(new Connector((PI/j) + this.rotation, 20, this.ID, sx, sy, this.shape));
    }
  }
}
