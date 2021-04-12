public class Navbar{
  boolean visible;
  int mouseRegion = 0;

  void update(){
    if (mouseY < 60) {visible = true;}
    if (visible && mouseY > 130) { visible = false;}

    draw();
  }
  void draw(){
    if(visible){
      rectMode(CORNER);
      for(int i=0;i<4;i++){
        noStroke();
        pushMatrix();
        translate(i*200,0);
        fill(50);
        rect(0,31,200,100);
        fill(100);
        rect(1,32,198,98);
        fill(150);
        rect(2,33,196,96);
        fill(200);
        rect(3,34,194,94);

        if (!menu.showMenu) {
          // Draw a highlighting box if hovering over a panel
          if (mouseX >= i*200 &&     // right of the left edge AND
            mouseX <= i*200+200 &&   // left of the right edge AND
            mouseY >= 30 &&          // below the top AND
            mouseY <= 130) {          // above the bottom
            noFill();
            strokeWeight(2);
            stroke(255);
            rect(0,31,198,98);
            mouseRegion = i;
          } 
          if (mouseY < 30) {
            mouseRegion = 99;
          }
        }
        popMatrix();
      }
      textAlign(CENTER);
      textFont(pro24);
      textSize(24);
      fill(100);
      text("ACTION", width/8, 80);
      text("MOVE", 3*width/8, 80);
      text("INFO", 5*width/8, 80);
      text("MENU", 7*width/8, 80);
    }
  }
}
