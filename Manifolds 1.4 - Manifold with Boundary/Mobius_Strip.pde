import peasy.*;
PeasyCam cam;

float w, R;
float dt;
float a;

void setup() {
  fullScreen(P3D);
  cam = new PeasyCam(this, 85);
  dt = 0.001;
  
  w = 5;
  R = 10;
  a = 0;
}

void draw() {
  float scale = 0.25 * (5 - a);
  
  background(10, 50, 50);
  fill(100);
  stroke(255);
  strokeWeight(2);
  
  beginShape(TRIANGLE_STRIP);
  
  for (float t = 2 * (1 - a); t <= 2 * PI - 2 * (1 - a); t += dt) {
    float x = scale * (Mobius(t, -w, a)[0] + (1-a) * (t - w));
    float y = scale * (Mobius(t, -w, a)[1] + (1-a) * (t + w));
    float z = Mobius(t, -w, a)[2];
    vertex(x, y, z);
    
    x = scale * (Mobius(t, w, a)[0] + (1-a) * (t + w));
    y = scale * (Mobius(t, w, a)[1] + (1-a) * (t - w));
    z = Mobius(t, w, a)[2];
    vertex(x, y, z);
  }
  
  endShape(CLOSE);
  
  stroke(0, 255, 255);
  strokeWeight(5);
  noFill();
  
  beginShape();
  
  for (float t = 2 * (1 - a); t <= 2 * PI - 2 * (1 - a); t += dt) {
    float x = scale * (Mobius(t, -w, a)[0] + (1-a) * (t - w + 0.1));
    float y = scale * (Mobius(t, -w, a)[1] + (1-a) * (t + w - 0.1));
    float z = Mobius(t, -w, a)[2];
    vertex(x, y, z);
    x = scale * (Mobius(t, -w, a)[0] + (1-a) * (t - w + 0.1));
    y = scale * (Mobius(t, -w, a)[1] + (1-a) * (t + w + 0.1));
    z = Mobius(t, -w, a)[2];
    vertex(x, y, z);
  }
  
  endShape();
  
  beginShape();
  
  for (float t = 2 * (1 - a); t <= 2 * PI - 2 * (1 - a); t += dt) {
    float x = scale * (Mobius(t, w, a)[0] + (1-a) * (t + w - 0.1));
    float y = scale * (Mobius(t, w, a)[1] + (1-a) * (t - w + 0.1));
    float z = Mobius(t, w, a)[2];
    vertex(x, y, z);
    x = scale * (Mobius(t, w, a)[0] + (1-a) * (t + w + 0.1));
    y = scale * (Mobius(t, w, a)[1] + (1-a) * (t - w - 0.1));
    z = Mobius(t, w, a)[2];
    vertex(x, y, z);
  }
 
  endShape();
  
  if (a < 1) {
    a += 0.01;
  }
}

public float[] Mobius(float t, float s, float a) {
    float x = a * (R + s * cos(0.5 * t)) * cos(t);
    float y = a * (R + s * cos(0.5 * t)) * sin(t);
    float z = a * s * sin(0.5 * t);
    float[] list = {x, y, z};
    return list;
}
