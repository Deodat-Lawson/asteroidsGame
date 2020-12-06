class AlienShip extends GameObject {

    int trans;
    PVector direction;
    int shortTime, threshold;
    
  AlienShip() {
    loc = new PVector(random(-300, 0), random(900));
    direction = new PVector(-1*(loc.x - myShip.loc.x), -1*(myShip.loc.y-loc.y));
    direction.setMag(0.1);
    velocity = new PVector(1, 0);
    lives = 10;  
    size = 50;
    trans = 255;
    shortTime = 60;
    threshold = 75;
  }



  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    stroke(0, 255, 0, trans);
    fill(0);
    ellipse(0, 0, size, size);
    
    rotate(direction.heading());
    line(0,0,40,0);
    popMatrix();
    
  }

  void act() {
    super.act();
    direction = new PVector(-1*(loc.x - myShip.loc.x), -1*(loc.y - myShip.loc.y));
    
    if (shortTime > threshold) {
      myObjects.add(new AlienBullet(this));
      shortTime = 0;
    }
    shortTime++;
    
    
    


    for (int i = 0; i < myObjects.size(); i++) {
      GameObject thisObj = myObjects.get(i);

      if (thisObj instanceof Bullet) {
        if (dist(loc.x, loc.y, thisObj.loc.x, thisObj.loc.y) <= size/2+thisObj.size/2) {
          lives--;
          trans = 100;
          thisObj.lives--;

          break;
        } else {
          trans = 255;
        }
      } 
    }
    
  }
}
