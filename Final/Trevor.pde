public class Trevor {
  PVector coords = new PVector();
  PVector target = new PVector();;
  int idleFrame;
  int walkingFrame;
  boolean facingRight;
  boolean walking;

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

    PImage temp = loadImage("trev.png");
    idleRight = new PImage[4];
    idleLeft = new PImage[4];
    walkingRight = new PImage[8];
    walkingLeft = new PImage[8];

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
    // Update animations
    if(frameCount%6 == 0) {
      walkingFrame = walkingFrame < 7 ? walkingFrame + 1 : 0;
    }
    if(frameCount%20 == 0) {
      idleFrame = idleFrame < 3 ? idleFrame + 1 : 0;
    }

    // Update direction
    if (coords.x < target.x) { facingRight = true;}
    else { facingRight = false;}

    // Update walking/not walking
    if (abs(coords.x - target.x) < 2 && abs(coords.y -target.y) < 2) { walking = false;}
    else { walking = true; }

    println(abs(coords.x - target.x));

    // Update x/y coordinates
    float lerpDist = coords.dist(target);
    if(lerpDist > 2) {
      coords.lerp(target, WALKING_SPEED/lerpDist);
    }


    draw();
  }
  void draw(){
    imageMode(CENTER);
    if(walking){
      if(facingRight){
        image(walkingRight[walkingFrame],coords.x,coords.y,72,72);
      } else {
        image(walkingLeft[walkingFrame],coords.x,coords.y,72,72);
      }
    } else {
      if(facingRight){
        image(idleRight[idleFrame],coords.x,coords.y,72,72);
      } else {
        image(idleLeft[idleFrame],coords.x,coords.y,72,72);
      }
    }
  }
}

// https://opengameart.org/content/pixelated-employee-character