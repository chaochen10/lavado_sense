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

public void list_serial_click(GDropList source, GEvent event) { //_CODE_:list_serial:790909:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:list_serial:790909:


public void button_OKserial_click(GButton source, GEvent event) { //_CODE_:button_OKserial:355725:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  serialConection();
} //_CODE_:button_OKserial:355725:

public void eva_clicked1(GCheckbox source, GEvent event) { //_CODE_:eva:841145:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:eva:841145:

public void b_lav_clicked1(GCheckbox source, GEvent event) { //_CODE_:b_lav:594751:
  println("checkbox2 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:b_lav:594751:

public void c_calderin_clicked1(GCheckbox source, GEvent event) { //_CODE_:c_calderin:901309:
  println("checkbox3 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:c_calderin:901309:

public void c_cuba_clicked1(GCheckbox source, GEvent event) { //_CODE_:c_cuba:437297:
  println("checkbox4 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:c_cuba:437297:

public void vaciado_clicked1(GCheckbox source, GEvent event) { //_CODE_:vaciado:536116:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:vaciado:536116:

public void b_presion_clicked1(GCheckbox source, GEvent event) { //_CODE_:b_presion:303377:
  println("b_presion - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:b_presion:303377:

public void powerOn_clicked1(GCheckbox source, GEvent event) { //_CODE_:powerOn:604669:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:powerOn:604669:

public void puerta_clicked1(GCheckbox source, GEvent event) { //_CODE_:puerta:417767:
  println("puerta - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:puerta:417767:

public void boya_inf_clicked1(GCheckbox source, GEvent event) { //_CODE_:boya_inf:748712:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:boya_inf:748712:

public void boya_sup_clicked1(GCheckbox source, GEvent event) { //_CODE_:boya_sup:838148:
  println("checkbox2 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:boya_sup:838148:

public void pres_bajo_clicked1(GCheckbox source, GEvent event) { //_CODE_:pres_bajo:308185:
  println("checkbox3 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:pres_bajo:308185:

public void temp_cuba_clicked1(GCheckbox source, GEvent event) { //_CODE_:temp_cuba:680224:
  println("checkbox1 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:temp_cuba:680224:

public void temp_calderin_clicked1(GCheckbox source, GEvent event) { //_CODE_:temp_calderin:716182:
  println("checkbox2 - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:temp_calderin:716182:

public void temp_aclarado_clicked1(GCheckbox source, GEvent event) { //_CODE_:temp_aclarado:834010:
  println("temp_aclarado - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:temp_aclarado:834010:


// Create all the GUI controls. 
// autogenerated do not edit
public void customGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  
  list_serial = new GDropList(this, 14, 8, 252, 100, 5);
  //list_serial.setItems(loadStrings("list_790909"), 0);
  list_serial.addEventHandler(this, "list_serial_click");
  button_OKserial = new GButton(this, 270, 8, 65, 20);
  button_OKserial.setText("conectar");
  button_OKserial.setLocalColorScheme(GCScheme.RED_SCHEME);
  button_OKserial.addEventHandler(this, "button_OKserial_click");
  
  eva = new GCheckbox(this, 5, 30, 45, 19);
  eva.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  eva.setText("eva");
  eva.setOpaque(false);
  eva.addEventHandler(this, "eva_clicked1");
  eva.setSelected(true);
  b_lav = new GCheckbox(this, 5, 50, 58, 20);
  b_lav.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  b_lav.setText("b_lav");
  b_lav.setOpaque(false);
  b_lav.addEventHandler(this, "b_lav_clicked1");
  b_lav.setSelected(true);
  c_calderin = new GCheckbox(this, 85, 50, 81, 20);
  c_calderin.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  c_calderin.setText("c_calderin");
  c_calderin.setOpaque(false);
  c_calderin.addEventHandler(this, "c_calderin_clicked1");
  c_calderin.setSelected(true);
  c_cuba = new GCheckbox(this, 85, 70, 80, 20);
  c_cuba.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  c_cuba.setText("c_cuba");
  c_cuba.setOpaque(false);
  c_cuba.addEventHandler(this, "c_cuba_clicked1");
  c_cuba.setSelected(true);
  vaciado = new GCheckbox(this, 5, 70, 68, 21);
  vaciado.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  vaciado.setText("vaciado");
  vaciado.setOpaque(false);
  vaciado.addEventHandler(this, "vaciado_clicked1");
  vaciado.setSelected(true);
  b_presion = new GCheckbox(this, 5, 90, 80, 18);
  b_presion.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  b_presion.setText("b_presion");
  b_presion.setOpaque(false);
  b_presion.addEventHandler(this, "b_presion_clicked1");
  b_presion.setSelected(true);
  powerOn = new GCheckbox(this, 85, 30, 78, 20);
  powerOn.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  powerOn.setText("powerOn");
  powerOn.setOpaque(false);
  powerOn.addEventHandler(this, "powerOn_clicked1");
  powerOn.setSelected(true);
  puerta = new GCheckbox(this, 85, 90, 80, 20);
  puerta.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  puerta.setText("puerta");
  puerta.setOpaque(false);
  puerta.addEventHandler(this, "puerta_clicked1");
  puerta.setSelected(true);
  boya_inf = new GCheckbox(this, 5, 190, 120, 20);
  boya_inf.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  boya_inf.setText("boya_inf");
  boya_inf.setOpaque(false);
  boya_inf.addEventHandler(this, "boya_inf_clicked1");
  boya_inf.setSelected(true);
  boya_sup = new GCheckbox(this, 5, 170, 120, 20);
  boya_sup.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  boya_sup.setText("boya_sup");
  boya_sup.setOpaque(false);
  boya_sup.addEventHandler(this, "boya_sup_clicked1");
  boya_sup.setSelected(true);
  pres_bajo = new GCheckbox(this, 5, 150, 120, 20);
  pres_bajo.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  pres_bajo.setText("pres_bajo");
  pres_bajo.setOpaque(false);
  pres_bajo.addEventHandler(this, "pres_bajo_clicked1");
  pres_bajo.setSelected(true);
  temp_cuba = new GCheckbox(this, 5, 110, 93, 20);
  temp_cuba.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  temp_cuba.setText("cuba ºC");
  temp_cuba.setOpaque(false);
  temp_cuba.addEventHandler(this, "temp_cuba_clicked1");
  temp_cuba.setSelected(true);
  temp_calderin = new GCheckbox(this, 85, 110, 82, 20);
  temp_calderin.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  temp_calderin.setText("calderin ºC");
  temp_calderin.setOpaque(false);
  temp_calderin.addEventHandler(this, "temp_calderin_clicked1");
  temp_calderin.setSelected(true);
  temp_aclarado = new GCheckbox(this, 5, 130, 120, 20);
  temp_aclarado.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  temp_aclarado.setText("aclarado ºC");
  temp_aclarado.setOpaque(false);
  temp_aclarado.addEventHandler(this, "temp_aclarado_clicked1");
  temp_aclarado.setSelected(true);
  
  label1 = new GLabel(this, 340, 1, 65, 20);
  label1.setText("petición:");
  //label1.setTextBold();
  label1.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  label1.setOpaque(false);
  label2 = new GLabel(this, 342, 20, 65, 20);
  label2.setText("respuesta:");
  //label2.setTextBold();
  label2.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  label2.setOpaque(false);
  request = new GLabel(this, 405, 1, 700, 20);
  request.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  request.setText("...");
  request.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  request.setOpaque(false);
  answer = new GLabel(this, 405, 20, 700, 20);
  answer.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  answer.setText("...");
  answer.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  answer.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GDropList list_serial; 
GButton button_OKserial; 

GCheckbox eva; 
GCheckbox b_lav; 
GCheckbox c_calderin; 
GCheckbox c_cuba; 
GCheckbox vaciado; 
GCheckbox b_presion; 
GCheckbox powerOn; 
GCheckbox puerta; 
GCheckbox boya_inf; 
GCheckbox boya_sup; 
GCheckbox pres_bajo; 
GCheckbox temp_cuba; 
GCheckbox temp_calderin; 
GCheckbox temp_aclarado; 

GLabel label1; 
GLabel label2; 
GLabel request; 
GLabel answer; 