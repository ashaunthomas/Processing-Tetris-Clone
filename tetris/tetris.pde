

// DEFINE IN MEMORY
Block whiteBlock; 




//IMPLEMENT OBJECTS
void setup () {
  size (640, 360);
  background (102);
  whiteBlock = new Block(3);
}


//DRAW IN CANVAS
void draw() {
  fill(255);
  rect(0,0,640,360);
  whiteBlock.paint();
  whiteBlock.moveRight();
}


class Block {
  float xPos, yPos, blockWidth, blockHeight;
  boolean hitRightSide = false;
  Block(int placement) {
    this.xPos = placement;
    this.yPos = 40;
    this.blockHeight = 10;
    this.blockWidth = this.blockHeight;
  }
  
  void moveRight() {
      this.xPos+=3;
  }
  
  void paint() {
    fill(#ff0000); //red
    rect(this.xPos,this.yPos,this.blockWidth,this.blockHeight);
  }
}

class Tile {
   int x,y,w,h;
}