  public class InteractiveObjects {
    ArrayList<PVector> homeArea = new ArrayList<PVector>();
    int homeClickCount;
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
  
