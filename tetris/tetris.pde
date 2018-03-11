//********** DEFINE IN MEMORY **********/
Block whiteBlock;
UIScreen uiLayout;
int[][] playArea;

//********** VARIABLES **********/
// 0 is for the Initial Screen
// 1 is for the Game Screen
// 2 is for the Game-Over Screen

int gameScreen = 0;
PImage bg;
PFont f;

//********** IMPLEMENT OBJECTS **********/
void setup () {
  size (750, 1000);
  bg = loadImage("Greninjajpg.jpg");
  whiteBlock = new Block(3);
  f = createFont ("Arial", 16, true);
  final int BOARD_WIDTH = 600;
  final int BOARD_HEIGHT = 1000;
  final int TILE_LENGTH = 50;
  uiLayout = new UIScreen();
  final int TILES_PER_ROW = BOARD_WIDTH / TILE_LENGTH; // 600 / 50 == 12
  final int TILES_PER_COLUMN = BOARD_HEIGHT / TILE_LENGTH; // 1000 / 50 = 20
  playArea = new int[TILES_PER_COLUMN][TILES_PER_ROW];
  
  for (int i = 0; i < TILES_PER_COLUMN; i++) {
    for (int j = 0; j < TILES_PER_ROW;j++) {
      playArea[i][j] = 0;
      println("play Area [" + i + "][" + j + "] is set to 0");
    }
  }
}

  
  /*
     width of board is 600
     each tile then is 50 wide and long
  */
  



//*********** DRAW IN CANVAS **********/
void draw() {
  // Displays the contents of the current screen
  if (gameScreen == 0) {
    initScreen();
    textFont(f, 56);
    fill(0);
    text("Welcome to Our Future", 375, 500);
    textFont(f,32);
    text("Click anywhere to start", 375, 600);
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
  uiLayout.paint();
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

class UIScreen {
 float xPos, yPos, w,h;
 UIScreen() {
  this.xPos = 487.5;
  this.yPos = 0;
  this.w = width - this.xPos;
  this.h = 1000;
 }
 
 void paint() {
  fill(255);
  rect(this.xPos,this.yPos,this.w,this.h);
 }
}