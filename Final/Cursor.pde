

public class Cursor{
  PImage[] cursors = new PImage[3];
  int x,y;
  int currentCursor = 0;

  Cursor() {
      cursors[0] = loadImage("point.png");
      cursors[1] = loadImage("walk.png");
      cursors[2] = loadImage("talk.png");
  }
  void update(){
    x = mouseX;
    y = mouseY+24;
    draw();
  }
  void draw(){
    image(cursors[currentCursor],x,y);
  }
}
