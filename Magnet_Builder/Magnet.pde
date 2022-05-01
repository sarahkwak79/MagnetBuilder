class Magnet {
 // fields
 int shape; //number of sides
 color colour;
 int size;  //radius in polygon
 int rotation;
 int numConnectors;
 ArrayList <Connector> Connectors;
 int x;
 int y;
 boolean isSelected;
 
 // constructor
 Magnet(int x, int y, int size, int r, int shape, color shapeColor){
   
   this.shape = shape;
   this.size = size;
   this.rotation = r;
   this.x = x;
   this.y = y;
   this.colour = shapeColor;
   this.isSelected = false;
   
   //ArrayList<Connector> Connectors = new ArrayList(n);
 }
 
 
 // methods
  
  void place() {
    
  }
  //void drawMagnets() {
  //  for (Magnet m : magnets) {
  //    fill(m.colour);
  //    rect(m.x, m.y, m.size, m.size);
  //  }
  //}
  
}
