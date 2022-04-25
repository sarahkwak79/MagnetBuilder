class Magnet {
 // fields
 float shape; // 
 color colour;
 float size;
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
  
}
