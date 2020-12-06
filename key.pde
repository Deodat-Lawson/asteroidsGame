boolean wkey, akey, skey, dkey, spacekey;



void keyPressed() {
  if (mode == GAME) {
    if (key == 'w' || key == 'W') {
      wkey = true;
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (key == 'a' || key == 'A') {
      akey = true;
    }   
    if (key == 's' || key == 'S') {
      skey = true;
    }
    if (key == 'd' || key == 'D') {
      dkey = true;
    }
    if (key == '1' && abilityOneCounDown <= 0) abilityOneW = true;
    if (key == '2' && abilityTwoCounDown <= 0) abilityTwoW = true;
    if (key == '3' && abilityThreeCounDown <= 0) abilityThreeW = true;
  }
}

void keyReleased() {
  if (mode == GAME) {
    if (key == 'w' || key == 'W') wkey = false;
    if (key == 'a' || key == 'A') akey = false;
    if (key == 's' || key == 'S') skey = false;
    if (key == 'd' || key == 'D') dkey = false;
  }
}

void mousePressed() {
  if (mode == GAME) {
    spacekey = true;
  }
}

void mouseReleased() {

  if (mode == HOME) {
    if (startButton.touching()) {
      mode = GAME;
    } else if (descriptionButton.touching()) {
      mode = OPTION;
    }
  } else if (mode == OPTION) {
    if (nextPage.touching()) {

      page++;
    }
    if (returnButton.touching()) {
      mode = HOME;
      page=1;
    }
  } else if (mode == GAME) {
    if (pauseButton.touching()) {
      mode = PAUSE;
    }
    spacekey = false;
  } else if (mode ==  PAUSE) {
    if (pauseButton.touching()) {
      mode = GAME;
    }
  } else if (mode == END) {
    if (playAgain.touching()) {
      mode = HOME;
      
      resetVar();
      
    }
  }
}



void resetVar(){
  
abilityOneW = false;
abilityOneCounDown = 0;
abilityOneTimes = 3*60;
abilityOne = 1;

abilityTwoW = false;
abilityTwoCounDown = 0;
abilityTwoTimes = 2*60;
abilityTwo = 1;


abilityThreeW = false;
abilityThreeCounDown = 0;
abilityThreeTimes = 0;
abilityThree = 2;

score = 0;
addOne = 15*60;
MaxTime = 20*60;

win = false;
  
  myObjects = new ArrayList<GameObject>(); 
      for (int i = 0; i < 15; i++) {
        myObjects.add(new Asteroid());
      }
      
      myShip = new Spaceship(); 
  
}
