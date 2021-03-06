
//********** DEFINE IN MEMORY **********/
PlayArea playArea;
UILAYOUT uiScreen;
SCORE displayScore;
NextShape uiNextShape;
Level uiLevel;
Lines uiLines;


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
  playArea = new PlayArea(TILES_PER_COLUMN,TILES_PER_ROW,TILE_LENGTH);
  uiScreen = new UILAYOUT();
  displayScore = new SCORE();
  uiNextShape = new NextShape();
  uiLevel = new Level();
  uiLines = new Lines();
}


//*********** DRAW IN CANVAS **********/
void draw() {
  // Displays the contents of the current screen
  if (gameScreen == 0) {
    initScreen();
    textFont(f, 56);
    fill(255);
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
  }
  
void gameScreen() {
  background (0);
  // Next blocks will test movement of tile
  fill(0);
  rect(0,0,750,1000);
  playArea.drawGrid();
  playArea.addSquare(2,1);
  uiScreen.paint();
  displayScore.paint();
  textFont(f, 32);
  text("SCORE", 620, 49);
  uiNextShape.paint();
  textFont(f, 32);
  text("NEXT SHAPE", 620, 224);
  uiLevel.paint();
  textFont(f, 32);
  text("LEVEL", 620, 499);
  uiLines.paint();
  textFont(f, 32);
  text("LINES", 620, 599);
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
  Tile[][] logic;
  int numBoxesInRow, numBoxesInColumn, tileSize;
    PlayArea(int numBoxesInRow, int numBoxesInColumn,int tileSize) {
     int x = 0;
     int y = 0;
     logic = new Tile[numBoxesInRow][numBoxesInColumn]; 
     this.numBoxesInRow = numBoxesInRow;
     this.numBoxesInColumn = numBoxesInColumn;
     this.tileSize = tileSize;
     println("Row size is " + this.numBoxesInColumn);
     println("Column size is " + this.numBoxesInRow);
     for (int i = 0; i < this.numBoxesInRow; i++) {
       for (int j = 0; j < this.numBoxesInColumn; j++) {
         logic[i][j] = new Tile(x,y);
         x+=tileSize;
        }
        x = 0;
        y+=tileSize;
      }
    }
 
   Tile[][] getLogic() { return this.logic; }
   
   void addNewBar() {
     
   }
   
   void drawGrid() {
      for (int i = 0; i < this.numBoxesInRow; i++) {
        for (int j = 0; j < this.numBoxesInColumn; j++) {
          logic[i][j].paint();
        }
        
      }
   }
   
   void addSquare(int col, int row) {
     int shapeWidth = 2;
     int shapeHeight = 2;
     int rowTemp = row, colTemp = col;
     if (col > this.numBoxesInRow || col < -1) {
       println("ERROR IN ADDSQUARE FUNCTION: OUT OF DOMAIN"); 
     }
     else if (row < 0 || row > this.numBoxesInColumn) {
       println("ERROR IN ADDSQUARE FUNCTION: OUT OF RANGE"); 
     }
     else {
       for (int i = 0; i < shapeHeight; i++) {
         for (int j = 0; j < shapeWidth; j++) {
           logic[colTemp][rowTemp].setOccupied();
           rowTemp++;
         } 
         rowTemp = row;
         colTemp++;
       } 
     }
   }
   
   void addLine(int col, int row) {
     int shapeWidth = 1;
     int shapeHeight = 4;
   }
}

class Tile {
   int xPos, yPos, size = 35;
   boolean isOccupied;
   color[] colors = { 255, #ff0000 };
   Tile(int xPos, int yPos) {
      this.xPos = xPos;
      this.yPos = yPos;
      this.isOccupied = false;
   }
   
   void setOccupied() {
     isOccupied = true; 
   }
   
   void setUnoccupied() {
      isOccupied = false; 
   }
   
   void paint() {
     color currentColor = isOccupied ? colors[1] : colors[0];
     fill(currentColor);
     rect(this.xPos,this.yPos,size,size);
   }
   
}

class SCORE {
  float xPos, yPos, scoreWidth, scoreHeight;
  SCORE() {
    this.xPos = 545;
    this.yPos = 50;
    this.scoreWidth = 150;
    this.scoreHeight = 50;
  }
  
  void paint() {
    fill(255);
    rect(this.xPos, this.yPos, this.scoreWidth, this.scoreHeight);
  }
}

class NextShape {
  float xPos, yPos, uiWidth, uiHeight;
  NextShape() {
    this.xPos = 500;
    this.yPos = 225;
    this.uiWidth = 240;
    this.uiHeight = 200;
  }
  
  void paint() {
    fill(255);
    rect(xPos, yPos, uiWidth, uiHeight);
  }
}

class Level {
  float xPos, yPos, uiWidth, uiHeight;
  Level() {
    this.xPos = 500;
    this.yPos = 500;
    this.uiWidth = 240;
    this.uiHeight = 50;
  }
  
  void paint() {
    fill(255);
    rect(xPos, yPos, uiWidth, uiHeight);
  }
}

class Lines {
  float xPos, yPos, uiWidth, uiHeight;
  Lines() {
    this.xPos = 500;
    this.yPos = 600;
    this.uiWidth = 240;
    this.uiHeight = 50;
  }
  
  void paint() {
    fill(255);
    rect(xPos, yPos, uiWidth, uiHeight);
  }
}