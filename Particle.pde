class Particle extends GameObject{

  
  float transparency;
  Particle(Asteroid s){
   loc = s.loc.copy();
   velocity = s.velocity.copy();
   velocity.rotate(random(0,2*3.14));
   size = 1;
   lives = 1;
   c = color(100);
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
