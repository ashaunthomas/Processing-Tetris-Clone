//********** DEFINE IN MEMORY **********/
Block whiteBlock;

//********** VARIABLES **********/
// 0 is for the Initial Screen
// 1 is for the Game Screen
// 2 is for the Game-Over Screen

int gameScreen = 0;
PImage bg;

//********** IMPLEMENT OBJECTS **********/
void setup () {
  size (750, 1000);
  bg = loadImage("40972381.jpg");
  whiteBlock = new Block(3);
}



//*********** DRAW IN CANVAS **********/
void draw() {
  // Displays the contents of the current screen
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}

//********** SCREEN CONTENTS **********/
void initScreen() {
  background (bg);
  textAlign (CENTER);
  text ("Click to start, homie.", height, width);
  }
void gameScreen() {
  background (0);
  // Next blocks will test movement of tile
  fill(0);
  rect(0,0,750,1000);
  whiteBlock.paint();
  whiteBlock.moveRight();
}
void gameOverScreen() {
  //codes of game over screen
}

//********** INPUTS **********/
public void mousePressed() {
  // if current screen is the initial screen, start the game
  if (gameScreen == 0) {
    startGame();
  }
}

//********** OTHER FUNCTIONS **********/
// Variables that start the game
void startGame() {
  gameScreen = 1;
}

//********** CLASSES ***********/
class Block {
  float xPos, yPos, blockWidth, blockHeight;
  boolean hitRightSide = false;
  Block(int placement) {
    this.xPos = placement;
    this.yPos = 20;
    this.blockHeight = 20;
    this.blockWidth = this.blockHeight;
  }

  void moveRight() {
    this.xPos+=3;
  }

  void paint() {
    fill(#ff0000); //red
    rect(this.xPos, this.yPos, this.blockWidth, this.blockHeight);
  }
}

//******** part of the draw in canvas block/
//fill(0);
//rect(0,0,750,1000);
//whiteBlock.paint();
//whiteBlock.moveRight();