public String rot13Encode(String text) {
  char[] letters = text.toCharArray(); 
  int shift = 13; 
  for(int i = 0; i < letters.length; i++) {
    int asciiLetter = (((int) letters[i] - 97 + shift) % 26) + 97; 
    letters[i] = (char) asciiLetter; 
  }
  
  return new String(letters); 
}

public class Chimes{
  int startingColor = 0; 
  RotatingRect[] chimes; 
  int startingBrightness = 0; 
  int size; 
  public Chimes(int size){
      int colorGradient = 360 / size;
      int brightnessGradient = 100/size; 
      chimes = new RotatingRect[size];
      this.size = size; 
      int transparency = 30; 
       for (int i = 0; i < size; i++){
          chimes[i] = new RotatingRect(i * 5, 0, startingColor, startingBrightness, transparency); 
          startingColor+=colorGradient;
          startingBrightness+=brightnessGradient; 
          transparency = (transparency + brightnessGradient) % 100; 
       }
  }
  
  public void shift(int brightness, int hue, int transparency ){
    for(RotatingRect a : chimes) {
      a.brightness = (a.brightness + brightness) % 100; 
      a.hue = (a.hue + hue) % 360; 
      a.transparency = (a.transparency + transparency) % 100;
      a.updateShape(); 
    }
    
    for (int i = 0; i < size; i++){
      chimes[i].rotation++; 
      rotateZ(PI/4); 
      rotateY(radians(chimes[i].rotation)); 
      shape(chimes[i].shape); 
    }
  }
}
int size; 
Chimes chimes; 
int sum; 
void setup() {
  fullScreen(P3D);
  colorMode(HSB, 360, 100,100,100); 
  size = height / 10;
  chimes = new Chimes(size); 
  frameRate(10);
  char[] text = rot13Encode("This is a secret").toCharArray();
  sum = 0; 
  for (char a : text){
    sum+= (int) a;  
  }
}

void draw() {
  background(0); 
  translate(width/2 - sqrt(chimes.chimes[0].size)/ 2, height/2 + sqrt(chimes.chimes[0].size)/2, 0);
  println(sum);
  chimes.shift(sum / ((int) random(600,height)), sum/((int) random(600,height)), sum / ((int) random(600,height)));
}

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
