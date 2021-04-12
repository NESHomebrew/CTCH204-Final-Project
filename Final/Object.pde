///////////////////////////////////////////////////////
///
///     Object class
///
///     This class is for each of the objects you can click on
///     in a screen. Each object gets a map of points, and text
///     arrays for action and info.
///
///////////////////////////////////////////////////////

public class Object {
  ArrayList<PVector> vertices = new ArrayList<PVector>();

  String[] action;
  String[] info;
  boolean actionStatus; // Used for checking if all the text has
  boolean infoStatus;   // been viewed
  int infoClick;
  int actionClick;

  Object(int[] mapData, String[] actions, String[] infos) {
    for( int i = 0; i < mapData.length; i+=2){
      vertices.add( new PVector(mapData[i], mapData[i+1],0) );
    }

    action = actions;
    info = infos;
    actionStatus = false;
    infoStatus = false;
    infoClick = 0;
    actionClick = 0;
  }

  void draw() {
    fill(255);
    beginShape();
    for(PVector v : vertices) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}