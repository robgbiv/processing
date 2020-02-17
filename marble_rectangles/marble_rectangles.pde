int marbleCount;
Marble[] marbles;

void setup() {
  size(1080, 1080);
  background(0);
  noLoop();

  marbleCount = 10;
  float marbleSize = 5;
  float marbleGap = marbleSize;
  marbles = new Marble[marbleCount];

  float startX = (width / 2) - ((marbleCount * marbleSize) + (marbleCount * marbleGap)) / 2;
  float startY = (height / 2);

  for (int i = 0; i < marbleCount; i++) {
    marbles[i] = new Marble(startX, startY, marbleSize);
    startX += marbleSize + marbleGap;
    marbles[i].show();
  }

  /* for (Marble marble : marbles) { */
  /*   marble.show(); */
  /* } */
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

  void show() {
    noStroke();
    noFill();
    rect(x, y, size, size);

    int[] layout = layouts();

    float cells = 5;
    float oneCell = size / cells;

    for (int i = 0; i < layout.length; i++) {
      if (layout[i] == 1) {
        if (i < 5) {
          noStroke();
          fill(255);
          rect(x, y, oneCell, oneCell);
        }
        if (i >= 5 && i < 10) {
          noStroke();
          fill(255);
          rect(x + 1, y + 1, oneCell, oneCell);
        }
        if (i >= 10 && i < 15) {
          noStroke();
          fill(255);
          rect(x + 2, y + 2, oneCell, oneCell);
        }
        if (i >= 15 && i < 20) {
          noStroke();
          fill(255);
          rect(x + 2, y + 3, oneCell, oneCell);
        }
        if (i >= 20 && i < 25) {
          noStroke();
          fill(255);
          rect(x + 2, y + 4, oneCell, oneCell);
        }
      }
    }
  }

  int[] layouts() {
    int[] layout1 = new int[25];
    layout1[0] = 1;
    layout1[1] = 0;
    layout1[2] = 0;
    layout1[3] = 0;
    layout1[4] = 0;
    layout1[5] = 0;
    layout1[6] = 1;
    layout1[7] = 0;
    layout1[8] = 0;
    layout1[9] = 0;
    layout1[10] = 0;
    layout1[11] = 0;
    layout1[12] = 1;
    layout1[13] = 0;
    layout1[14] = 0;
    layout1[15] = 0;
    layout1[16] = 0;
    layout1[17] = 1;
    layout1[18] = 0;
    layout1[19] = 0;
    layout1[20] = 0;
    layout1[21] = 0;
    layout1[22] = 1;
    layout1[23] = 0;
    layout1[24] = 0;
    return layout1;
  }
}
