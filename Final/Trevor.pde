///////////////////////////////////////////////////////
///
///     Trevor class
///
///     Pixelart credit
///     https://opengameart.org/content/pixelated-employee-character
///
///     Everything for the player character
///
///////////////////////////////////////////////////////

public class Trevor {
  PVector coords = new PVector();
  PVector target = new PVector();;
  int idleFrame;
  int walkingFrame;
  boolean facingRight;
  boolean walking;
  float walkingSpeed;

  PImage[] idleRight;
  PImage[] walkingRight;
  PImage[] idleLeft;
  PImage[] walkingLeft;

  Trevor(){
    coords.x = width/2;
    coords.y = width/2;
    target.x = coords.x;
    target.y = coords.y;
    idleFrame = 0;
    walkingFrame = 0;
    facingRight = true;
    walking = true;
    walkingSpeed = 0.3;

    PImage temp = loadImage("trev.png");
    idleRight = new PImage[4];
    idleLeft = new PImage[4];
    walkingRight = new PImage[8];
    walkingLeft = new PImage[8];

    // Getting individual frames from one big one
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 3; j++) {
        if(j==0 && i < 4){ idleRight[i] = temp.get(i*24,j*24,24,24);}
        if(j==0 && i >= 4){ idleLeft[i-4] = temp.get(i*24,j*24,24,24);}
        if(j==1){ walkingRight[i] = temp.get(i*24,j*24,24,24);}
        if(j==2){ walkingLeft[i] = temp.get(i*24,j*24,24,24);}
      }
    }
  }

  void update(){
    if(!nav.visible){
      // Update animations
      if(frameCount%6 == 0) {
        walkingFrame = walkingFrame < 7 ? walkingFrame + 1 : 0;
      }
      if(frameCount%20 == 0) {
        idleFrame = idleFrame < 3 ? idleFrame + 1 : 0;
      }

      // Update walking/not walking
      if (abs(coords.x - target.x) < walkingSpeed && abs(coords.y -target.y) < walkingSpeed) { walking = false;}
      else { walking = true; }

      // Update x/y coordinates
      float lerpDist = coords.dist(target);
      if(lerpDist > walkingSpeed) {
        coords.lerp(target, walkingSpeed/lerpDist);
      }
    }

    walkingSpeed = MAX_WALKING_SPEED*abs(menu.speedSlider.level -1);

    draw();
  }

  void draw(){
    imageMode(CENTER);
    if(walking){
      if(facingRight){
        image(walkingRight[walkingFrame],coords.x,coords.y-16,120,120);
      } else {
        image(walkingLeft[walkingFrame],coords.x,coords.y-16,120,120);
      }
    } else {
      if(facingRight){
        image(idleRight[idleFrame],coords.x,coords.y-16,120,120);
      } else {
        image(idleLeft[idleFrame],coords.x,coords.y-16,120,120);
      }
    }
  }

  // bounce back if you've hit a boundary
  void bounce() {
    float lerpDist = coords.dist(target);
      if(lerpDist > walkingSpeed) {
        coords.lerp(target, -walkingSpeed/lerpDist);
      }
    target.x = coords.x;
    target.y = coords.y;
  }
}

