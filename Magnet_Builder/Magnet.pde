class Magnet {
 // fields
 int shape; //number of sides
 color colour;
 int size;  //radius in polygon
 int rotation;
 int numConnectors;
 ArrayList <Connector> Connectors = new ArrayList<Connector>();
 int x;
 int y;
 boolean isSelected;
 int ID;
 
 // constructor
 Magnet(int x, int y, int size, int r, int shape, color shapeColor){
   
   this.shape = shape;
   this.size = size;
   this.rotation = r;
   this.x = x;
   this.y = y;
   this.colour = shapeColor;
   this.isSelected = false;
   
   this.ID = shapeList.size();
   
   
   for (int i = 0; i <= shape; i++) {
     Connectors.add(new Connector((PI/i) + this.rotation, 20, this.ID, this.x, this.y, this.size, this.shape));
     println("test");
   }
   
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
