//maybe do something like text input (must hit enter to end it) 
//then, it adds to the drawing instead of overwriting it? 
//first, start with creating basic visualization
//then, make is so that I can type something and have that become part of the visualization
//then, try to make it build on previous inputs
//then, make this huge cool projection art with all the ciphers

//one thing that could be cool would be to take a picture of someone using the webcam, base64 encode it, and somehow use that string to make art! 

import java.util.Base64; 
import java.util.ArrayList; 
 //<>// //<>//
Circuit circuit1;
Circuit circuit2; 
void setup(){
  fullScreen();
  //size(400,400);
  colorMode(HSB, 360, 100, 150); 
  background(0);
  //starting off
  String text = "This is a super duper secret"; 
  text = Base64.getEncoder().encodeToString(text.getBytes());
  char[] arr = text.toCharArray(); 
  int sum = 0; 
  for (char a : arr){
    sum+= (int) a;  
  }
  int hue = sum % 180;  
    println(hue); 

  circuit1 = new Circuit((int) random(1, text.length() % 10), hue + (int) (random(text.length(), text.length()*3)), 0.5);
  circuit2 = new Circuit((int) random(1, text.length() % 10), hue-(int)(random(text.length(), text.length()*3)), 0.5); 

  frameRate(100); 
}

void draw() {
  circuit1.addToCircuit();
  circuit2.addToCircuit(); 

}
