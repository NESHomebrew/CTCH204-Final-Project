////////////////////////////////////////////
///
///     CTCH204 - Final Project
///
///     Program:  Final.pde et al
///     Title: "Trevor's Quest"
///     Author: Bradley Bateman - 200262023
///     Email: batemanb@uregina.ca
///     Date: Apr 12/2021
///
////////////////////////////////////////////
//
//      IMPORT/CONSTANTS
//
////////////////////////////////////////////

import ddf.minim.*;

final float MAX_WALKING_SPEED = 10.0;
final float MAX_VOLUME = 60.0;

////////////////////////////////////////////
//
//      DEFINES
//
////////////////////////////////////////////

// Fonts
PFont sans40;
PFont sans24;
PFont old64;
PFont old24;
PFont alg20;
PFont alg24;
PFont pro18;
PFont pro24;

// Audio
Minim minim;
AudioPlayer bgm;
AudioPlayer jingle;

// Classes
Topbar bar;
Navbar nav;
Cursor cursor;
Background bg;
Trevor trev;
Menu menu;
Lights lights;
InteractiveObjects intObj;

// Globals
enum GameState {
  LOADING, 
  TITLE, 
  PLAYING,
  END
}

GameState currentState = GameState.LOADING; // init gamestate
String currentText = "";
String loadingMessage;
String ellipsis = "";
float progressBar;
float fadeOpacity = 0;    // 
boolean doFade = false;   // Initiates a fade
float currentTime;        // Used in various places where delays are needed
float textTimer;
int index = 0;            // index used for various things

////////////////////////////////////////////
//
//      setup() function
//      
//      I split the setup function into another thread
//      so there wouldn't be excessive delay without
//      any graphics on screen.
//
////////////////////////////////////////////

void setup() {
  //fullScreen();
  size(800, 600);
  surface.setTitle("Trevor's Quest");

  pro18 = new PFont();
  pro18 = loadFont("ProcessingSansPro-Semibold-18.vlw");

  thread("loading");  // Breaking loading off into another thread so I
                      // can represent the loading graphically
  noCursor();         // I have my own cursors 
  noSmooth();         // pixel art scaling doesn't want to be smooth
}

////////////////////////////////////////////
//
//      draw() function
//      
//      Using this as a game loop essentially. Draws different
//      things depending on the gamestate
//
////////////////////////////////////////////

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

    if (fadeOpacity == 0.0) {doFade=true;}  // Triggers fading on title
    if(index == 2 && fadeOpacity > 255) {
      currentState = GameState.PLAYING;
    }
    if(index < 2 && fadeOpacity > 255){index++;} // How many times 
  }                                              // has it faded?

  // Updates in desired draw order
  if (currentState == GameState.PLAYING && !menu.showMenu) {
    bg.update();
    lights.update();
    trev.update();
    image(bg.fg,width/2,500,640,80);
    bar.update();
    nav.update();
    cursor.update(); 
  }

  // If the menu is up, don't update, just draw
  if (currentState == GameState.PLAYING && menu.showMenu) {
    bg.draw();
    trev.draw();
    bar.draw();
    nav.draw();
  }

  if (currentState == GameState.END) {
    ending();
  }

  fade(); // Always draw the fade last

  if (currentState == GameState.PLAYING && menu.showMenu) {
    menu.update();
    cursor.update(); 
  }

  currentTime = millis(); // Updates time every frame
}

////////////////////////////////////////////
//
//      loading() function
//      
//      This runs as a separate thread and updates the
//      progress bar as things are loaded.
//
////////////////////////////////////////////

void loading() {
  // initialize things
  loadingMessage = "Initializing Objects";
  bar = new Topbar();
  nav = new Navbar();
  cursor = new Cursor();
  bg = new Background(bgCollision, bgObjects);
  menu = new Menu();
  lights = new Lights();
  intObj = new InteractiveObjects();

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
  alg24 = new PFont();
  alg24 = loadFont("Algerian-24.vlw");
  pro24 = new PFont();
  pro24 = loadFont("ProcessingSansPro-Semibold-24.vlw");

  delay(1000);
  
  // audio
  progressBar = 0.1;
  loadingMessage = "Loading Audio";
  minim = new Minim(this);
  bgm = minim.loadFile("lofi.mp3");  
  bgm.loop();
  bgm.setGain(-(MAX_VOLUME*menu.volSlider.level));

  jingle = minim.loadFile("jingle.mp3");  
  jingle.setGain(-(MAX_VOLUME*menu.volSlider.level));
  delay(1000);

  // images
  progressBar = 0.25;
  loadingMessage = "Loading Images";
  trev = new Trevor();
  delay(1000);

  // video - video was planned
  progressBar = 0.5;
  loadingMessage = "Loading Video";
  delay(1000);
  progressBar = 1.0;
  loadingMessage = "Done!";

  doFade = true;  // Initiate fade
  while (doFade) delay(0); // Pause the thread till the fading is done

  currentState = GameState.TITLE; // Set the Gamestate to title screen
}

///////////////////////////////////////////////////////
///
///     drawLoadingScreen() Function
///
///     This function is called every frame. To initiate a fade
///     one must set the doFade bool to true. The function will
///     then automatically fade out to black, then fade back in.
///
///////////////////////////////////////////////////////

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
  textFont(pro18);
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

///////////////////////////////////////////////////////
///
///     keyPressed() Function
///
///     By default ESC will close the processing window, this disables it
///     and adds the functionality of closing/opening the menu
///
///////////////////////////////////////////////////////

void keyPressed(){
  switch(key){
    case ESC:   // Prevent ESC from closing the window
      key = 0;
      if(currentState == GameState.PLAYING) {
        menu.showMenu = !menu.showMenu; // ESC also closes and opens
        if(cursor.currentCursor != 3) {
          cursor.prevCursor = cursor.currentCursor;
        }
      }
      if(!menu.showMenu) {            // the config menu
        cursor.currentCursor = cursor.prevCursor;
      }
      break;                         
  }
}

///////////////////////////////////////////////////////
///
///     ending() Function
///
///     This function is called every frame. To initiate a fade
///     one must set the doFade bool to true. The function will
///     then automatically fade out to black, then fade back in.
///
///////////////////////////////////////////////////////

void ending() {
  textFont(sans40);
  textAlign(CENTER);
  fill(255);
  text("Thanks for Playing",width/2,height/3);
  textFont(sans24);
  text("Score: " + bar.points + "/66",width/2,height/2);
}