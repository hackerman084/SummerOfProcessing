import java.util.Base64; 
import java.util.ArrayList; 

Circuit circuit1; 
Circuit circuit2; 

String text = ""; 

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n') {
    start(text);
    text = ""; 
  } else {
    text += key; 
  }
}
hello
void start(String text){
  //starting off
  text = Base64.getEncoder().encodeToString(text.getBytes());
  char[] arr = text.toCharArray(); 
  int sum = 0; 
  for (char a : arr){
    sum+= (int) a;  
  }
  
  int hue = (sum % 12) * 30;  
  
  circuit1.setFeatures((int) random(1, text.length() % 10), hue + (int) (random(text.length(), text.length()*3)), 0.5);
  circuit2.setFeatures((int) random(1, text.length() % 10), hue-(int)(random(text.length(), text.length()*3)), 0.5); 
}

void setup(){
  fullScreen();
  //size(400,400);
  colorMode(HSB, 360, 100, 150); 
  background(0);
  frameRate(10);
  circuit1 = new Circuit(0,0,0); 
  circuit2 = new Circuit(0,0,0); 
}

void draw() {
  if (circuit1.gradient != 0 && circuit2.gradient != 0){
    circuit1.addToCircuit();
    circuit2.addToCircuit(); 
  }
  else {
   println("type something");  
  }
}
