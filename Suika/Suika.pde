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

void dir() {
  if (keyPressed) {
    if (key == 'a'){
      currentFruit.setX(currentFruit.getX() - 10);
    }
    if (key == 'd') {
      currentFruit.setX(currentFruit.getX() + 10);
    } else if (key == 's'){
      applyGravity(); 
    }
  }
}; 
  
void draw(){
  //next fruit from random list of fruits 
  background(255, 229, 180);
  fill(0); 
  text(score, 40, 40);  
  drawContainer(); 
  watermelon(); 
  drawFruit(currentFruit); 
  while (currentFruit.getY() - currentFruit.getRad() < 200){
    nextFruit(); 
    drawFruit(currentFruit);
    while (keyCode != 's'){
      dir(); 
    } 
    updateScore(); 
  }
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
  currentFruit = new Fruit(25, 10, color(229, 49, 99), 500, 250, "cherry"); 
}

void strawberry(){
  currentFruit = new Fruit(25, 10, color(255, 0, 0), 500, 250, "strawberry"); 
  //drawFruit(strawberry); 
}

void grape(){
  currentFruit = new Fruit(25, 10, color(128, 0, 128), 500, 250, "grape"); 
  //drawFruit(grape); 
}

void tangerine(){
  currentFruit = new Fruit(25, 10, color(255, 140, 0), 500, 250, "tangerine"); 
  //drawFruit(tangerine);
}

void orange(){
  currentFruit = new Fruit(25, 10, color(255, 165, 0), 500, 250, "orange"); 
  //drawFruit(orange);
}

void apple(){
  currentFruit = new Fruit(25, 10, color(0, 255, 0), 500, 250, "apple"); 
  //drawFruit(apple);
}

void pear(){
  currentFruit = new Fruit(25, 10, color(209, 226, 49), 500, 250, "pear"); 
  //drawFruit(pear);
}

void peach(){
  currentFruit = new Fruit(25, 10, color(255, 218, 185), 500, 250, "peach"); 
  //drawFruit(peach);
}

void pineapple(){
  currentFruit = new Fruit(25, 10, color(255, 223, 0), 500, 250, "pineapple"); 
  //drawFruit(pineapple);
}

void melon(){
  currentFruit = new Fruit(25, 10, color(240, 128, 128), 500, 250, "melon"); 
  //drawFruit(melon);
}

void watermelon(){
  currentFruit = new Fruit(25, 10, color(242, 51, 51), 500, 250, "watermelon"); 
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

void updateScore(){
  if (currentFruitIndex == 0){
    score += 2; 
  } else if (currentFruitIndex == 1){
    score += 4; 
  }  else if (currentFruitIndex == 2){
    score += 6; 
  }  else if (currentFruitIndex == 3){
    score += 8; 
  }  else if (currentFruitIndex == 4){
    score += 10; 
  }  else if (currentFruitIndex == 5){
    score += 12; 
  }  else if (currentFruitIndex == 6){
    score += 14; 
  }  else if (currentFruitIndex == 7){
    score += 16; 
  }  else if (currentFruitIndex == 8){
    score += 18; 
  }  else if (currentFruitIndex == 9){
    score += 2;
  }  else {
    score += 22; 
  }
  
}

void merge(Fruit a, Fruit b){
      if (same(a, b)){
        //drawFruit(fruit()); 
        // delete previous fruits 
        // merge them to create new Fruit 
        // update Score 
      }
      // updateScore
  }

boolean same(Fruit a, Fruit b){
    if (a.getType().equals(b.getType())){
      return true; 
    }
    return false; 
  }
