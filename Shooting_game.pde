/*
This asteroids project is made by Timothy Lin with the help of Mr.Pelletier

please read this before start running the game:
------------------------------------------------------------------------------
Important:(Must Read to play the game)

Movement control:
Shooting: when the mouse is pressed, spaceship will fire a bullet towards the mousepointer
Wkey: spaceship will move forward towards the mouse pointer when 'w' key is pressed
Akey: spaceship will move left relative to the mouse pointer when 'a' key is pressed
Skey: spaceship will move away from the mouse pointer when 's' key is pressed
Dkey: spaceship will move right relative to the mouse pointer when 'd' key is pressed

Ability Contorl: 
'1': Releases first ability
'2': Releases second ability
'3': Releases third ability
------------------------------------------------------------------------------
More: 
------------------------------------------------------------------------------
Description of criteria's in the project:

Note that because it is in space, the velocity does not automatically go back to 0 when you release a key.
There is friction and gravitational effect slowly slowly down the spaceship when no key is pressed but it will not be instant


Asteroids: 
Asteroids will have lives that varies so will take multiple bullets the destory an asteroid (maxium live can be up to 30)
Regular asteroid will be 3 damage instead of 1 to the spaceship (just to make clear any misunderstanding about spaceship loosing >1 helath at a time)
(it will release particles after hit, more particles when it is destroyed)

Alien ship:
Will have lives as well (>1 so it cannot be one-shotted);
Will do insane amount of damage when crashed into spaceship (>1)

Bullets:
All bullets and alien bullets will do exactly 1 damage

Spaceship:
***Spaceship immunity peroid will not be visible after crash but it is implemented in the spaceship class***
(it will not be visible due to the fact that i made it to 1 second. It is very werid to have it visible)
it will have 100 heart at the beginning of the game ;)

Spaceship ability is written in the description page

Sorry I would of written everything in description page if we had more time
------------------------------------------------------------------------------
*/


Spaceship myShip;
ArrayList<GameObject> myObjects;

PImage introLogo;
PImage home;
PImage end;

PImage FAbility;
PImage SAbility;
PImage TAbility;

PImage P1;
PImage P2;
PImage P3;

Button startButton;
Button descriptionButton;
Button returnButton;
Button pauseButton;
Button playAgain;
Button nextPage;


final int START = 0;
final int HOME = 1;
final int OPTION = 2;
final int GAME = 3;
final int PAUSE = 4;
final int END = 5;

int mode;




void setup() {
  size(1440, 900);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  myShip = new Spaceship(); 
  mode = END;
  introLogo = loadImage("Logo.png");
  home = loadImage("home2.jpg");
  end = loadImage("home.jpg");
  end.resize(1440,900);
  
  FAbility = loadImage("AbilityOne.png");
  SAbility = loadImage("AbilityTwo.png");
  TAbility = loadImage("AbilityThree.png");
  
  P1 = loadImage("P1.png");
  P2 = loadImage("P2.png");
  P3 = loadImage("AbilityThree.png");
  
  
  myObjects = new ArrayList<GameObject>(); 
  for(int i = 0; i < 15; i++){
    myObjects.add(new Asteroid());
  }
  
  startButton = new Button(width/2, height/2,200,100,color(255),color(255,0,0),"Start",30,false);
  descriptionButton = new Button(width/2, height/2+150,200,100,color(255),color(255,0,0),"Description",20,false);
  returnButton = new Button(100,50,100,50,color(255),color(255,0,0),"Return",15,false);
  pauseButton = new Button(width-50, 50, 50,50,color(255),color (255,0,0),"||",20,false);
  playAgain = new Button(width/2, height/2,200,100,color(255),color(0,255,0),"Play Again",20,false);
  nextPage = new Button(width-100,50,100,50,color(255),color(0,255,0),"Next Page",15,false);
}


void draw() {
  if (mode == START) {
    starts();
  } else if (mode == HOME) {
    home();
  } else if (mode == OPTION) {
    option();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == END) {
    end();
  }
}
