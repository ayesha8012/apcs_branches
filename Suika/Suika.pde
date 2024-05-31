Fruit currentFruit = new Fruit(25, 10, color(248, 30, 30), 500, 250, "cherry"); 
int score = 0;
String[] types = {"cherry", "strawberry", "grape", "tangerine", 
                  "orange", "apple", "pear", "peach", "pineapple", 
                "melon", "watermelon"};
int currentFruitIndex = 0; 
boolean dropped = false;
int currentMergeIndex = 0;
PVector location = new PVector(mouseX, 250);
PVector velocity = new PVector(0, 0);
PVector acceleration = new PVector(0, 0.2);
int fruitX = 500;
int fruitY = 250;

void setup(){
  size(800, 800); 
  draw();  
}

void draw(){
  //next fruit from random list of fruits 
  //location.add(velocity);
  //velocity.add(acceleration);
  text(score, 20, 20);
  background(255, 229, 180);
  fill(0); 
  drawContainer(); 
  drawFruit(currentFruit); 
  if (mousePressed) {
    currentFruit.setX(mouseX);
  }
 
  //while (dropped == true){
  //  nextFruit(); 
  //  drawFruit(currentFruit);
  //  updateScore(); 
  //  dropped = false;
  //}
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
  currentFruit = new Fruit(25, 10, color(248, 30, 30), fruitX, fruitY, "cherry"); 
}

void strawberry(){
  currentFruit = new Fruit(25, 10, color(241, 98, 64), fruitX, fruitY, "strawberry"); 
  //drawFruit(strawberry); 
}

void grape(){
  currentFruit = new Fruit(25, 10, color(198, 55, 238), fruitX, fruitY, "grape"); 
  //drawFruit(grape); 
}

void tangerine(){
  currentFruit = new Fruit(25, 10, color(234, 172, 41), fruitX, fruitY, "tangerine"); 
  //drawFruit(tangerine);
}

void orange(){
  currentFruit = new Fruit(25, 10, color(241, 146, 27), fruitX, fruitY, "orange"); 
  //drawFruit(orange);
}

void apple(){
  currentFruit = new Fruit(25, 10, color(250, 10, 10), fruitX, fruitY, "apple"); 
  //drawFruit(apple);
}

void pear(){
  currentFruit = new Fruit(25, 10, color(125, 244, 106), fruitX, fruitY, "pear"); 
  //drawFruit(pear);
}

void peach(){
  currentFruit = new Fruit(25, 10, color(228, 145, 215), fruitX, fruitY, "peach"); 
  //drawFruit(peach);
}

void pineapple(){
  currentFruit = new Fruit(25, 10, color(246, 234, 83), fruitX, fruitY, "pineapple"); 
  //drawFruit(pineapple);
}

void melon(){
  currentFruit = new Fruit(25, 10, color(158, 241, 118), fruitX, fruitY, "melon"); 
  //drawFruit(melon);
}

void watermelon(){
  currentFruit = new Fruit(39, 10, color(38, 207, 32), fruitX, fruitY, "watermelon"); 
  //drawFruit(watermelon);
}

void nextFruit(){
  currentFruitIndex = (int)(random(types.length - 6));
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

boolean merge(Fruit a, Fruit b){
      if (same(a, b)){
        //drawFruit(fruit()); 
        // delete previous fruits 
        // merge them to create new Fruit 
        // update Score 
        return true;
      }
      else {
        return false;
      }
  }

boolean same(Fruit a, Fruit b){
    if (a.getType().equals(b.getType())){
      return true; 
    }
    return false; 
  }
