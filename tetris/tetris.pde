//********** DEFINE IN MEMORY **********/
PlayArea playArea;
UILAYOUT uiScreen;
SCORE displayScore;


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
  f = createFont ("Arial", 16, true);
  final int BOARD_WIDTH = 525;
  final int BOARD_HEIGHT = 875;
  final int TILE_LENGTH = 35;
  final int TILES_PER_ROW = BOARD_WIDTH / TILE_LENGTH; // 525 / 35 == 15
  final int TILES_PER_COLUMN = BOARD_HEIGHT / TILE_LENGTH; // 875 / 35 = 25
  playArea = new PlayArea(TILES_PER_ROW,TILES_PER_COLUMN,TILE_LENGTH);
  uiScreen = new UILAYOUT();
  displayScore = new SCORE();
}


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
  playArea.drawGrid();
  uiScreen.paint();
  displayScore.paint();
  textFont(f, 32);
  text("FUCKIN SCORE",100,100);
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


class UILAYOUT {
 float xPos, yPos, layoutWidth, layoutHeight;
   UILAYOUT() {
     this.xPos = 487.5;
     this.yPos = 0;
     this.layoutWidth = width - this.xPos;
     this.layoutHeight = 1000;
 }
 
 void paint() {
  fill(102, 255, 255);
  rect(this.xPos, this.yPos, this.layoutWidth ,this.layoutHeight);
 }
 
}

class PlayArea {
  int[][] logic;
  int rowSize, columnSize, tileSize;
    PlayArea(int rowSize, int columnSize,int tileSize) {
     logic = new int[rowSize][columnSize]; 
     this.rowSize = rowSize;
     this.columnSize = columnSize;
     this.tileSize = tileSize;
     println("Row size is " + this.rowSize);
     println("Column size is " + this.columnSize);
     for (int i = 0; i < this.rowSize; i++) {
       for (int j = 0; j < this.columnSize; j++) {
         logic[i][j] = 0;
         println("logic item [" + i + "][" + j + "] is set to 0");
        }
      }   
    }
 
   int[][] getLogic() { return this.logic; }
   
   void addNewBar() {
     
   }
   
   void drawGrid() {
      int x = 0;
      int y = 0;
      fill(255);
      //for (int i = 0; i < 25; i++) {
          for (int j = 0; j < 15; j++) {
            rect(x,y,tileSize,tileSize);
            x+=tileSize;
          }

   }
}

class SCORE {
  float xPos, yPos, scoreWidth, scoreHeight;
  SCORE() {
    this.xPos = 550;
    this.yPos = 50;
    this.scoreWidth = 150;
    this.scoreHeight = 50;
  }
  
  void paint() {
    fill(255);
    rect(this.xPos, this.yPos, this.scoreWidth, this.scoreHeight);
  }
}