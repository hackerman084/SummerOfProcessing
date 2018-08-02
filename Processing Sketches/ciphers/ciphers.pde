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
    this.addToCircuit(); 
  }
  
  public Circuit(){
    circuit = new ArrayList<Line> (); 
  }
  
  public void addToCircuit(){
    Line prevLine = circuit.get(circuit.size() - 1);
    println(prevLine); 
    //randomly choose to go up, down, or straight
    Line newLine = new Line(); 
    newLine.xFrom = prevLine.xTo; 
    newLine.yFrom = prevLine.yTo; 
    
    int direction = (int) random(2);
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
      //top down
      
      if (yRan < 5 || yRan % height < 5 || yRan >= height){
        Line endLine = new Line(); 
        endLine.xFrom = prevLine.xTo; 
        endLine.xTo = prevLine.xTo; 
        endLine.yFrom = prevLine.yFrom; 
        
        if (yRan < 5){
          endLine.yTo = 0; 
          endLine.createLine(); 
          newLine.yFrom = height; 
          newLine.yTo = (int) random(height-20,height-1); 
          
        }
        else {
          endLine.yTo = height; 
          endLine.createLine(); 
          newLine.yFrom = 0; 
          newLine.yTo = (int) random(1,20);
        }
        
        newLine.xFrom = prevLine.xFrom; 
        newLine.xTo = prevLine.xFrom; 
        circuit.clear(); 
      } //<>// //<>//
      else {
        newLine.yTo = yRan;      
      }
    }
    //straight
    else {
      newLine.yTo = prevLine.yTo; 
      //only go forward
      int xRan = (int) random(prevLine.xTo + 10, prevLine.xTo + 30);
      //reset
      if (xRan % width <= 5 || xRan >= width) {
        Line endLine = new Line(prevLine.xTo, prevLine.yTo, width, direction); //<>//
        endLine.createLine(); 
        circuit.clear(); 
         //reset
        newLine.xFrom = 0; 
        newLine.xTo = (int) random(0,10); 
        this.brightness = 0;
         //remove all stuff from arr
      }
      else {
        newLine.xTo = xRan;
      }
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
void setup(){
  //fullScreen();
  size(400,400);
  colorMode(HSB, 360, 100, 150); 

  background(0);
  //starting off
  circuit1 = new Circuit(3, 10, 100, 0, 3); 

  frameRate(10); 
}

void draw() {
  circuit1.addToCircuit();

}
