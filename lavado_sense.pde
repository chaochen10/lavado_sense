//%1,eva,b_lav,c_cald,c_cuba,vaciado,b_pres,powerOn,puerta,boya_inf,boya_sup,pres_bajo,t_cuba,t_cald,t_aclarado$
// 4 de agosto del 2016
import processing.serial.*;
import g4p_controls.*;
import org.multiply.processing.TimedEventGenerator;

private TimedEventGenerator dataRequestEvent_1;
private TimedEventGenerator blinkRequest;
private TimedEventGenerator blinkAnswer;


Serial myPort;
String serialList[];
boolean serialSelection = false;
String inString="";
String splitDataAnswer[];
boolean triggerAppend= false;

String requestDataArray_1[];
int request1ArrayPos=0;
String numID_spy="1";
String numID_sensor="2";
boolean requestDataRepresentation = false;

boolean blinkRequestLine = false;
boolean blinkAnswerLine = false;

PImage img_principal;
PImage img_eva;
PImage img_lavado;
PImage img_aclarado;
PImage img_vaciado;
PImage img_boya_inf;
PImage img_boya_sup;
PImage img_pres_bajo;
PImage img_puerta_abierta;
PImage img_puerta_cerrada;
PImage img_c_cuba;
PImage img_c_calderin;
int ix = 650;
int iy = 350;
int posx = 200;
int posy = 40;

boolean stateEva = false;
boolean stateB_lav = false;
boolean stateC_cald = false;
boolean stateC_cuba = false;
boolean stateVaciado = false;
boolean stateB_pres = false;
boolean statePowerOn = false;
boolean statePuerta = false;
boolean stateBoya_inf = false;
boolean stateBoya_sup = false;
boolean statePres_bajo = false;
int stateT_cuba = 0;
int stateT_cald = 0;
int stateT_aclarado = 0;


void setup() {
  frameRate(18);
  size(1050,500);
  serialList = Serial.list(); 
  
  requestDataArray_1 = new String[50];
  
  dataRequestEvent_1 = new TimedEventGenerator(this, "onDataRequestEvent_1", false);
  dataRequestEvent_1.setIntervalMs(1000);
  blinkRequest = new TimedEventGenerator(this, "onBlinkRequest", false);
  blinkRequest.setIntervalMs(200);
  blinkAnswer = new TimedEventGenerator(this, "onBlinkAnswer", false);
  blinkAnswer.setIntervalMs(200);
  
  img_principal = loadImage("principal.png");
  img_eva = loadImage("eva.png");
  img_lavado = loadImage("lavado.png");
  img_aclarado = loadImage("aclarado.png");
  img_vaciado = loadImage("vaciado.png");
  img_boya_inf = loadImage("boya inf.png");
  img_boya_sup = loadImage("boya sup.png");
  img_pres_bajo = loadImage("pres_bajo.png");
  img_puerta_abierta = loadImage("puerta abierta.png");
  img_puerta_cerrada = loadImage("puerta cerrada.png");
  img_c_cuba = loadImage("calentamiento cuba.png");
  img_c_calderin = loadImage("calentamiento calderin.png");

  createGUI();
  customGUI();
  
  
  list_serial.setItems(serialList, 0);  
  printArray(serialList);
  
  //dataRequestEvent_1.setEnabled(true);
  
  
    
}

