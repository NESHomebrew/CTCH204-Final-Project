import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.video.*;

final float MAX_WALKING_SPEED = 10.0;
final float MAX_VOLUME = 60.0;

PFont sans40;
PFont sans24;
PFont old64;
PFont old24;
PFont alg20;

Minim minim;
AudioPlayer bgm;

Topbar bar;
Navbar nav;
Cursor cursor;
Background bg;
Trevor trev;
Menu menu;

enum GameState {
  LOADING, 
  TITLE, 
  PLAYING, 
  MENU, 
  END
}

GameState currentState = GameState.LOADING; // init gamestate
String loadingMessage;
String ellipsis = "";
float progressBar;
float fadeOpacity = 0;    // 
boolean doFade = false;   // Initiates a fade
float currentTime;        // Used in various places where delays are needed
int index = 0;                // index used for various things

void setup() {
  //fullScreen();
  size(800, 600);
  surface.setTitle("Trevor's Quest");

  thread("loading");
  noCursor();
  noSmooth();
}

void draw() {
  background(0);

  if (currentState == GameState.LOADING) {
    drawLoadingScreen();
  }

  if (currentState == GameState.TITLE) {
    fill(255);
    textFont(sans40);
    textSize(40);
    text(titleArray[index], width/2, height/2);

    if (fadeOpacity == 0.0) {doFade=true;}
    if(index == 2 && fadeOpacity > 255) {
      currentState = GameState.PLAYING;
    }
    if(index < 2 && fadeOpacity > 255){index++;}
  }

  // Updates in desired draw order

  if (currentState == GameState.PLAYING && !menu.showMenu) {
    bg.update();
    trev.update();
    bar.update();
    nav.update();
    cursor.update(); 
  }

  if (currentState == GameState.PLAYING && menu.showMenu) {
    bg.draw();
    trev.draw();
    bar.draw();
    nav.draw();
  }

  fade(); // Always draw the fade last, as it will fade everything

  if (currentState == GameState.PLAYING && menu.showMenu) {
    menu.update();
    cursor.update(); 
  }
}

void loading() {
  // initialize things
  loadingMessage = "Initializing Objects";
  bar = new Topbar();
  nav = new Navbar();
  cursor = new Cursor();
  bg = new Background();
  menu = new Menu();
  sans40 = new PFont();
  sans40 = loadFont("ComicSansMS-40.vlw");
  sans24 = new PFont();
  sans24 = loadFont("ComicSansMS-24.vlw");
  old64 = new PFont();
  old64 = loadFont("OldEnglishTextMT-64.vlw");
  old24 = new PFont();
  old24 = loadFont("OldEnglishTextMT-24.vlw");
  alg20 = new PFont();
  alg20 = loadFont("Algerian-20.vlw");

  delay(1000);
  
  // audio
  progressBar = 0.1;
  loadingMessage = "Loading Audio";
  minim = new Minim(this);
  bgm = minim.loadFile("lofi.mp3");  
  bgm.loop();
  bgm.setGain(-(MAX_VOLUME*menu.volSlider.level));
  delay(1000);

  // images
  progressBar = 0.25;
  loadingMessage = "Loading Images";
  trev = new Trevor();

  // video
  progressBar = 0.5;
  loadingMessage = "Loading Video";
  delay(2000);
  progressBar = 1.0;
  loadingMessage = "Done!";

  doFade = true;  // Initiate fade
  while (doFade) delay(0); // Pause the thread till the fading is done

  currentState = GameState.PLAYING; //TITLE
}

///////////////////////////////////////////////////////
///
///     drawLoadingScreen() Function
///
///     This function is called every frame. To initiate a fade
///     one must set the doFade bool to true. The function will
///     then automatically fade out to black, then fade back in.
///
///////////////////////////////////////////////////////-

void drawLoadingScreen() {

  // Increment ellipsis
  if (frameCount%20 == 0) {
    ellipsis = ellipsis.equals("....") ? "" : ellipsis ;
    ellipsis += ".";
  }
  if (progressBar == 1.0) {
    ellipsis = "";
  }

  textAlign(CENTER);
  textSize(18);
  fill(255);
  text(loadingMessage+ellipsis, width/2, height/2);

  // Draw Loading bar outline
  fill(100);
  stroke(255);
  strokeWeight(2);
  rectMode(CENTER);
  rect(width/2, height/2+30, 2*width/3, 30, 7);

  // Draw inside loading bar (scaled by progressBar var)
  noStroke();
  fill(#d70a53);
  rect(width/2, height/2+30, (2*width/3 - 8)*progressBar, 23, 4);
}

///////////////////////////////////////////////////////
///
///     fade() Function
///
///     This function is called every frame. To initiate a fade
///     one must set the doFade bool to true. The function will
///     then automatically fade out to black, then fade back in.
///
///////////////////////////////////////////////////////

void fade() {
  if (fadeOpacity >= 255) {
    doFade = false;
  }
  if (doFade) {         // Fade out
    fadeOpacity += 2; 
  } else {              // Fade in
    fadeOpacity = fadeOpacity > 0 ? fadeOpacity - 1 : 0.0;
  }


  // This is drawn every frame but because it is usually invisible
  // the user is none the wiser 
  noStroke();
  rectMode(LEFT);
  fill(0, fadeOpacity);
  rect(0, 0, width, height);
}

void keyPressed(){
  switch(key){
    case ESC:   // Prevent ESC from closing the window
      key = 0;
      menu.showMenu = !menu.showMenu; // ESC also closes and opens
      if(!menu.showMenu) {            // the config menu
        cursor.currentCursor = 1;
      }
      break;                         
  }
}
