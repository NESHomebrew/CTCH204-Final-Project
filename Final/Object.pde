public class Object {
  ArrayList<PVector> vertices = new ArrayList<PVector>();

  String[] action;
  String[] info;
  boolean actionStatus;
  boolean infoStatus;
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