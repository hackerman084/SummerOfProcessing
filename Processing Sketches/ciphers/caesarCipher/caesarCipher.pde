import java.util.ArrayList; 

float x = 0.0; 
float y = 0.0; 
float z = 0.0; 
float t = 0.0;
int hue = 0;

public String caesarEncode(String text) {
  char[] letters = text.toCharArray(); 
  int shift = 3; 
  for(int i = 0; i < letters.length; i++) {
    int asciiLetter = (((int) letters[i] - 97 + shift) % 26) + 97; 
    letters[i] = (char) asciiLetter; 
  }
  
  return new String(letters); 
}
 //<>//
void setup(){
  fullScreen(P3D); 
  frameRate(200);
  colorMode(HSB, 360,100,100); 
  //angling the camera to get a better view of the tornado
  camera(50, 100, 200, 0, 0, 0, 0, -1, 0);
  background(10);
  String text = caesarEncode("This is a placeholder secret"); 
  println(text);
  char[] arr = text.toCharArray(); 
  int sum = 0; 
  for (char a : arr){
    sum+= (int) a;  
  }
  
  hue = sum % 360; 
  
}

ArrayList<Circle> circles = new ArrayList<Circle>(); 
float gradient = 0; 
void draw(){
  //so the z value in the eye is setting how close / far the viewer is looking at the object from
  //so it's a pretty arbitrary value
  //isolate coordinate system for A point
  pushMatrix();
  
  if (y < 7 * PI) { 
    x = exp(0.15*t)* cos(6*t) * 10; 
    z = 0.5 * exp(0.15*t)* sin(6*t) * 10; 
    y = t;
    t += PI/256; 
    
    //scaling and moving it downwards
    translate(0,0,z);
    Circle circle = new Circle(x, (y * 15 - (height / 6)), z, 3, gradient);
    gradient+= 0.05; 
    circle.drawCircle(); 
    circles.add(circle); 
    }
    
    if ((y * 15 - (height / 6)) > height/20) {
      int ran = (int) random(circles.size() - 100, circles.size()); 
      if (ran % 10 == 0) {
        circles.get(ran).flash(hue); 
      }
    }

  popMatrix();
}
void drawAxes(float size){
  //X  - red
  stroke(360,100,100);
  line(0,0,0,size,0,0);
  //Y - green
  stroke(175,100,100);
  line(0,0,0,0,size,0);
  //Z - blue
  stroke(225,100,100);
  line(0,0,0,0,0,size);
}
