///////////////////////////////////////////////////////
///
///     Button Class
///
///     Handles stuff related to the menu buttons
///
///////////////////////////////////////////////////////

public class Button {
  int x,y;
  String label;
  boolean overButton;

  Button(int setX, int setY, String text ) {
    x = setX;
    y = setY;
    label = text;
  }

  void update() {
    if (mouseX >= x - 70 &&     // right of the left edge AND
      mouseX <= x + 70 &&       // left of the right edge AND
      mouseY >= y - 6 - 14 &&   // below the top AND
      mouseY <= y - 6 + 14) {   // above the bottom
      overButton = true;
    } else {
      overButton = false;
    }
    draw(); 
  }

  void draw(){

    // Button
    fill(100);
    rectMode(CENTER);   
    rect(x,y-6, 140, 28);

    // Text
    fill(0);
    textFont(alg20);
    textSize(20);
    textAlign(CENTER);
    text(label, x, y);
  }
}