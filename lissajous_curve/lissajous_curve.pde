float angle = 0;
int w = 64;
int cols, rows;
Curve[][] curves;

void setup() {
  //size(800, 800);
  fullScreen(P2D);
  smooth(8);
  cols = width / w - 1;
  rows = height / w - 1;
  curves = new Curve[rows][cols];
  
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      curves[j][i] = new Curve();
    }
  }
}

void showHeaders(int i, float centerX, float centerY, float diameter, float radius) {
    strokeWeight(1);
    stroke(50);
    ellipse(centerX, centerY, diameter, diameter);
    float x = radius * cos(angle * (i + 1) - HALF_PI);
    float y = radius * sin(angle * (i + 1) - HALF_PI);
    strokeWeight(8);
    stroke(255);
    point(centerX + x, centerY + y);
    
    stroke(255, 50);
    strokeWeight(1);
    line(centerX + x, 0, centerX + x, height);
    
    for (int j = 0; j < rows; j++) {
      curves[j][i].setX(centerX + x);
    }
}

void draw() {
  background(0);
  float d = w - 10;
  float r = d / 2;
  
  
  noFill();
  stroke(255);
  for (int i = 0; i < cols; i++) {
    float centerX = w + i * w + w / 2;
    float centerY = w / 2;
    //strokeWeight(1);
    //stroke(50);
    //ellipse(centerX, centerY, d, d);
    //float x = r * cos(angle * (i + 1) - HALF_PI);
    //float y = r * sin(angle * (i + 1) - HALF_PI);
    //strokeWeight(8);
    //stroke(255);
    //point(centerX + x, centerY + y);
    
    //stroke(255, 50);
    //strokeWeight(1);
    //line(centerX + x, 0, centerX + x, height);
    
    showHeaders(i, centerX, centerY, d, r);
    
    //for (int j = 0; j < rows; j++) {
    //  curves[j][i].setX(centerX + x);
    //}
  }
  
  for (int j = 0; j < rows; j++) {
    float centerX = w / 2;
    float centerY = w + j * w + w / 2;
    strokeWeight(1);
    stroke(255);
    ellipse(centerX, centerY, d, d);
    float x = r * cos(angle * (j + 1) - PI / 2);
    float y = r * sin(angle * (j + 1) - PI / 2);
    strokeWeight(8);
    stroke(255);
    point(centerX + x, centerY + y);
    
    stroke(255, 50);
    strokeWeight(1);
    line(0, centerY + y, width, centerY + y);
    
    for (int i = 0; i < cols; i++) {
      curves[j][i].setY(centerY + y);
    } 
  }
    
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      curves[j][i].addPoint();
      curves[j][i].show();
    }
  }

  angle -= 0.001;
  
  if (angle < -TWO_PI) {
    for (int j = 0; j < rows; j++) {
      for (int i = 0; i < cols; i++) {
        curves[j][i].reset();
      }
    }
    angle = 0;
  }
  
}
