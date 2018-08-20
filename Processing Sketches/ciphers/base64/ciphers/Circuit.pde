//Class encapsulates what I want to draw onto screen, a wire that travels from left to right in a random path
class Circuit {
  ArrayList<Line> circuit; 
  int strokeWeight; 
  int hue; 
  int saturation; 
  int brightness; 
  float gradient; 
  
  public Circuit(int strokeWeight, int hue, float gradient){
    this.strokeWeight = strokeWeight; 
    this.hue = hue; 
    this.saturation = 100; 
    this.brightness = 0; 
    this.gradient = gradient; 
    circuit = new ArrayList<Line> ();
    
    //want to start randomly on left edge
    Line line = new Line(0,(int) random(height), (int) random(20), 1, hue); 
    circuit.add(line); 
    this.addToCircuit(); 
  }
  
  public Circuit(){
    circuit = new ArrayList<Line>(); 
  }
  
  //easy way to set all of the features of the circuit
  public void setFeatures(int strokeWeight, int hue, float gradient){
    this.strokeWeight = strokeWeight; 
    this.hue = hue; 
    this.gradient = gradient; 
  }
  
  //Adds a new fragement to the circuit based off the previous fragment
  //Ensures a continuous wire is created
  public void addToCircuit(){
    Line prevLine = circuit.get(circuit.size() - 1);
    //randomly choose to go up, down, or straight
    Line newLine = new Line(hue);
    //setting connection
    newLine.xFrom = prevLine.xTo; 
    newLine.yFrom = prevLine.yTo;
    
    //Randomly goes up or down --> 0 is up / down, 1 is straight
    int direction = (int) random(2);
    //previous line went up/down? Force it straight
    if (prevLine.direction < 1){
      direction = 1;
    }
  
    //up/down direction
    if (direction < 1){
      newLine.xTo = prevLine.xTo; 
      int yRan = (int) random(prevLine.yFrom - 40, prevLine.yFrom + 40);
      //if it is about to go over the edges, create a line that goes directly to edge
      if (yRan < 5 || yRan % height < 5 || yRan >= height){
        Line endLine = new Line(hue); 
        endLine.xFrom = prevLine.xTo; 
        endLine.xTo = prevLine.xTo; 
        endLine.yFrom = prevLine.yFrom; 
        this.brightness = 0;
        //if it's about to hit the bottom
        if (yRan < 5){
          endLine.yTo = 0; 
          newLine.yFrom = height; 
          newLine.yTo = (int) random(height-20,height-1);   
        }
        else {
          endLine.yTo = height; 
          newLine.yFrom = 0; 
          newLine.yTo = (int) random(1,20);
        }
        
        endLine.createLine();
        //setting it so that the new line can be created again
        newLine.xFrom = prevLine.xFrom; 
        newLine.xTo = prevLine.xFrom; 
        circuit.clear(); 
      }
      else {
        newLine.yTo = yRan;      
      }
    }
    //straight
    else {
      newLine.yTo = prevLine.yTo; 
      //only go forward
      int xRan = (int) random(prevLine.xTo + 10, prevLine.xTo + 30);
      //reset if its about to go off the right side
      if (xRan % width <= 5 || xRan >= width) {
        this.brightness = 0;

        Line endLine = new Line(prevLine.xTo, prevLine.yTo, width, direction, hue);
        endLine.createLine(); 
        circuit.clear(); 
        //reset
        newLine.xFrom = 0; 
        newLine.xTo = (int) random(0,10); 
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
    float direction = 1; 
    int lineColor; 
    public Line(int x1, int y1, int x2, int direction, int lineColor){
      xFrom = x1; 
      yFrom = y1; 
      xTo = x2; 
      yTo = y1; 
      this.direction = direction; 
      this.lineColor = lineColor; 
    }
    public Line(int hue){
      this.lineColor = hue; 
    }
    
    public String toString(){
      return Float.toString(xFrom) + " " + Float.toString(yFrom) + " " + Float.toString(xTo) + " " + Float.toString(yTo) ; 
    }
    
    public void createLine(){
      strokeWeight(strokeWeight);  
      stroke(lineColor, saturation, brightness); 
      line(xFrom, yFrom, xTo, yTo); 
      brightness+=gradient; 
    }
}
}
