public class Slider {
  int x, y;
  float level;
  String label;

  Slider(int sx, int sy, String text) {
    x = sx;
    y = sy;
    label = text;
    level = 0.5;
  }

  void update(){

    draw();
  }

  void draw() {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text(label, x + 10, y - 10);
    rectMode(CORNER);
    rect(x,y, 20, 120);

    fill(100);
    rectMode(CENTER);
    rect(x+10, (y+10) + 100*level, 40, 10);
    fill(200);
  }
}