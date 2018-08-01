float rotation = 0; 
int size = 30; 
RotatingRect [] chimes = new RotatingRect[size]; 
void setup() {
  size(400, 400, P3D);
  //background(0); 
  frameRate(20);
  for (int i = 0; i < size; i++){
    chimes[i] = new RotatingRect(i * 5, rotation); 
  }
}

void draw() {
  background(0); 
  //stroke(255); 
  //println(a.size);
  translate(width/2 - sqrt(chimes[0].size)/ 2, height/2 + sqrt(chimes[0].size)/2, 0);

  for (int i = 0; i < size; i++){
    chimes[i].rotation++; 
    rotateZ(PI/4); 
    rotateY(radians(chimes[i].rotation)); 
    shape(chimes[i].shape); 
  }
}

class RotatingRect{
  float size; 
  float rotation; 
  PShape shape; 
  
  public RotatingRect(float size, float rotation){
   shape = createShape(RECT, 0,0,size,size); 
   this.size = size; 
   this.rotation = rotation;
   shape.setFill(color(0)); 
   shape.setStroke(color(255)); 
 }
 
}
