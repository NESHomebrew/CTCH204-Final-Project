

public class Cursor{
  PImage[] cursors = new PImage[4];
  int x,y;
  int currentCursor = 0;
  int prevCursor = 0;

  Cursor() {
      cursors[0] = loadImage("point.png");
      cursors[1] = loadImage("walk.png");
      cursors[2] = loadImage("talk.png");
      cursors[3] = loadImage("arrow.png");
  }
  void update(){
    x = mouseX;
    y = mouseY;
    draw();
  }
  void draw(){
    image(cursors[currentCursor],x,y+8);
  }
}
