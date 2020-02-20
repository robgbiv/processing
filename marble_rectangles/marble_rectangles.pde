int marbleCount;
Marble[] marbles;

void setup() {
  size(1080, 1080);
  background(20);
  noLoop();

  marbleCount = 10;
  float marbleSize = 32;
  float marbleGap = marbleSize;
  marbles = new Marble[marbleCount];

  float startX = (width / 2) - ((marbleCount * marbleSize) + (marbleCount * marbleGap)) / 2;
  float startY = (height / 2) - (marbleSize / 2);

  noStroke();
  fill(240);
  /* rect(0, 0, width, height / 2); */

  for (int i = 0; i < marbleCount; i++) {
    marbles[i] = new Marble(startX, startY, marbleSize);
    startX += marbleSize + marbleGap;
    marbles[i].show();
  }
}

void draw() {
}

class Marble {
  float x;
  float y;
  float size;

  Marble(float xTmp, float yTmp, float sizeTmp) {
    x = xTmp;
    y = yTmp;
    size = sizeTmp;
  }

  color[] colors = {
    #c03221,
    #5bc0eb,
    #fde74c,
    #9bc53d,
    #fa7921
  };

  void show() {
    stroke(255);
    /* noFill(); */
    /* noStroke(); */
    /* int index = int(random(colors.length)); */
    /* fill(colors[index]); */
    noFill();
    rect(x, y, size, size);

    /* five(x, y, size); */
    int r = int(random(6));
    stroke(255);
    if (r == 0) {
      zero(x, y, size);
    } else if (r == 1) {
      one(x, y, size);
    } else if (r == 2) {
      two(x, y, size);
    } else if (r == 3) {
      three(x, y, size);
    } else if (r == 4) {
      four(x, y, size);
    } else if (r == 5) {
      five(x, y, size);
    }

    float cells = 5;
    float oneCell = size / cells;

  }

  void zero(float x, float y, float size) {
    float halfSize = size / 2;
    line(x, y, x + halfSize, y + halfSize);
    line(x, y + size, x + halfSize, y + halfSize);
  }

  void one(float x, float y, float size) {
    float halfSize = size / 2;
    line(x + halfSize, y, x + size, y + halfSize);
  }

  void two(float x, float y, float size) {
    float halfSize = size / 2;
    line(x + halfSize, y, x + halfSize, y + halfSize);
    line(x + halfSize, y + halfSize, x + size, y + halfSize);
  }

  void three(float x, float y, float size) {
    float halfSize = size / 2;
    line(x, y, x + halfSize, y + halfSize);
    line(x + halfSize, y + halfSize, x + size, y + halfSize);
  }

  void four(float x, float y, float size) {
    float halfSize = size / 2;
    line(x, y + size, x + size, y);
  }

  void five(float x, float y, float size) {
    float halfSize = size / 2;
    line(x, y, x + halfSize, y + halfSize);
    line(x + halfSize, y + halfSize, x + size, y + size);
    line(x + size, y, x + halfSize, y + halfSize);
    line(x + halfSize, y + size, x + size, y + size);
  }
}
