int page = 1;

void option() {
  background(0);
  noTint();
  image(home, width/2, height/2, width, height);
  
  
  returnButton.show();
  
  
  if(page == 1){
    image(P1,width/2, height/2, width, height);
    nextPage.show();
  }
  if(page == 2){
    image(P2,width/2, height/2, width, height);
  }
  
  //fill(255);
  //textSize(50);
  //text("General Description", width/2, 150);
  
  //textSize(20);
  //text("An century ago, Earth survivied the greatest disaster from the Creepnosaur Aliens -- the metor invasion. But victory came at a high price,",width/2, 200); 
  //text("1500 spaceships destoried, 35000 space fighters dead. Over this century, while Earth suffered from civil war and famine, the Creepnosaurs",width/2,  230);
  //text("has regrouped! Our old enemy has returned! This time, with unpresedented forces, they will destory Earth for once and for all.",width/2,260);
  
  //textSize(50);
  //text("A Letter from Gerneral Thomas", width/2, 320);
  //textSize(20);
  //text("You are the last spaceship remaining in the western Atmospher. We cannot let the metors and aliens control this region. Our support is coming,",width/2,370);
  //text("but it will take 3 days to arrive. In the mean time, we cannot let the aliens control this sphere. You need to defend this atmospher at all costs!",width/2,400);
  
  
  
  
}
