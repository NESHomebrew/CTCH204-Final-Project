Topbar bar;
Navbar nav;
Cursor cursor;
Background bg;
Trevor trev;
Npc[] npc;

enum GameState {
  TITLE,
  MENU,
  PLAYING,
  END
}

GameState currentState = GameState.TITLE; // init gamestate

void setup(){
  size(800,600);

  bar = new Topbar();
  nav = new Navbar();
  cursor = new Cursor();
  bg = new Background();
  trev = new Trevor();

}

void draw(){
  
}
