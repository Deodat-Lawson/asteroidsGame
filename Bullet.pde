class Bullet extends GameObject {
  //self code
  int abilityOne;
  /* 
   0 - healing (15 sec cool down)
   1 - pericing (10 sec cool down)
   2 - rapid firing (10 sec cool down)
   */


  //------------------------------------

  int timer;

  Bullet() {
    timer = 600;
    loc = new PVector(myShip.loc.x, myShip.loc.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    abilityOne = 1;
    lives = 1;
    colorIns();
    size = 2;
  }

  void show() {
    super.show();
  }
  void act() {
    super.act();
    timer--;
    if (timer <= 0) {
      lives = 0;
    }
  }


  void colorIns() {
    if (abilityOne == 0 && abilityOneW) {
      c = color(0, 255, 0);
    } else if (abilityOne == 1 && abilityOneW)
    {
      c = color(255, 0, 0);
    } else if (abilityOne == 2 && abilityOneW) {
      c = color(0, 0, 255);
    } else { 
      c = color(255);
    }
  }
}
