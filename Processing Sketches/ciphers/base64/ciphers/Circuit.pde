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
    
    Line line = new Line(0,(int) random(height), (int) random(20), 1, hue); 
    //want to start randomly on left edge
    circuit.add(line); 
    this.addToCircuit(); 
  }
  
  public Circuit(){
    circuit = new ArrayList<Line>(); 
  }
  
  public void setFeatures(int strokeWeight, int hue, float gradient){
    this.strokeWeight = strokeWeight; 
    this.hue = hue; 
    this.gradient = gradient; 
  }
  
  public void addToCircuit(){
    Line prevLine = circuit.get(circuit.size() - 1);
    //randomly choose to go up, down, or straight
    Line newLine = new Line(hue);
    //setting connection
    newLine.xFrom = prevLine.xTo; 
    newLine.yFrom = prevLine.yTo;
    //0 is up / down, 1 is straight
    int direction = (int) random(2);
    //previous line went up/down
    if (prevLine.direction < 1){
      //force it to go straight
      direction = 1;
    }
  
    //up/down
    if (direction < 1){
      newLine.xTo = prevLine.xTo; 
      int yRan = (int) random(prevLine.yFrom - 40, prevLine.yFrom + 40);
      //if it is about to go over the edges
      if (yRan < 5 || yRan % height < 5 || yRan >= height){
        Line endLine = new Line(hue); 
        endLine.xFrom = prevLine.xTo; 
        endLine.xTo = prevLine.xTo; 
        endLine.yFrom = prevLine.yFrom; 
        this.brightness = 0;
        
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
      //reset
      if (xRan % width <= 5 || xRan >= width) {
        this.brightness = 0;

        Line endLine = new Line(prevLine.xTo, prevLine.yTo, width, direction, hue);
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
