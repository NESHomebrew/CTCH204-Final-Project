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

void mousePressed(MouseEvent event){
  // Change cursor mode with right-click
  int button = event.getButton();
  if(button==39) { 
    if(cursor.currentCursor == 2) {
      cursor.currentCursor = 0;
    } else {
      cursor.currentCursor++;
    }
  }

  // Set target coordinate on mouse click
  if(button==37 && cursor.currentCursor == 1 && !nav.visible) { 
    trev.target.x = mouseX;
    trev.target.y = mouseY - 24;  // Offset to match location of feet
  }
  if(button==37 && cursor.currentCursor != 1) { 
    trev.target.x = trev.coords.x; // stops walking if you press
    trev.target.y = trev.coords.y; // a different button
  }
  // Update direction
  if(button==37 && !nav.visible) {
    if (trev.coords.x < mouseX) { trev.facingRight = true;}
    else { trev.facingRight = false;}
  }
  // Collision checks for clickable objects


}
