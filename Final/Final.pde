import processing.video.*;
import processing.sound.*;

Topbar bar;
Navbar nav;
Cursor cursor;
Background bg;
Trevor trev;
Npc[] npc;

enum GameState {
  LOADING,
  TITLE,
  MENU,
  PLAYING,
  END
}

GameState currentState = GameState.LOADING; // init gamestate
String loadingMessage;
String ellipsis = "";
float progressBar;
float fadeOpacity = 0;
boolean doFade = false;

void setup(){
  size(800,600, P2D);
  surface.setTitle("Trevor's Quest");

  loadingMessage = "Initializing Objects";
  thread("loading");

}

void draw(){
  background(0);


  if(currentState == GameState.LOADING){
    drawLoadingScreen();
  }

  // Updates in desired draw order
  // bg.update();
  // trev.update();
  // bar.update();
  // nav.update();
  // cursor.update();
  fade();
}

void loading(){
  bar = new Topbar();
  nav = new Navbar();
  cursor = new Cursor();
  bg = new Background();
  trev = new Trevor();

  progressBar = 0.1;
  delay(2000);
  progressBar = 0.25;
  loadingMessage = "Loading Images";
  delay(2000);
  progressBar = 0.5;
  loadingMessage = "Loading Video";
  delay(2000);
  progressBar = 0.75;
  loadingMessage = "Loading Sound";
  delay(2000);
  progressBar = 1.0;
  loadingMessage = "Done!";
  doFade = true;
  delay(3000);

  currentState = GameState.TITLE;
}

void drawLoadingScreen(){
  if(frameCount%20 == 0){
    ellipsis = ellipsis.equals("....") ? "" : ellipsis ;
    ellipsis += ".";
  }
  if(progressBar == 1.0) {
    ellipsis = "";
  }
  textAlign(CENTER);
  textSize(18);
  fill(255);
  text(loadingMessage+ellipsis,width/2,height/2);
  fill(100);
  stroke(255);
  strokeWeight(2);
  rectMode(CENTER);
  rect(width/2,height/2+30,2*width/3,30,7);
  noStroke();
  fill(#d70a53);
  rect(width/2,height/2+30,(2*width/3 - 8)*progressBar,23,4);
}

void fade(){
  if(doFade){
    fadeOpacity += 2;
  }
  if(fadeOpacity >= 255) {
    doFade = false;
  }
  rectMode(LEFT);
  fill(0,fadeOpacity);
  rect(0,0,width,height);
}
