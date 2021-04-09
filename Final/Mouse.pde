void mouseWheel(MouseEvent event){
  float e = event.getCount();

  // Change cursor mode with scroll wheel
  if(e>0){
    if(cursor.currentCursor == 0) {
        cursor.currentCursor = 2;
      } else {
        cursor.currentCursor--;
      }
  } 
  if(e<0) {
    if(cursor.currentCursor == 2) {
      cursor.currentCursor = 0;
    } else {
      cursor.currentCursor++;
    }
  }
}

void mouseClicked(MouseEvent event){
  // Change cursor mode with right-click
  int button = event.getButton();
  if(button==39) { 
    if(cursor.currentCursor == 2) {
      cursor.currentCursor = 0;
    } else {
      cursor.currentCursor++;
    }
  }

  if(button==37 && cursor.currentCursor == 1) { 
    trev.target.x = mouseX;
    trev.target.y = mouseY;
  }
  
  //Collision checks for clickable objects

}
