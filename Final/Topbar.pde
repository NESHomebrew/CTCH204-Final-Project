public class Topbar{
  String title;
  int points;
  int day;
  int hours;
  int minutes;
  String meridiem;

  Topbar(){
    points = 0;
    day = 1;
    hours = 12;
    minutes = 50;
    meridiem = "AM";
  }
  void update(){
    if(frameCount%600 == 0) {minutes++;}
    if(minutes == 60) {hours++; minutes = 0;}
    if(hours == 13) {hours = 1; meridiem = "PM";}
    draw();
  }
  void draw(){
    noStroke();
    fill(200);
    rectMode(CORNER);
    rect(0,0,width,30);
    strokeWeight(1);
    stroke(150);
    line(0,28,width,28);
    line(0,3,width,3);
    stroke(100);
    line(0,29,width,29);
    line(0,2,width,2);
    stroke(50);
    line(0,30,width,30);
    line(0,1,width,1);
    fill(0);
    textFont(alg24);
    textSize(24);
    textAlign(LEFT);
    text("Score : " + points + "/66", 8, 24);
    textAlign(CENTER);
    text("DAY " + day, width/2, 24);
    textAlign(RIGHT);
    text( hours +":" + nf(minutes,2,0) + " " + meridiem , width - 8, 24);

  }
}
