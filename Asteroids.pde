class Asteroid extends GameObject {

  int trans;
  int oglives;

  boolean physical;
  int physicalTime = 0;

  Asteroid() {

    loc = new PVector(random(1440, 1920), random(height));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    velocity.setMag(2);
    velocity.rotate(radians(5));
    size = (int)random(30, 80);
    lives = size/3;
    oglives = size/3;
    trans = 255;

    physical = false;
  }



  Asteroid(int s, float x, float y, int l) {
    lives = l;
    oglives = l;
    loc = new PVector(x, y);
    velocity = new PVector(random(1), random(1));
    velocity.setMag(2);
    velocity.rotate(radians(5));
    size = s;
    trans = 255;
    physical = false;
  }

  //==================================  
  void show() {
    stroke(100, 100, 100, trans);
    fill(100, 100, 100, trans);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();


    if (physical) {
      physicalTime = 60;
      physical = false;
    }

    if (physicalTime > 0) {
      textPhysical(); 
      physicalTime--;
    }

    if (loc.x > 2000) {
      loc.x = -100;
    }
    if (loc.x < -100) {
      loc.x = 2000;
    }
    if (loc.y > 1200) {
      loc.y = -200;
    }
    if (loc.y < -200) {
      loc.y = 1200;
    }

    checkTouchingShip();



    for (int i = 0; i < myObjects.size(); i++) {
      GameObject thisObj = myObjects.get(i);

      if (thisObj instanceof Bullet ||thisObj instanceof AlienBullet) {
        if (dist(loc.x, loc.y, thisObj.loc.x, thisObj.loc.y) <= size/2+thisObj.size/2) {
          lives--;
          trans = 100;
          thisObj.lives--;
          myObjects.add(new Particle(this));

          break;
        } else {
          trans = 255;
        }
      }
      if (thisObj instanceof AlienShip) {
        if (dist(loc.x, loc.y, thisObj.loc.x, thisObj.loc.y) <= size/2+thisObj.size/2) {
          thisObj.loc.x+=50;
        }
      }
    }



    if (lives <= 0) {
      for (int j = 0; j < size/20; j++) {
        myObjects.add(new Asteroid(size/2, loc.x, loc.y, oglives/3));
      }
      for (int j = 0; j < size; j++) {
        myObjects.add(new Particle(this));
      }
    }
  }


  void checkTouchingShip() {


    if (dist(loc.x, loc.y, myShip.loc.x, myShip.loc.y) <= size/2+myShip.size/2 && myShip.canBecrash <= 0) {
      if (abilityTwo == 1 && abilityTwoW) {

        lives -= 6;
        physical = true;
        myShip.lives -= 1;
      } else {
        lives -= 3;
        myShip.lives -= 3;
      }

      myShip.canBecrash = 60;
      for (int i= 0; i < 3; i++) {
        myObjects.add(new Particle(this));
      }
    }
  }



  void textPhysical() {
    fill(255);
    textSize(10);

    text("physical!", loc.x, loc.y);
  }
}
