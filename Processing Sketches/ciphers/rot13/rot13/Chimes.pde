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
