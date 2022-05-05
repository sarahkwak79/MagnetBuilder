/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:927837:
  appc.background(230);
} //_CODE_:window1:927837:

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:Colours:780941:
  colourChoice = Colours.getSelectedText();
  if (colourChoice.equals("Red"))
    shapeColor = red;
  else if (colourChoice.equals("Orange"))
    shapeColor = orange;
  else if (colourChoice.equals("Yellow"))
    shapeColor = yellow;
  else if (colourChoice.equals("Green"))
    shapeColor = green;
  else if (colourChoice.equals("Blue"))
    shapeColor = blue;
  else if (colourChoice.equals("Purple"))
    shapeColor = purple;
  else if (colourChoice.equals("Pink"))
    shapeColor = pink;
  else
    shapeColor = grey;

  for (Magnet mg : shapeList) { //updates colour when a magnet is selected
    if (mg.isSelected) {
      mg.colour = shapeColor;
    }
  }
} //_CODE_:Colours:780941:
ArrayList<Integer> xPos = new ArrayList<Integer>();
public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:892562:
  shapeChoice = button1.getText();
  for (Magnet mg : shapeList) {   // updates the shape a magnet is selected
    if (mg.isSelected) {
     mg.shape = 3;
      return;
    }
  }

  Magnet mg = new Magnet(pos, 610, RADIUS, 0, 3, shapeColor);
  shapeList.add(mg);
  placeSound.jump(1);
  pos += 100;

  if (pos >= 580){
    pos = -100;
  
    for (int i = 0; i < shapeList.size(); i++){
      if (shapeList.get(i).x == 480)
        pos = 580;
    }
    for (int i = 0; i < shapeList.size(); i++){
      if (shapeList.get(i).x == 380)
        pos = 480;
    }
        
    for (int i = 0; i < shapeList.size(); i++){
      if (shapeList.get(i).x == 280)
        pos = 380;
    }
    for (int i = 0; i < shapeList.size(); i++){
      if (shapeList.get(i).x == 180)
        pos = 280;        
    }
    for (int i = 0; i < shapeList.size(); i++){
      if (shapeList.get(i).x == 80)
        pos = 180;
    }
    pos = 80;
    
    for (int i = 0; i < shapeList.size(); i++){
      if (shapeList.get(i).x == 80 && shapeList.get(i).x == 180 && shapeList.get(i).x == 280 && shapeList.get(i).x == 380 && shapeList.get(i).x == 480 && shapeList.get(i).x == 80)
        pos = -100;
    }
  }
} //_CODE_:button1:892562:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:465619:
  shapeChoice = button1.getText();
  for (Magnet mg : shapeList) {
    if (mg.isSelected) {
      mg.shape = 4;
      return;
    }
  }

 for (int i = 0; i < shapeList.size(); i++) {
    if (shapeList.get(i).x != 80 && shapeList.get(i).x != 180 && shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 80;
    else if (shapeList.get(i).x != 180 && shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 180;
    else if (shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480)
      pos = 280;
    else if (shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 380;
    else if (shapeList.get(i).x != 480 )
      pos = 480;
    else 
      pos = -100;
  }
  Magnet mg = new Magnet(pos, 610, RADIUS, 0, 4, shapeColor);
  shapeList.add(mg);
  placeSound.jump(1);
} //_CODE_:button3:465619:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:720035:
  shapeChoice = button1.getText();
  for (Magnet mg : shapeList) {
    if (mg.isSelected) {
      mg.shape = 5;
      return;
    }
  }

  for (int i = 0; i < shapeList.size(); i++) {
    if (shapeList.get(i).x != 80 && shapeList.get(i).x != 180 && shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 80;
    else if (shapeList.get(i).x != 180 && shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 180;
    else if (shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480)
      pos = 280;
    else if (shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 380;
    else if (shapeList.get(i).x != 480 )
      pos = 480;
    else 
      pos = -100;
  }
  Magnet mg = new Magnet(pos, 610, RADIUS, 0, 5, shapeColor);
  shapeList.add(mg);
  placeSound.jump(1);
} //_CODE_:button2:720035:

public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:825237:
  shapeChoice = button1.getText();
  for (Magnet mg : shapeList) {
    if (mg.isSelected) {
      mg.shape = 6;
      return;
    }
  }
  

 for (int i = 0; i < shapeList.size(); i++) {
    printArray(shapeList.get(i).x);
    if (shapeList.get(i).x != 80 && shapeList.get(i).x != 180 && shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 80;
    else if (shapeList.get(i).x != 180 && shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 180;
    else if (shapeList.get(i).x != 280 && shapeList.get(i).x != 380 && shapeList.get(i).x != 480)
      pos = 280;
    else if (shapeList.get(i).x != 380 && shapeList.get(i).x != 480 )
      pos = 380;
    else if (shapeList.get(i).x != 480 )
      pos = 480;
    else 
      pos = -100;
  }
  Magnet mg = new Magnet(pos, 610, RADIUS, 0, 6, shapeColor);
  shapeList.add(mg);
  placeSound.jump(1);
} //_CODE_:button4:825237:

public void button5_click1(GButton source, GEvent event) { //_CODE_:button5:311007:
  for (Magnet mg : shapeList) {
    if (mg.isSelected) {
      shapeList.remove(mg);
    }
  }
  placeSound.jump(0.95);
} //_CODE_:button5:311007:

public void button6_click1(GButton source, GEvent event) { //_CODE_:button6:605913:
  shapeList = new ArrayList<Magnet>();
  pos = 80;
  breakSound.jump(1.15);
} //_CODE_:button6:605913:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 450, 200, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  Colours = new GDropList(window1, 19, 31, 90, 180, 8, 10);
  Colours.setItems(loadStrings("list_780941"), 0);
  Colours.addEventHandler(this, "dropList1_click1");
  label1 = new GLabel(window1, 128, 33, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Shapes");
  label1.setOpaque(false);
  button1 = new GButton(window1, 124, 68, 80, 30);
  button1.setText("Triangle");
  button1.addEventHandler(this, "button1_click1");
  button3 = new GButton(window1, 213, 68, 80, 30);
  button3.setText("Square");
  button3.addEventHandler(this, "button3_click1");
  button2 = new GButton(window1, 124, 112, 80, 30);
  button2.setText("Pentagon");
  button2.addEventHandler(this, "button2_click1");
  button4 = new GButton(window1, 213, 111, 80, 30);
  button4.setText("Hexagon");
  button4.addEventHandler(this, "button4_click1");
  button5 = new GButton(window1, 328, 67, 80, 30);
  button5.setText("Delete");
  button5.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  button5.addEventHandler(this, "button5_click1");
  button6 = new GButton(window1, 328, 109, 80, 30);
  button6.setText("Clear");
  button6.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  button6.addEventHandler(this, "button6_click1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GDropList Colours; 
GLabel label1; 
GButton button1; 
GButton button3; 
GButton button2; 
GButton button4; 
GButton button5; 
GButton button6; 
