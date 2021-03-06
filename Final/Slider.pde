///////////////////////////////////////////////////////
///
///     Slider class
///
///     Used for the volume and walking speed sliders
///
///////////////////////////////////////////////////////

public class Slider {
  int x, y;
  float level;        
  String label;       // Text above slider
  boolean overSlider; // If the mouse is over
  boolean locked;     // Locked for pulling up/down

  Slider(int setX, int setY, String text) {
    x = setX;
    y = setY;
    label = text;
    level = 0.6;
    overSlider = false;
    locked = false;
  }

  void update(){

    if (mouseX >= x - 10 &&                 // right of the left edge AND
      mouseX <= x + 30 &&                   // left of the right edge AND
      mouseY >= (y + 5) + 100 * level &&    // below the top AND
      mouseY <= (y + 15) + 100 * level) {   // above the bottom
        overSlider = true;
    } else {
      overSlider = false;
    } 
  }

  void draw() {
    fill(0);
    textFont(alg20);
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