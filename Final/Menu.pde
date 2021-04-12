public class Menu {
  Slider volSlider;
  Slider speedSlider;
  boolean showMenu;
  Button[] buttons = new Button[5];

  Menu(){
    volSlider = new Slider(width/2, height/2 - 50, "Volume");
    speedSlider = new Slider(width/2 + 80, height/2 - 50, "Speed");
    showMenu = false;
    buttons[0] = new Button (width/4, height/2 - 60, "New Game");
    buttons[1] = new Button (width/4, height/2 - 28, "Load Game");
    buttons[2] = new Button (width/4, height/2 + 4, "Save Game");
    buttons[3] = new Button (width/4, height/2 + 68, "Resume");
    buttons[4] = new Button (width/4, height/2 + 100, "Quit");
  }

  void update() {
    fadeOpacity = 200;
    cursor.currentCursor = 3;
    volSlider.update();
    speedSlider.update();
    buttons[0].update();
    buttons[1].update();
    buttons[2].update();
    buttons[3].update();
    buttons[4].update();
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
    buttons[0].draw();
    buttons[1].draw();
    buttons[2].draw();
    buttons[3].draw();
    buttons[4].draw();

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

    textAlign(LEFT);
    textFont(pro18);
    textSize(18);
    text("Thank-you for playing the Demo of Trevor's Quest.", 3*width/8, 2*height/3+24);
    text("This is my first attempt at building a Point-N-Click", 3*width/8, 2*height/3+48);
    text("interface from scratch. It was a lot of fun and hard", 3*width/8, 2*height/3+72); 
    text("work. I hope you had a few laughs.", 3*width/8, 2*height/3+96);
    text("Brad Bateman    2021", 3*width/8, 2*height/3+136);
     
  }
}