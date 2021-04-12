///////////////////////////////////////////////////////
///
///     InteractiveObjects Class
///
///     This is for special objects that require additional handling
///     when they are interacted with.
///
///////////////////////////////////////////////////////

public class InteractiveObjects {
  int homeClickCount;
  ArrayList<PVector> homeArea = new ArrayList<PVector>();
  ArrayList<PVector> doorArea = new ArrayList<PVector>();

  InteractiveObjects() {
    int homeClickCount = 0;
    int doorClickCount = 0;

    for( int i = 0; i < home.length; i+=2){
      homeArea.add( new PVector(home[i], home[i+1],0) );
    }
    for( int i = 0; i < door.length; i+=2){
      doorArea.add( new PVector(door[i], door[i+1],0) );
    }
  }
}

