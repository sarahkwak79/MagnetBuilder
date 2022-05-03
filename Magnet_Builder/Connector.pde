class Connector {
  // fields

  float rotation;
  float range;
  int ID;
  float x;
  float y;
  float radius;

  // constructor
  Connector(float rotation, float range, int ID, float x, float y, float r, int points) {

    this.rotation = rotation;
    this.range = range;
    this.ID = ID;
    
  if (points == 3)
    i = 6;
  if (points == 4)
    i = 4;
  if (points == 5)
    i = 3.3;
  if (points == 6)
    i = 3;
    
    for (float a = (PI/i) + rotation; a < (TWO_PI) + rotation; a += TWO_PI/i) {
      this.x = x + (cos(a) * r);
      this.y = y + (sin(a) * r);
  }

  }


  // methods
  
  void snapTo() {
    
    
    
  }
  
  //void detect() {
  //  for // i in range all other connectors not part of the same peice
  //  if { // within range
  //  //check if it can be placed
  //  // if yes...
  //  //connect
  //  //change rotation to that of the original magnet
  //  // change rotation of the rest of the shape and other connectors attached
  //  }
    
    
  //}
  
}
