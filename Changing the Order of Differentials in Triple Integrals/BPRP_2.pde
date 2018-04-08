float dif;
float scale;

void setup() {
  fullScreen();
  
  dif = 0.01;
  scale = 150;
}

void draw() {
  background(255);
  strokeWeight(1);
  translate(width / 2, height / 2);
  line(0, -height /2, 0, height / 2);
  line(-width / 2, 0, width / 2, 0);
  
  noFill();
  strokeWeight(3);
  //xz
  stroke(100, 0, 0);
  beginShape();
  
  for (float x = -1; x <= 1; x += dif) {
    vertex(scale * x, -scale * (1 - x * x));
  }
  
  endShape();
  
  //yz
  stroke(0, 100, 0);
  beginShape();
  
  for (float y = 0; y <= 1; y += dif) {
    vertex(scale * y, -scale * (1 - y));
  }
  
  endShape();
  
  //xy
  stroke(0, 0, 100);
  beginShape();
  
  for (float x = -1; x <= 1; x += dif) {
    vertex(scale * x, -scale * x*x);
  }
  
  endShape();
  stroke(0);
  strokeWeight(2);
  line(-scale, 0, -scale, -scale);
  line(scale, 0, scale, -scale);
  
}
