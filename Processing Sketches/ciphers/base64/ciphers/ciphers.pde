import java.util.Base64; 
import java.util.ArrayList; 

Circuit circuit1; 
Circuit circuit2; 

String text = ""; 
PFont font;
PFont font2;
boolean displayText = true; 

//Event handler while user is typing. Will erase background text once user presses enter for the first time
//Otherwise passes user-typed string to be incorporated into the artwork
void keyPressed() {
  if (key == '\n' && !text.equals("")) {
    if (displayText){
      displayText = false; 
      background(0); 
    }
    changeCircuit(text);
    text = ""; 
  } 
  else {
    text += key; 
  }
}

//Base 64 encodes the string and returns the sum of its letters
//used to set aspects of the circuit
int encode(String text){
  text = Base64.getEncoder().encodeToString(text.getBytes());
  char[] arr = text.toCharArray(); 
  int sum = 0; 
  for (char letter : arr){
    sum += (int) letter;  
  }
  return sum; 
}

//This takes the user-inputted text and uses the sum of the letters to change the hue and stroke-weight of the circuit
void changeCircuit(String text){
  int sum = encode(text); 
  int hue = (sum % 12) * 30;  
  
  circuit1.setFeatures((int) random(1, text.length() % 10), hue + (int) (random(text.length(), text.length()*3)), 0.5);
  circuit2.setFeatures((int) random(1, text.length() % 10), hue-(int)(random(text.length(), text.length()*3)), 0.5); 
}

//called once, at the beginning
void setup(){
  fullScreen(P2D);
  
  font = createFont("sunspire.ttf", 100);
  colorMode(HSB, 360, 100, 150); 
  background(0);
  frameRate(10);
 
  circuit1 = new Circuit(0,0,0); 
  circuit2 = new Circuit(0,0,0); 
}

void draw() {
  if (displayText){
    textSize(width / 20); 
    textAlign(CENTER);
    textFont(font); 
    text("Share Your Secret", width/2, height/2); 
  }
  else { 
    circuit1.addToCircuit();
    circuit2.addToCircuit(); 
  }  
}
