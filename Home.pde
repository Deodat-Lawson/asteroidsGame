int move = 0;
void home(){
  background(0);
  noTint();
  image(home, width/2, height/2,width,height);
  textSize(70+move);
  fill(255);
  text("<< Asteroids Game >>", width/2+move,300);
  if(move <= 5){
   move++; 
  }
  else if(move >= 5){
    move = 0;
  }
  startButton.show();
  descriptionButton.show();
  
}
