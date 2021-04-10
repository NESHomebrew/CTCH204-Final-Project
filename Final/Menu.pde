public class Menu {
  Slider volSlider;
  Slider speedSlider;
  boolean showMenu;

  Menu(){
    volSlider = new Slider(width/2, height/2 - 50, "Volume");
    speedSlider = new Slider(width/2 + 80, height/2 - 50, "Speed");
    showMenu = false;
  }

  void update() {
    fadeOpacity = 200;
    cursor.currentCursor = 3;
    draw();
  }

  void draw() {
    strokeWeight(3);
    stroke(150);
    fill(200);
    rectMode(CORNERS);
    rect(40,40,width-40,height-40);
    volSlider.draw();
    speedSlider.draw();

    textAlign(CENTER);
    textFont(old64);
    textSize(64);
    fill(150);
    text("Trevor's Quest", width/2, height/4);
    fill(0);
    text("Trevor's Quest", width/2+3, height/4+3);
    textFont(old24);
    textSize(24);
    text("The search for the tenured position", width/2, height/4 + 32);

  }
}