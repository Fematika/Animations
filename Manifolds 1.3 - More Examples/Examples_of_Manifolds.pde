import peasy.*;
PeasyCam cam;
float alpha, beta;

void setup() {
  fullScreen(P3D);
  cam = new PeasyCam(this, 300);
  alpha = 0;
  beta = 0;
}

void draw() {
  background(255);
  lights();
  //rotateX(alpha / 100 + PI / 4);
  //rotateZ((alpha + beta) / 100 + PI / 4);
  
  float x = 50 * cos(alpha/5);
  float y = 50 * sin(alpha/5);
  
  float xt = (25 * cos(beta/5) + 50) * cos(alpha/5);
  float yt = (25 * cos(beta/5) + 50) * sin(alpha/5);
  float zt = 25 * sin(beta/5);
  
  //draw S^1 on xy-plane
  strokeWeight(5);
  stroke(0);
  fill(0);
  line(0, 0, 1, x, y, 1);
  
  //draw point on xy
  strokeWeight(10);
  stroke(0);
  point(x, y, 1);
  
  //draw xy-plane
  //noStroke();
  //fill(100, 10);
  stroke(100);
  strokeWeight(5);
  noFill();
  box(200, 200, 1);
  
  //draw S^1 sideways
  strokeWeight(5);
  stroke(0, 100, 0);
  fill(0);
  line(x, y, 1, xt, yt, zt);
  
  //draw point on sideways
  strokeWeight(10);
  point(xt, yt, zt);
  
  //draw torus
  beginShape();
  noFill();
  strokeWeight(2);
  
  for (float alpha1 = 0; alpha1 < 2*PI; alpha1 += 0.01) {
    float xt1 = (25 * cos(50 * alpha1) + 50) * cos(alpha1);
    float yt1 = (25 * cos(50 * alpha1) + 50) * sin(alpha1);
    float zt1 = 25 * sin(50 * alpha1);
    vertex(xt1, yt1, zt1);
  }
  
  endShape();
  
  //animate
  alpha += 0.01;
  beta += 0.5;
}
