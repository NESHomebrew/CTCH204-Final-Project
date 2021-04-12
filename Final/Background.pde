public class Background{
  PImage bg = new PImage();
  PImage fg = new PImage();
  CollisionMap map;
  Object[] objects;

  Background(int[] mapData, Object[] obj){
    bg = loadImage("newbg.png");
    fg = loadImage("foreground.png");
    map = new CollisionMap(mapData);

    objects = obj;
    
  }
  void update(){
    if(!polyPoint(map.vertices,trev.coords.x,trev.coords.y+32)) {
      trev.bounce();
    }
    draw();
  }
  void draw(){
    imageMode(CENTER);
    image(bg,width/2,height/2,640,480);

    // map.draw();
    // for(Object object : objects) {
    //   object.draw();
    // }
  }
}
