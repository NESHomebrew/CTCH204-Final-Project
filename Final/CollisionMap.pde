///////////////////////////////////////////////////////
///
///     CollisionMap Class
///
///     This is the area where the character is allowed to walk
///
///////////////////////////////////////////////////////

public class CollisionMap {
  ArrayList<PVector> vertices = new ArrayList<PVector>();

  CollisionMap(int[] mapData) {
    for( int i = 0; i < mapData.length; i+=2){
      vertices.add( new PVector(mapData[i], mapData[i+1],0) );
    }
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