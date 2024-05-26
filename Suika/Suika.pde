Fruit fruit; 
int score = 0;

void setup(){
  size(800, 800); 
  fruit = new Fruit(50, 10, color(237, 200, 171), 400, 400, "apple");
  draw(); 
}

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
  
void draw(){
  //next fruit from random list of fruits 
  text(score, 20, 20); 
  drawFruit(fruit);
}

void drawFruit(Fruit a){
    fill(#edc8ab);
    noStroke();
    ellipse(a.getX() - 100, a.getY() - 100, a.getRad(), a.getRad());
  }
