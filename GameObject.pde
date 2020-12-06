class GameObject{
  PVector loc;
  PVector velocity;
  int size;
  int lives;
  color c;
  
  GameObject(){
    
    
    
  }
  
  
  
  void show(){
    stroke(c);
    fill(0);
    rect(loc.x, loc.y, size,size);
    
  }
  void act(){
    loc.add(velocity);
    
  }
  
  
  
  
}
