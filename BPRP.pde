import peasy.*;
PeasyCam cam;

int w;
float dif;
int scale;
float a;

void setup() {
  fullScreen(P3D);
  cam = new PeasyCam(this, 125);
  w = 40;
  dif = 0.01;
  scale = 20;
  a = 0;
}

void draw() {
   background(100);
   rotateX(PI/2);
   rotateZ(3*PI/2);
   
   strokeWeight(5);
   stroke(0, 100, 0);
   line(-w, 0, 0, w, 0, 0);
   stroke(100, 0, 0);
   line(0, -w / 2, 0, 0, w, 0);
   stroke(0, 0, 100);
   line(0, 0, -w, 0, 0, w);
   
   fill(255);
   stroke(255);
   
   beginShape(TRIANGLE_STRIP);
   
   for (float x = -1; x <= 1; x += dif) {
     for (float y = x * x; y <= 1; y += dif) {
        vertex(x * scale, y * scale, (1-y) * scale);
        vertex((x+dif) * scale, y * scale, (1-y) * scale);
     }
   }
   
   endShape();
   
   fill(0, 100, 0);
   stroke(0, 100, 100);
   beginShape(TRIANGLE_STRIP);
   
   for (float x = -1; x <= 1; x += dif) {
      vertex(x * scale, x*x * scale, (1-x*x) * scale - 1);
      vertex(x * scale, x*x * scale, 0);
   }
   endShape();
   
   //xy-plane moving
   fill(200);
   noStroke();
   
   float z = a - 1;
   translate(0, 0, z);
   box(2 * w, 2 * w, 1);
   
   noFill();
   beginShape();
   stroke(0);
   for (float x = -sqrt(1-z/scale) - dif * 2; x <= sqrt(1-z/scale) + dif * 2; x += dif) {
     vertex(x * scale, x*x * scale, 1);
   }
   endShape(CLOSE);
   
   translate(0, 0, -z);
   
   //xz-plane moving
   fill(200);
   noStroke();
   
   float y = a - 1;
   translate(0, y, 0);
   box(2 * w, 1, 2*w);
   
   noFill();
   beginShape();
   stroke(0);
   for (float x = -sqrt(y / scale) - dif * 8; x <= sqrt(y / scale) + dif * 8; x += dif) {
     vertex(x * scale, 1, (1-y/scale)*scale);
   }
   for (float x = -sqrt(y / scale) - dif * 8; x <= sqrt(y / scale) + dif * 8; x += dif) {
     vertex(- x * scale, 1, 0);
   }
   endShape(CLOSE);
   
   translate(0, -y, 0);
   
   //yz-plane moving
   fill(200);
   noStroke();
   
   float x = a - w/2;
   translate(x, 0, 0);
   box(1, 2*w, 2*w);
   
   noFill();
   beginShape();
   stroke(0);
   strokeWeight(10);
   for (float zt = 0 - 2*dif; zt <= 1-x*x / (scale*scale) + 2*dif; zt += dif) {
     vertex(-1, (1-zt)*scale, zt*scale);
   }
   
   for (float zt = 0 - 2*dif; zt <= 1-x*x / (scale*scale) + 2*dif; zt += dif) {
     vertex(-1, (1-zt)*scale, 0);
   }
   endShape();
   
   translate(-x, 0, 0);
   if (a < 2*scale + 1) {
     a += 0.1;
   } else {
     a = 0;
   }
}
