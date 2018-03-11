

// DEFINE IN MEMORY
Block whiteBlock;






//IMPLEMENT OBJECTS
void setup () {
  size (750, 1000);
  background (102);
  whiteBlock = new Block(3);
}



//DRAW IN CANVAS
void draw() {
  fill(0);
  rect(0,0,750,1000);
  whiteBlock.paint();
  whiteBlock.moveRight();
}


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
    rect(this.xPos,this.yPos,this.blockWidth,this.blockHeight);
  }
}