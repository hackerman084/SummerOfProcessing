
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


//void draw(){
//  camera(0, 0, 300, 0, 0, 0, 0, -1, 0);
//  float a = 100;  
 
//    // X axis points right
//    stroke(1, 0, 0); //<>//
//    line(a, 0, 0, 0, 0, 0);
 
//    // Y axis points up
//    stroke(0, 1, 0);
//    line(0, 0, 0, 0, a, 0);
 
//    // Z axis points forewards (towards viewer)
//    stroke(0, 0, 1);
//    line(0, 0, 0, 0, 0, a);
//  //x = ((h - z) / h) * r * cos(a * z); 
//  //y = ((h - z) / h) * r * sin(a * z); 
  //if (z < 2 * PI) {
  //  x_old = x; 
  //  y_old = y; 
  //  z_old = z; 
  //  println(x + " " + y + " " + z*50); 
  //  x = z * cos(6 * z) * 70; 
  //  y = -z * sin(6 * z) * 70; 
  //  z += PI/16;
  //  stroke(0); 
  //  strokeWeight(4); 
  //  //point(x,y,z); 
  //  line(x_old, y_old, z_old * 10, x,y,z*10); 

  //}
 
  
  
  
//}

//PVector a = new PVector(100,50,-100);
float x_old = 0.0; 
float y_old = 0.0; 
float z_old = 0.0; 
float x = 200.0; 
float y = 200.0; 
float z = 00.0; 
float r = 100.0; 
float a = 1.0; 
float h = 100.0; 
void setup(){
  size(400,400,P3D);
  strokeWeight(3);
    x = z * cos(6 * z) * 50; 
  y = -z * sin(6 * z) * 50; 
  z += PI/256;
  frameRate(30);
}
void draw(){
  //making background white
  //background(255);
  camera(0, 0, 300, 0, 0, 0, 0, -1, 0);

  //isolate coordinate system for A point
  pushMatrix();
  drawAxes(60); 
  if (y < 2 * PI) {
    x_old = x; 
    y_old = y; 
    z_old = z; 
    println(x + " " + y + " " + z*50); 
    //x = z * cos(6 * z) * 70; 
    //y = -z * sin(6 * z) * 70; 
    //z += PI/256;
    x = y * cos(6 * y) * 10; 
    z = -y * sin(6 * y) * 10; 
    y += PI/256;
    stroke(0); 
    strokeWeight(4); 
    point(x,y * 20,z); 
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
