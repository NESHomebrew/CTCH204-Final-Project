public class Background{
  PImage bg = new PImage();

  Background(){
    bg = loadImage("newbg.png");
  }
  void update(){
    draw();
  }
  void draw(){
    imageMode(CENTER);
    image(bg,width/2,height/2,640,480);
  }
}