void draw() {
  background(255);
  image(img_principal, posx, posy,ix,iy);
  
  if(requestDataRepresentation){
    //printArray(splitDataAnswer);
    if(int(splitDataAnswer[0]) == 1){link_answer_1();}
    else if(int(splitDataAnswer[0])==2){}
    requestDataRepresentation = false;
  }
  
  if(blinkRequestLine){
    strokeWeight(3); 
    stroke(250, 227, 152); //191, 255, 208
    line(350, 15, 395, 15);
  }
  if(blinkAnswerLine){
    strokeWeight(3); 
    stroke(250, 227, 152); //191, 255, 208
    line(350, 35, 395, 35);
  }
   
  if(stateEva == true){ image(img_eva, posx, posy,ix,iy);}
  if(stateB_lav == true) image(img_lavado, posx, posy,ix,iy);
  if(stateC_cald == true) image(img_c_calderin, posx, posy,ix,iy);
  if(stateC_cuba == true) image(img_c_cuba, posx, posy,ix,iy);
  if(stateVaciado == true) image(img_vaciado, posx, posy,ix,iy);
  if(stateB_pres == true) image(img_principal, posx, posy,ix,iy);
  if(statePowerOn == true) image(img_principal, posx, posy,ix,iy);
  if(stateBoya_inf == true) image(img_boya_inf, posx, posy,ix,iy);
  if(stateBoya_sup == true) image(img_boya_sup, posx, posy,ix,iy);
  if(statePres_bajo == true) image(img_pres_bajo, posx, posy,ix,iy); 
  if(statePuerta == true) image(img_puerta_abierta,ix+posx,posy+10,ix*0.18,iy*0.80);
  if(!statePuerta == true) image(img_puerta_cerrada, ix+posx,posy+10,ix*0.18,iy*0.80);
}

void serialConection(){
  if(!serialSelection){
    myPort = new Serial(this, Serial.list()[list_serial.getSelectedIndex()], 115200);
    button_OKserial.setText("conectado");
    button_OKserial.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    dataRequestEvent_1.setEnabled(true);
    serialSelection = true;
  }
  else if(serialSelection){
    myPort.clear();
    myPort.stop();
    button_OKserial.setText("conectar");
    button_OKserial.setLocalColorScheme(GCScheme.RED_SCHEME);
    dataRequestEvent_1.setEnabled(false);
    serialSelection = false;
  }
}

void link_answer_1(){
  for(int i=0; i<request1ArrayPos; i++){
    if(requestDataArray_1[i] == "eva"){
      if(int(splitDataAnswer[i+1])==1) stateEva = true;
      else stateEva = false;
    }
    else if(requestDataArray_1[i] =="b_lav"){
      if(int(splitDataAnswer[i+1])==1) stateB_lav = true;
      else stateB_lav = false;
    }
    else if(requestDataArray_1[i] =="c_cald"){
      if(int(splitDataAnswer[i+1])==1) stateC_cald = true;
      else stateC_cald = false;
    }
    else if(requestDataArray_1[i] =="c_cuba"){
      if(int(splitDataAnswer[i+1])==1) stateC_cuba = true;
      else stateC_cuba = false;
    }
    else if(requestDataArray_1[i] =="vaciado"){
      if(int(splitDataAnswer[i+1])==1) stateVaciado = true;
      else stateVaciado = false;
    }
    else if(requestDataArray_1[i] =="b_pres"){
      if(int(splitDataAnswer[i+1])==1) stateB_pres = true;
      else stateB_pres = false;
    }
    else if(requestDataArray_1[i] =="powerOn"){
      if(int(splitDataAnswer[i+1])==1) statePowerOn = true;
      else statePowerOn = false;
    }
    else if(requestDataArray_1[i] =="puerta"){
      if(int(splitDataAnswer[i+1])==1) statePuerta = true;
      else statePuerta = false;
    }
    else if(requestDataArray_1[i] =="boya_inf"){
      if(int(splitDataAnswer[i+1])==1) stateBoya_inf = true;
      else stateBoya_inf = false;
    }
    else if(requestDataArray_1[i] =="boya_sup"){
      if(int(splitDataAnswer[i+1])==1) stateBoya_sup = true;
      else stateBoya_sup = false;}
    else if(requestDataArray_1[i] =="pres_bajo"){
      if(int(splitDataAnswer[i+1])==1) statePres_bajo = true;
      else statePres_bajo = false;
    }
    else if(requestDataArray_1[i] =="t_cuba"){
      stateT_cuba = int(splitDataAnswer[i+1]);
    }
    else if(requestDataArray_1[i] =="t_cald"){
      stateT_cald = int(splitDataAnswer[i+1]);
    }
    else if(requestDataArray_1[i] =="t_aclarado"){
      stateT_aclarado = int(splitDataAnswer[i+1]);
    }
  }    
}

