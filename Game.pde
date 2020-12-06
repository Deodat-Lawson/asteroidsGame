boolean abilityOneW = false;
int abilityOneCounDown = 0;
int abilityOneTimes = 3*60;
int abilityOne = 1;

boolean abilityTwoW = false;
int abilityTwoCounDown = 0;
int abilityTwoTimes = 2*60;
int abilityTwo = 1;


boolean abilityThreeW = false;
int abilityThreeCounDown = 0;
int abilityThreeTimes = 0;
int abilityThree = 2;

int score = 0;
int addOne = 15*60;
int MaxTime = 20*60;

boolean win = false;
void game() {
  background(0);
  pauseButton = new Button(width-50, 50, 50,50,color(255),color (255,0,0),"||",20,false);
  

  addOne++;
  if (addOne >= MaxTime) {
    addOne = 0;
    myObjects.add(new AlienShip());
    if (MaxTime >= 8*60) {
      MaxTime -= 2*60;
    }
  }


  myShip.show();
  myShip.act();

  checkArrayList();
  timeChangeFor1();
  timeChangeFor2();
  timeChangeFor3();
  fill(255);
  textSize(20);
  if (abilityOneCounDown <=0) {
    noTint();
    image(FAbility, width/2-150, 70, 70, 70);
  } else {
    tint(100);
    image(FAbility, width/2-150, 70, 70, 70);
    image(SAbility, width/2, 70, 70, 70);
    text(abilityOneCounDown/60, width/2-150, 70);
  }




  if (abilityTwoCounDown <=0) {
    noTint();
    image(SAbility, width/2, 70, 70, 70);
  } else {
    tint(100);
    
    text(abilityTwoCounDown/60, width/2, 70);
  }

  if (abilityThreeCounDown <=0) {
    noTint();
    image(TAbility, width/2+150, 70, 70, 70);
  } else {
    tint(100);
    image(TAbility, width/2+150, 70, 70, 70);
      text(abilityThreeCounDown/60, width/2+150, 70);
  }





  

  textSize(30);
  fill(255);
  text(myShip.lives, 50, 30);
  rectMode(LEFT);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(105, 0, 100-myShip.lives+5, 5);
  rectMode(CENTER);
  fill(255);
  text("score: " +score, 80, 100);
  
  
  
  pauseButton.show();
}


//---------------------------------------------------------------
void checkArrayList() {
  boolean allGone = true;
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject thisObject = myObjects.get(i);
    if (thisObject instanceof Asteroid) {
      allGone = false;
      if (thisObject.lives <= 0) {
        score+=thisObject.size;
        myObjects.remove(thisObject);
        i--;
      }
    }

    if (thisObject instanceof Bullet || thisObject instanceof Fire|| thisObject instanceof AlienShip|| thisObject instanceof AlienBullet|| thisObject instanceof Particle) {
      if (removeBullet(thisObject)) {
        myObjects.remove(thisObject);
        i--;
        continue;
      }
    }


    thisObject.show();
    thisObject.act();
  }

  if (allGone) {
    win = true;
    mode = END;
  }
}


boolean removeBullet(GameObject thisBullet) {

  if (outOfBound(thisBullet)) {
    thisBullet.lives = 0;
  }
  if (thisBullet.lives > 0) {
    return false;
  }
  return true;
}

boolean outOfBound(GameObject thisBullet) {
  if (thisBullet.loc.x > 1600 || thisBullet.loc.x < -200 || thisBullet.loc.y < -200 || thisBullet.loc.y > 1100) {
    return true;
  }
  return false;
}

//-----------------------------------------------------------------

void timeChangeFor1() {
  if (!abilityOneW) {
    abilityOneTimes = 3*60;
    abilityOneCounDown--;
  } else {
    abilityOneTimes--;
    abilityOneCounDown = 15*60;
  }

  if (abilityOneCounDown < 0) {
    abilityOneCounDown = 0;
  }

  if (abilityOneTimes <= 0) {
    abilityOneW = false;
    abilityOneTimes = 3*60;
    abilityOneCounDown = 15*60;
  }
}


void timeChangeFor2() {
  if (!abilityTwoW) {
    abilityTwoTimes = 2*60;
    abilityTwoCounDown--;
  } else {
    abilityTwoTimes--;
    abilityTwoCounDown = 10*60;
  }

  if (abilityTwoCounDown < 0) {
    abilityTwoCounDown = 0;
  }

  if (abilityTwoTimes <= 0) {
    abilityTwoW = false;
    abilityTwoTimes = 2*60;
    abilityTwoCounDown = 10*60;
  }
}




void timeChangeFor3() {
  if (!abilityThreeW) {
    abilityThreeTimes = 2*60;
    abilityThreeCounDown--;
  } else {
    abilityThreeTimes--;
    abilityThreeCounDown = 30*60;
    myShip.loc.x+= (myShip.direction.x*5000);
    myShip.loc.y+= (myShip.direction.y*5000);

    if (myShip.lives <= 95) {
      myShip.lives+=5;
    } else
    {
      myShip.lives = 100;
    }
    abilityThreeW = false;
  }

  if (abilityThreeCounDown < 0) {
    abilityThreeCounDown = 0;
  }

  if (abilityThreeTimes <= 0) {
    abilityThreeW = false;
    abilityThreeTimes = 0;
    abilityThreeCounDown = 30*60;
  }
}
