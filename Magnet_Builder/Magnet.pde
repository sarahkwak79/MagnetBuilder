class Magnet {
 // fields
 float shape; // 
 color colour;
 float size;class Magnet {
 // fields
 int shape; //number of sides
 color colour;
 int size;  //radius in polygon
 int rotation;
 int numConnectors;
 ArrayList <Connector> Connectors;
 int x;
 int y;
 
 // constructor
 Magnet(int x, int y, int size, int r, int shape){
   
   this.shape = shape;
   this.size = size;
   this.rotation = r;
   this.x = x;
   this.y = y;
   
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
 float rotation;
 int numConnectors;
 ArrayList <Connector> Connectors;
 float x;
 float y;
 
 // constructor
 Magnet(float shape, color c, float size, float r, int n){
   
   this.shape = shape;
   this.colour = c;
   this.size = size;
   this.rotation = r;
   ArrayList<Connector> Connectors = new ArrayList(n);
 }
 
 
 // methods
  
  void place() {
    
  }
 
  void drawMagnets() {
    for (Magnet m : magnets) {
      fill(m.colour);
      rect(m.x, m.y, m.size, m.size);
    }
  }
  
}
