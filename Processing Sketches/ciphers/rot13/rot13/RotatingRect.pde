class RotatingRect{
  float size; 
  float rotation; 
  PShape shape; 
  float hue; 
  float brightness; 
  float transparency; 
  
  public RotatingRect(float size, float rotation, float hue, float brightness, float transparency){
   shape = createShape(RECT, 0,0,size,size); 
   this.size = size; 
   this.rotation = rotation;
   this.hue = hue; 
   this.brightness = brightness; 
   this.transparency = transparency; 
   shape.setFill(color(0)); 
   shape.setStrokeWeight(2);
 }
 
 public void updateShape(){
   shape.setStroke(color(this.hue, 100, this.brightness, this.transparency)); 
 }
 
}
