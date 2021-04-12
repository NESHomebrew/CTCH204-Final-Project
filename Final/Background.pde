///////////////////////////////////////////////////////
///
///     Background Class
///
///     One for each screen of the game. Is passed a collision
///     map for the walking areas, as well as an array object
///     for interactions.
///
///////////////////////////////////////////////////////

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

  // Bounces back if hit a boundary
  void update(){
    if(!polyPoint(map.vertices,trev.coords.x,trev.coords.y+32)) {
      trev.bounce();
    }
    draw();
  }

  // Draws Background and object text
  void draw(){
    imageMode(CENTER);
    image(bg,width/2,height/2,640,480);

    fill(255);
    textFont(sans24);
    textSize(24);
    textAlign(CENTER);
    if (currentTime-textTimer < 3000) {
      text(currentText, width/2, height - 24);
    }

    // Uncomment these lines to view boundaries
    // map.draw();
    // for(Object object : objects) {
    //   object.draw();
    // }
  }
}
