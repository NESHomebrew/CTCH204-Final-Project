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
    hours = 7;
    minutes = 5;
    meridiem = "AM";
  }
  void update(){
    draw();
  }
  void draw(){
    fill(200);
    rect(0,0,width,30);
    fill(0);
    textFont(sans24);
    textSize(24);
    textAlign(LEFT);
    text("Score : " + points, 8, 24);
    textAlign(CENTER);
    text("DAY " + day, width/2, 24);
    textAlign(RIGHT);
    text( hours +":" + nf(minutes,2,0) + " " + meridiem , width - 8, 24);

  }
}
