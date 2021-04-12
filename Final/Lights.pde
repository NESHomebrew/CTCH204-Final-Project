///////////////////////////////////////////////////////
///
///     Lights Class
///
///     This is the fancy lighting that turns on when the 
///     Google Home is activated.
///
///////////////////////////////////////////////////////

public class Lights {
  color colour;
  float angle,faderR,faderG,faderB;
  boolean lightsOn;

  Lights(){
    angle = 0.0;
    lightsOn = false;
    colour = 0;
  }

  void update() {
    faderR = (sin(angle) +1)/2;
    faderG = (cos(angle) +1)/2;
    faderB = (sin(angle) +1)/2;
    colour = color(int(faderR*255),int(faderG*255),int(faderB*255));
    angle += 0.02;   
    draw();                      
  }

  void draw() {
    if(lightsOn) {
      fill(colour,50);
      rectMode(CENTER);
      rect(width/2,height/2,640,480);
      stroke(colour,200);
      strokeWeight(3);
      noFill();
      beginShape();
        vertex(262,195);
        vertex(300,206);
        vertex(300,306);
        vertex(262,333);
        vertex(262,195);
      endShape();
    }
  }
}