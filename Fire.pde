class Fire extends GameObject{
  
  float transparency;
  Fire(){
   loc = myShip.loc.copy();
   velocity = myShip.velocity.copy();
   velocity.rotate(radians(180) + random(-0.1,0.1));
   size = 1;
   lives = 1;
   c = color(255,0,0);
   transparency = 255;
  }
  
  
  void show(){
    
    stroke(c,transparency);
    fill(0);
    rect(loc.x, loc.y, size,size);
    transparency-=1; 
    if(transparency < 0){
     transparency = 0; 
    }
    
  }

  
}