void check_boxes_1(){
  request1ArrayPos = 0;
  if(eva.isSelected()){requestDataArray_1[request1ArrayPos]= "eva"; request1ArrayPos++;}
  if(b_lav.isSelected()){requestDataArray_1[request1ArrayPos]= "b_lav"; request1ArrayPos++;}
  if(c_calderin.isSelected()){requestDataArray_1[request1ArrayPos]= "c_cald"; request1ArrayPos++;}
  if(c_cuba.isSelected()){requestDataArray_1[request1ArrayPos]= "c_cuba"; request1ArrayPos++;}
  if(vaciado.isSelected()){requestDataArray_1[request1ArrayPos]= "vaciado"; request1ArrayPos++;}
  if(b_presion.isSelected()){requestDataArray_1[request1ArrayPos]= "b_pres"; request1ArrayPos++;}
  if(powerOn.isSelected()){requestDataArray_1[request1ArrayPos]= "powerOn"; request1ArrayPos++;}
  if(puerta.isSelected()){requestDataArray_1[request1ArrayPos]= "puerta"; request1ArrayPos++;}
  if(boya_inf.isSelected()){requestDataArray_1[request1ArrayPos]= "boya_inf"; request1ArrayPos++;}
  if(boya_sup.isSelected()){requestDataArray_1[request1ArrayPos]= "boya_sup"; request1ArrayPos++;}
  if(pres_bajo.isSelected()){requestDataArray_1[request1ArrayPos]= "pres_bajo"; request1ArrayPos++;}
  if(temp_cuba.isSelected()){requestDataArray_1[request1ArrayPos]= "t_cuba"; request1ArrayPos++;}
  if(temp_calderin.isSelected()){requestDataArray_1[request1ArrayPos]= "t_cald"; request1ArrayPos++;}
  if(temp_aclarado.isSelected()){requestDataArray_1[request1ArrayPos]= "t_aclarado"; request1ArrayPos++;}
}

void onDataRequestEvent_1(){
  String requestString_1="";
  String[] subsetString_1;
  check_boxes_1();
  if(request1ArrayPos==0){requestString_1="%"+ numID_spy +"$";}
  else{
    // extraer los parametros de peticion nuevos
    subsetString_1 = subset(requestDataArray_1,0,request1ArrayPos);
    // convertir en un único String uniendo mediante una coma
    requestString_1 = join(subsetString_1,",");
    // dar formato a la peticion de datos
    requestString_1="%"+ numID_spy+","+requestString_1 +"$";
  }
  // mostrar en la pantalla
  request.setText(requestString_1);
  // enviar por el puerto serie
  myPort.write(requestString_1);
  //parpadeo luminosa
  blinkRequest.setEnabled(true);
}

void onBlinkRequest(){
  blinkRequestLine = !blinkRequestLine;
  if(blinkRequestLine==false){blinkRequest.setEnabled(false);}
}

void onBlinkAnswer(){
  blinkAnswerLine = !blinkAnswerLine;
  if(blinkAnswerLine==false){blinkAnswer.setEnabled(false);}
}

void serialEvent(Serial p) { 
  char inByte = p.readChar();
  //print(inByte);
  if (inByte == '%') {triggerAppend = true;}
  else if(inByte== '$'){
    //println(inString);
    answer.setText("%"+inString+"$");
    blinkAnswer.setEnabled(true);
    splitDataAnswer = split(inString,','); // separar los variables por coma en el array splitDat
    inString ="";
    requestDataRepresentation = true;
    triggerAppend = false;
  }
  if(triggerAppend==true && inByte!='%'){  
    inString = inString + str(inByte);
  }
}  

  void mouseClicked(){
    //list_serial.setItems(serialList, 0);
 
  }