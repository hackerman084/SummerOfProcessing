
////97 - 122
////do a tornado style thing with leaves? 
//public char[] caesarEncode(String text) {
//  char[] letters = text.toCharArray(); 
//  int shift = 3; 
//  for(int i = 0; i < letters.length; i++) {
//    int asciiLetter = (((int) letters[i] - 97 + shift) % 26) + 97; 
//    letters[i] = (char) asciiLetter; 
//  }
  
//  return letters; 
//}

//float x_old = 0.0; 
//float y_old = 0.0; 
//float z_old = 0.0; 
//float x = 200.0; 
//float y = 200.0; 
//float z = 00.0; 
//float r = 100.0; 
//float a = 1.0; 
//float h = 100.0; 
//void setup() {
//  size (400,400, P3D); 
//  String secret = "this is a super big secret";
//  secret = secret.toLowerCase(); 
//  String encryptedSecret = new String(caesarEncode(secret)); 
//  println(encryptedSecret); 
//  x = z * cos(6 * z) * 50; 
//  y = -z * sin(6 * z) * 50; 
//  z += PI/256;
//}
 //<>//
float x_old = 0.0; 
float y_old = 0.0; 
float z_old = 0.0; 
float x = 200.0; 
float y = 200.0; 
float z = 00.0; 
float r = 100.0; 
float a = 1.0; 
float h = 100.0; 
float t = 0.0; 
void setup(){
  //size(800,800,P3D);
  fullScreen(P3D); 
  strokeWeight(3);
  //x = z * cos(6 * z) * 50; 
  //y = -z * sin(6 * z) * 50; 
  z += PI/256;
  y = 0.0; 
  frameRate(200);
  //angling the camera to get a better view of the tornado
  camera(50, 100, 200, 0, 0, 0, 0, -1, 0);

}
void draw(){
  //making background white
  //background(255);
  //so the z value in the eye is setting how close / far the viewer is looking at the object from
  //so it's a pretty arbitrary value
  //isolate coordinate system for A point
  pushMatrix();
  drawAxes(60); 
  if (y < 7 * PI) {
    x_old = x; 
    y_old = y; 
    z_old = z; 
    
    //x = t * cos(6 * t) * 10; 
    //z = -t * sin(6 * t) * 10; 
    //y = t;
    //t += PI/512; 
    
    x = 0.5 * exp(0.15*t)* cos(6*t) * 10; 
    z = 0.5 * exp(0.15*t)* sin(6*t) * 10; 
    y = t;
    t += PI/256; 
    
    stroke(0); 
    strokeWeight(4); 
    println(x + " " + (y * 10 - (height / 6)) + " " + z); 

    //point(x,y * 20 - 150,z); 
    point(x,(y * 15 - (height / 6)),z); 

    //line(x_old, y_old, z_old * 10, x,y,z*10); 

  }
  popMatrix();
}
void drawAxes(float size){
  //X  - red
  stroke(192,0,0);
  line(0,0,0,size,0,0);
  //Y - green
  stroke(0,192,0);
  line(0,0,0,0,size,0);
  //Z - blue
  stroke(0,0,192);
  line(0,0,0,0,0,size);
}
