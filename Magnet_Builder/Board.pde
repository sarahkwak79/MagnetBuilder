class Board {
  //FIELDS
  ArrayList<Magnet> magnets;
  
  //CONSTRUCTOR
  Board(){
    magnets = new ArrayList<Magnet>();
  }
  
  
  void highlight(){
    while (mousePressed){
      x = mouseX;
      y = mouseY;
      float h =+ y;
      float w =+ x;
      
      fill(255,0,3);
      quad(x,y,x,h,h,w,y,h);
    }
    
    //draws rectangle 
    //mouse release
    //any shapes (x,y)points in the rectangle will be selected 
  }
  void selectMagnet(){
    
  }
  
  void moveMagnet(){
  }
  
  void autoConnect(){
  }
  
  void cannotPlace(){
  }
  
  void separate(){
  }
  
  
  
}
