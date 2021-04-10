public class Slider {
  int x, y;
  float level;
  String label;
  boolean overSlider;
  boolean locked;

  Slider(int setX, int setY, String text) {
    x = setX;
    y = setY;
    label = text;
    level = 0.5;
    overSlider = false;
    locked = false;
  }

  void update(){

    println(level);
    if (mouseX >= x - 10 &&     // right of the left edge AND
      mouseX <= x + 30 &&   // left of the right edge AND
      mouseY >= (y + 5) + 100 * level &&          // below the top AND
      mouseY <= (y + 15) + 100 * level) {
        overSlider = true;
      } else {
        overSlider = false;
      }
    draw(); 
  }

  void draw() {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text(label, x + 10, y - 10);
    // Bar
    rectMode(CORNER);   
    rect(x,y, 20, 120);
    // Slider
    fill(100);
    rectMode(CENTER);
    rect(x+10, (y+10) + 100*level, 40, 10);
  }
}