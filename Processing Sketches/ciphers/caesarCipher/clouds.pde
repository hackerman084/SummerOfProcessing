public class Circle{
  float centerX; 
  float centerY; 
  int radius; 
 float brightness;
 float z; 
 float thickness; 
  
  public Circle(float x, float y, float z,  int radius, float brightness){
    this.centerX = x; 
    this.centerY = y; 
    this.radius = radius; 
    this.brightness = brightness; 
    this.z = z; 
  }
  
  public void drawCircle(){
    noFill(); 
    strokeWeight((int)random(1,5)); 
    stroke(200, 100, brightness); 
    translate(0,0,z); 
    ellipse(centerX, centerY, radius, radius); 
  }
  
  public void flash(int hue){
    noStroke(); 
    
    fill(hue, 100, 100, (int)random(300)); 
    //translate(0,y,0);
    translate(0,0,z); 

    generateCluster((int) random(2,6), hue); 
    generateCluster((int) random(2,6), hue+20); 
    generateCluster((int) random(2,6), hue-40); 
  }
  
  private void generateCluster(int offset, int hue){
    ellipse(centerX, centerY, radius, radius);
    for (int i = 0; i < 5; i++){
      if (i % 2 == 0) {
         noFill();
         strokeWeight((int) random(1,3)); 
         stroke(hue, 100, 100, (int)random(300));          
      }
      else {
        fill(hue, 100, 100, (int)random(300)); 
        noStroke();
      }
      
      ellipse(centerX+offset+i, centerY+offset, radius-offset-i, radius-offset-i); 

    }
     for (int i = 0; i < 5; i++){
      fill(hue, 100, 100, (int)random(300)); 
      noStroke(); 
      ellipse(centerX+offset-i, centerY-offset, radius-offset-i, radius-offset-i);    
    }
    
    for (int i = 0; i < 6; i++){
      fill(hue, 100, 100, (int)random(300)); 
      noStroke(); 
      ellipse(centerX+offset-(int) random(0,15), centerY-5, radius+i/3, radius+i/3);
      ellipse(centerX+offset+(int) random(0,15), centerY-5, radius+i/3, radius+i/3);    

    }
    
    for (int i = 0; i < 6; i++){
      if (i % 3 == 0){
        noFill();
        strokeWeight((int) random(1,3)); 
        stroke(hue, 100, 100, (int)random(300)); 
      }
      else {
        fill(hue, 100, 100, (int)random(300)); 
        noStroke(); 
      }  
      ellipse(centerX+offset-(int) random(0,15), centerY-(int) random(0,10), radius, radius); 
      ellipse(centerX+(int) random(0,15), centerY-(int) random(0,15), radius, radius); 

    }
  }
  
}
