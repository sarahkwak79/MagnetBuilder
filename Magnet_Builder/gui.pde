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

public void dropList2_click1(GDropList source, GEvent event) { //_CODE_:Colours:577174:
  println("dropList2 - GDropList >> GEvent." + event + " @ " + millis());
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
  else
    shapeColor = white;
    
  for (Magnet mg: shapeList){
    if (mg.isSelected){
      mg.colour = shapeColor;
      mg.isSelected = false;
    }
  } 
   
} //_CODE_:Colours:577174:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:480129:
  shapeChoice = button1.getText();
  Magnet mg = new Magnet(pos, 100, RADIUS, 0, 3, shapeColor);
  shapeList.add(mg);
  pos += 30;
} //_CODE_:button1:480129:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:875460:
  shapeChoice = button2.getText();
  Magnet mg = new Magnet(pos, 100, RADIUS, 0, 5, shapeColor);
  shapeList.add(mg);
  pos += 30; 
} //_CODE_:button2:875460:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:820869:
  shapeChoice = button3.getText();
  Magnet mg = new Magnet(pos, 100, RADIUS, 0, 4, shapeColor);
  shapeList.add(mg);
  pos += 30;
} //_CODE_:button3:820869:

public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:340123:
  shapeChoice = button4.getText();
  Magnet mg = new Magnet(pos, 100, RADIUS, 0, 6, shapeColor);
  shapeList.add(mg);
  pos += 30;
} //_CODE_:button4:340123:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  Colours = new GDropList(this, 205, 299, 90, 160, 7, 10);
  Colours.setItems(loadStrings("list_577174"), 0);
  Colours.addEventHandler(this, "dropList2_click1");
  button1 = new GButton(this, 11, 300, 80, 30);
  button1.setText("Triangle");
  button1.addEventHandler(this, "button1_click1");
  button2 = new GButton(this, 12, 340, 80, 30);
  button2.setText("Pentagon");
  button2.addEventHandler(this, "button2_click1");
  button3 = new GButton(this, 106, 299, 80, 30);
  button3.setText("Square");
  button3.addEventHandler(this, "button3_click1");
  button4 = new GButton(this, 104, 338, 80, 30);
  button4.setText("Hexagon");
  button4.addEventHandler(this, "button4_click1");
}

// Variable declarations 
// autogenerated do not edit
GDropList Colours; 
GButton button1; 
GButton button2; 
GButton button3; 
GButton button4; 
