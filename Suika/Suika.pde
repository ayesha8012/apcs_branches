Fruit currentFruit; 
int score = 0;
String[] types = {"cherry", "strawberry", "grape", "tangerine", 
                  "orange", "apple", "pear", "peach", "pineapple", 
                "melon", "watermelon"};
int currentFruitIndex = 0; 

void setup(){
  size(800, 800); 
  draw(); 
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      currentFruit.setX(currentFruit.getX()- 10); 
    } else if (keyCode == RIGHT) {
      currentFruit.setX(currentFruit.getX() + 10);
    } else if (keyCode == ENTER) {
      applyGravity(); 
  }
  } 
}; 
  
void draw(){
  //next fruit from random list of fruits 
  background(255);
  text(score, 20, 20);  
  drawContainer();
  nextFruit(); 
  //strawberry(); 
  drawFruit(currentFruit);
}

void drawContainer(){
  stroke(0);
  strokeWeight(1);
  noFill();
  rect(100, 100, 600, 650);

}

void drawFruit(Fruit a){
    fill(a.getColor()); 
    noStroke();
    ellipse(a.getX() - 100, a.getY() - 100, a.getRad(), a.getRad());
  }
  
void cherry(){
  currentFruit = new Fruit(25, 10, color(229, 49, 99), 400, 400, "cherry"); 
}

void strawberry(){
  currentFruit = new Fruit(25, 10, color(255, 0, 0), 400, 400, "strawberry"); 
  //drawFruit(strawberry); 
}

void grape(){
  currentFruit = new Fruit(25, 10, color(128, 0, 128), 400, 400, "grape"); 
  //drawFruit(grape); 
}

void tangerine(){
  currentFruit = new Fruit(25, 10, color(255, 140, 0), 400, 400, "tangerine"); 
  //drawFruit(tangerine);
}

void orange(){
  currentFruit = new Fruit(25, 10, color(255, 165, 0), 400, 400, "orange"); 
  //drawFruit(orange);
}

void apple(){
  currentFruit = new Fruit(25, 10, color(0, 255, 0), 400, 400, "apple"); 
  //drawFruit(apple);
}

void pear(){
  currentFruit = new Fruit(25, 10, color(209, 226, 49), 400, 400, "pear"); 
  //drawFruit(pear);
}

void peach(){
  currentFruit = new Fruit(25, 10, color(255, 218, 185), 400, 400, "peach"); 
  //drawFruit(peach);
}

void pineapple(){
  currentFruit = new Fruit(25, 10, color(255, 223, 0), 400, 400, "pineapple"); 
  //drawFruit(pineapple);
}

void melon(){
  currentFruit = new Fruit(25, 10, color(240, 128, 128), 400, 400, "melon"); 
  //drawFruit(melon);
}

void watermelon(){
  currentFruit = new Fruit(25, 10, color(242, 51, 51), 400, 400, "watermelon"); 
  //drawFruit(watermelon);
}

void applyGravity(){
    // apply gravity of PVector
  }
  
void nextFruitIndex(){
  if (currentFruitIndex == 10){
    currentFruitIndex = 0; 
  }
  else {
    currentFruitIndex++;  
  }
}
  
void nextFruit(){ 
  nextFruitIndex(); 
  if (currentFruitIndex == 0){
    cherry(); 
  } else if (currentFruitIndex == 1){
    strawberry(); 
  }  else if (currentFruitIndex == 2){
    grape(); 
  }  else if (currentFruitIndex == 3){
    cherry(); 
  }  else if (currentFruitIndex == 4){
    tangerine(); 
  }  else if (currentFruitIndex == 5){
    orange(); 
  }  else if (currentFruitIndex == 6){
    apple(); 
  }  else if (currentFruitIndex == 7){
    pear(); 
  }  else if (currentFruitIndex == 8){
    pineapple(); 
  }  else if (currentFruitIndex == 9){
    melon(); 
  }  else {
    watermelon(); 
  }
}
