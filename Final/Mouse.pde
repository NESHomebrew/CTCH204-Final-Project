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

  if (!menu.showMenu) {
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
    // Collision checks for navBar
    if(button==37 && nav.visible) {
      if ( nav.mouseRegion < 3) {
        cursor.currentCursor = nav.mouseRegion;
      }
      if ( nav.mouseRegion == 3) {
        menu.showMenu = true;
        cursor.prevCursor = cursor.currentCursor;
        cursor.currentCursor = 3;
      }
    }

    // Collision checks for object actions
    if(button==37 && cursor.currentCursor == 0) { 
      for(Object object : bg.objects) {
        if(object.polyPoint(mouseX,mouseY)) {
          currentText = object.action[object.actionClick];
          if(object.actionClick < object.action.length-1) { object.actionClick++;}
          else { 
            object.actionClick = 0; 
            if(!object.actionStatus){
              //jingle.play();
              object.actionStatus = true;
              bar.points++;
            };
          }
          trev.target.x = mouseX;
          trev.target.y = mouseY;
        }
      }
    }
    // Collision checks for object info
    if(button==37 && cursor.currentCursor == 2) { 
      for(Object object : bg.objects) {
        if(object.polyPoint(mouseX,mouseY)) {
          currentText = object.info[object.infoClick];
          if(object.infoClick < object.info.length-1) { object.infoClick++;}
          else { 
            object.infoClick = 0;
            if(!object.infoStatus){
              //jingle.play();
              object.infoStatus = true;
              bar.points++;
            };
          }
        }
      }
    }
  }

  // Collision for menu
  if(menu.showMenu) {
    if(menu.volSlider.overSlider) {          // above the bottom
      menu.volSlider.locked = true;
    } else {
      menu.volSlider.locked = false;
    }
    if(menu.speedSlider.overSlider) {          // above the bottom
      menu.speedSlider.locked = true;
    } else {
      menu.speedSlider.locked = false;
    }
    if(menu.buttons[0].overButton) {
      currentState = GameState.LOADING; 
      bgm.pause();
      progressBar = 0.0;
      thread("loading");
      currentText = "";
    }
    if(menu.buttons[1].overButton) {println("Clicked Load Game");}
    if(menu.buttons[2].overButton) {println("Clicked Save Game");}
    if(menu.buttons[3].overButton) {
      menu.showMenu = false; 
      cursor.currentCursor = cursor.prevCursor; 
      menu.buttons[3].overButton = false;
    }
    if(menu.buttons[4].overButton) {exit();}
  }
}

void mouseDragged() {
  if(menu.volSlider.locked) {
    menu.volSlider.level = constrain(((mouseY - menu.volSlider.y - 10)/100.0),0.02,0.98); 
    bgm.setGain(-(MAX_VOLUME*menu.volSlider.level));
  }
  if(menu.speedSlider.locked) {
    menu.speedSlider.level = constrain(((mouseY - menu.speedSlider.y - 10)/100.0),0.02,0.98); 
  }
}

void mouseReleased() {
  menu.volSlider.locked = false;
  menu.speedSlider.locked = false;
}
