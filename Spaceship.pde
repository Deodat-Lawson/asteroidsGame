class Spaceship extends GameObject {
  //self code
  int abilityTwo;
  /* 
   0 - shield (10 sec cool down)
   1 - absorbtion (10 sec cool down)
   2 - small run (5 sec cool down)
   */

  int abilityThree;
  /* 
   0 - Rage (5 sec of healing + rapid firing bullets) (30sec cool down)
   1 - lightning (30 sec cool down)
   2 - big run+charge+absorbtion (45 sec cool down)
   */


  int shortTime, threshold;

  //------------------------------------

  //instance variables
  PVector direction;

  //2. constructor
  int canBecrash;

  Spaceship() { //name matches the class name
    loc = new PVector(width/2, height/2);
    direction = new PVector(mouseX - loc.x, mouseY - loc.y);
    direction.setMag(0.1);
    velocity = new PVector(0, 0);
    lives = 100;  
    size = 20;
    abilityTwo = 1;
    abilityThree = 2;
    colorIns();
    canBecrash = 0;
    shortTime = 0;
    threshold = 15;
  }

  //3. behaviour language
  void show() {
    colorIns();
    pushMatrix();
    strokeWeight(3);
    stroke(c);
    fill(0);
    translate(loc.x, loc.y);
    rotate(direction.heading());
    rect(0, 0, size, size);
    line(0, 0, 20, 0);
    popMatrix();
  }


  void act() {
    super.act();

    if (loc.x > 1490) {
      loc.x = -30;
    }
    if (loc.x < -50) {
      loc.x = 1470;
    }
    if (loc.y > 950) {
      loc.y = -30;
    }
    if (loc.y < -50) {
      loc.y = 920;
    }


    if (canBecrash > 0) {
      canBecrash--;
    }


    shortTime++;
    direction = new PVector(mouseX - loc.x, mouseY - loc.y);
    direction.setMag(0.05);
    if (akey) velocity.add(new PVector(direction.x, 0.05-direction.y));
    if (dkey) velocity.add(new PVector(0.05 - direction.x, direction.y));
    if (wkey) velocity.add(direction);
    if (skey) velocity.sub(direction);


    if (abilityOne == 1 && abilityOneW) {
      threshold = 5;
    } else {
      threshold = 15;
    }

    if (spacekey && shortTime > threshold) {
      myObjects.add(new Bullet());
      shortTime = 0;
    }

    checkMax();


    if (lives <= 0) {
      mode = END;
    }


    for (int i = 0; i < myObjects.size(); i++) {
      GameObject thisObj = myObjects.get(i);

      if (thisObj instanceof AlienBullet) {
        if (dist(loc.x, loc.y, thisObj.loc.x, thisObj.loc.y) <= size/2+thisObj.size/2) {

          if (abilityTwo == 1 && abilityTwoW) {
            thisObj.lives--;
          } else {
            lives--;
            thisObj.lives--;
          }
        }

        break;
      }
    
    if (thisObj instanceof AlienShip) {
      if (dist(loc.x, loc.y, thisObj.loc.x, thisObj.loc.y) <= size/2+thisObj.size/2) {
        if (abilityTwo == 1 && abilityTwoW) {
          lives-=5;
            thisObj.lives = 0;
          } else {
            lives-=10;
            thisObj.lives = 0;
          }
      }
    }
  }
}





//---------------------------------------------------  
void colorIns() {
  if (abilityTwo == 0 && abilityTwoW) {
    c = color(0, 255, 0);
  } else if (abilityTwo == 1 && abilityTwoW)
  {
    c = color(255, 0, 0);
  } else if (abilityTwo == 2 && abilityTwoW) {
    c = color(0, 0, 255);
  } else { 
    c = color(255);
  }
}

//---------------------------------------------------   
void checkMax() {
  if (velocity.x > 3) {
    velocity.x = 3;
  }
  if (velocity.x < -3) {
    velocity.x = -3;
  }

  if (velocity.y > 3) {
    velocity.y = 3;
  }
  if (velocity.y < -3) {
    velocity.y = -3;
  }


  if (velocity.x > 0) {
    velocity.x-=0.01;
  }
  if (velocity.x < 0) {
    velocity.x+=0.01;
  }

  if (velocity.y > 0) {
    velocity.y-=0.01;
  }
  if (velocity.y < 0) {
    velocity.y+=0.01;
  }
}
}
