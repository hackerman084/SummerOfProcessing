//maybe do something like text input (must hit enter to end it) 
//then, it adds to the drawing instead of overwriting it? 
//first, start with creating basic visualization
//then, make is so that I can type something and have that become part of the visualization
//then, try to make it build on previous inputs
//then, make this huge cool projection art with all the ciphers

//one thing that could be cool would be to take a picture of someone using the webcam, base64 encode it, and somehow use that string to make art! 

import java.util.Base64; 
import java.util.ArrayList; 

class Circuit {
  ArrayList<Line> circuit; 
  int strokeWeight; 
  int hue; 
  int saturation; 
  int brightness; 
  int gradient; 
  
  public Circuit(int strokeWeight, int hue, int saturation, int brightness, int gradient){
    this.strokeWeight = strokeWeight; 
    this.hue = hue; 
    this.saturation = saturation; 
    this.brightness = brightness; 
    this.gradient = gradient; 
    circuit = new ArrayList<Line> ();
    
    Line line = new Line(0,(int) random(height), (int) random(20), 1); 
    //want to start randomly on left edge
    circuit.add(line); 
    line.createLine();    
  }
  
  public Circuit(){
    circuit = new ArrayList<Line> (); 
  }
  
  public void addToCircuit(){
    Line prevLine = circuit.get(circuit.size() - 1);
    //randomly choose to go up, down, or straight
    Line newLine = new Line(); 
    newLine.xFrom = prevLine.xTo; 
    newLine.yFrom = prevLine.yTo; 
    
    float direction = (int) random(2);
    //previous line went up/down
    //0 is up / down, 1 is straight
    if (prevLine.direction < 1){
      //force it to go straight
      direction = 1;
    }
  
    //up/down
    if (direction < 1){
      newLine.xTo = prevLine.xTo; 
      int yRan = (int) random(prevLine.yFrom - 40, prevLine.yFrom + 40);
      while (yRan > height){
        yRan = (int) random(prevLine.yFrom - 50, prevLine.yFrom - 10);
      }
      newLine.yTo = yRan;      
    }
    //straight
    else {
      newLine.yTo = prevLine.yTo; 
      //only go forward
      int xRan = (int) random(prevLine.xTo + 10, prevLine.xTo + 30);
      //reset
      if (xRan > width){
         //xRan = (int) random(prevLine.xTo - 50, prevLine.xTo - 10); 
         noLoop(); 
      }
      newLine.xTo = xRan;
    }
  
    newLine.direction = direction; 
    //creating new line
    circuit.add(newLine); 
    brightness+=2; 
    newLine.createLine(); 
  }
  
  class Line{
    int xFrom, yFrom, xTo, yTo; 
    int lineColor = 255; 
    float direction = 1; 
    public Line(int x1, int y1, int x2, int direction){
      xFrom = x1; 
      yFrom = y1; 
      xTo = x2; 
      yTo = y1; 
      this.direction = direction; 
    }
    public Line(){
    }
    
    public String toString(){
      return Float.toString(xFrom) + " " + Float.toString(yFrom) + " " + Float.toString(xTo) + " " + Float.toString(yTo)  + " " +Float.toString(lineColor); 
    }
    
    public void createLine(){
      strokeWeight(strokeWeight); 
      strokeJoin(BEVEL); 
      stroke(0, saturation, brightness); 
      line(xFrom, yFrom, xTo, yTo); 
      brightness+=gradient; 
    }
}
}

Circuit circuit1; 
Circuit circuit2; 

void setup(){
  //fullScreen();
  size(400,400);
  colorMode(HSB, 360, 100, 100); 

  background(0);
  //starting off
  //int strokeWeight, int hue, int saturation, int brightness, int gradient
  circuit1 = new Circuit(3, 10, 100, 0, 3); 
  circuit2 = new Circuit(3, 360, 50, 0, 1); 

  frameRate(5); 
}

void draw() {
  circuit1.addToCircuit(); //<>//
  circuit2.addToCircuit(); 

}
