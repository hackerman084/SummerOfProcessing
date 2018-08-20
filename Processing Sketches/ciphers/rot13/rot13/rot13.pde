public String rot13Encode(String text) {
  char[] letters = text.toCharArray(); 
  int shift = 13; 
  for(int i = 0; i < letters.length; i++) {
    int asciiLetter = (((int) letters[i] - 97 + shift) % 26) + 97; 
    letters[i] = (char) asciiLetter; 
  }
  
  return new String(letters); 
}

Chimes chimes; 
int sum; 
void setup() {
  fullScreen(P3D);
  colorMode(HSB, 360, 100,100,100); 
  int size = height / 10;
  chimes = new Chimes(size); 
  frameRate(15);
  char[] text = rot13Encode("This is a secret").toCharArray();
  sum = 0; 
  for (char a : text){
    sum+= (int) a;  
  }
}

void draw() {
  background(0); 
  translate(width/2 - sqrt(chimes.chimes[0].size)/ 2, height/2 + sqrt(chimes.chimes[0].size)/2, 0);
  chimes.shift(sum / ((int) random(600,height)), sum/((int) random(600,height)), sum / ((int) random(600,height)));
}
