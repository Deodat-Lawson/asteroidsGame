float moveEnd = 0;

void end(){
  fill(255);
  if(win){
  background(0,255,0);
  rectMode(RIGHT);
  image(end,width/2, height/2);
  textSize(100+moveEnd);
  text("Victory",width/2, height/2-100);
  textSize(40);
  text("Score " + score, width/2, height/2-250);
    
  }
  else{
  background(0,255,0);
  rectMode(RIGHT);
  image(end,width/2, height/2);
  textSize(100+moveEnd);
  text("Defeat",width/2, height/2-100);
  textSize(40);
  text("Score " + score, width/2, height/2-250);
  }
  
  if(moveEnd <= 5){
   moveEnd+=0.1; 
  }
  else if(moveEnd >= 5){
    moveEnd = 0;
  }
  
  
  
  rectMode(CENTER);
  playAgain.show();
  
  
}
