class AlienBullet extends GameObject {

  int timer;

  AlienBullet(AlienShip thisShip) {
    timer = 600;
    loc = new PVector(thisShip.loc.x, thisShip.loc.y);
    velocity = new PVector(thisShip.direction.x, thisShip.direction.y);
    velocity.setMag(10);
    abilityOne = 1;
    lives = 1;
    c = color(0,255,0);
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


}
