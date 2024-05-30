Fruit fruit; 
int score = 0;


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      //move fruit to left
    } else if (keyCode == RIGHT) {
      //move fruit to right
    } else if (keyCode == ENTER) {
    // drop fruit
  }
  } 
}; 
  
void setup() {
  size(800, 800);
  x = 0;
  y = 0;
}

void draw(){
  //next fruit from random list of fruits 
  text(score, 20, 20);
  background(112, 442, 432);
  cherry();
}
