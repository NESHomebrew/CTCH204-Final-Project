public class Navbar{
  boolean visible;

  void update(){
    if (mouseY < 30) {visible = true;}
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

        // Draw a highlighting box if hovering over a panel
        if (mouseX >= i*200 &&     // right of the left edge AND
          mouseX <= i*200+200 &&   // left of the right edge AND
          mouseY >= 30 &&          // below the top AND
          mouseY <= 130) {          // above the bottom
          noFill();
          strokeWeight(2);
          stroke(255);
          rect(0,31,198,98);
          }
        popMatrix();
      }
    }
  }
}
