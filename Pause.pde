void pause(){
  pauseButton = new Button(width-50, 50, 50,50,color(255),color (255,0,0),"►",20,false);
  stroke(255);
  fill(100);
  rect(width/2,0, 500,250);
  fill(255);
  textSize(50);
  text("PAUSED",width/2,75);
  pauseButton.show();
  
}
