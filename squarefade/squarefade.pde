int gridSize = 6;
int numSquares = gridSize * gridSize;
Square[] squares;
float center;
float maxDivisible;
float gap;

void setup() {
  size(1296, 1296);
  colorMode(HSB, 100, 100, 100, 100);
  background(96);
  noLoop();
  
  maxDivisible = width / (gridSize * 2 + 1);
  gap = maxDivisible;
  center = width / 2;
  
  drawSquares();  
}

void drawSquares() {
  squares = new Square[numSquares];
  float initialOffset = maxDivisible;
  int squareNumber = 0;
  
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      int colour = i % 100;
      float startX = initialOffset + (j * maxDivisible) + (j * gap);
      float startY = initialOffset + (i * maxDivisible) + (i * gap); 
      squares[squareNumber] = new Square(startX, startY, maxDivisible, colour);
      squares[squareNumber].display();
      squares[squareNumber].fade();
      squareNumber++;
    }
  }
}

void draw() {
}

class Square {
  float x;
  float y;
  float size;
  int colour;
  
  Square (float xTmp, float yTmp, float sizeTmp, int colourTmp) {
    x = xTmp;
    y = yTmp;
    size = sizeTmp;
    colour = colourTmp;
  }
  
  void display() {
    noStroke();
    fill(colour, 100, 100, 70);
    rect(x, y, size, size);
  }
  
  void fade() {
    noStroke();
    fill(50, 100, 100, 50);
    rect(x + 10, y + 10, size, size);
  }
}
