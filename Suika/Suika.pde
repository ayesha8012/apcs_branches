ArrayList<Fruit> fruits;
Fruit currentFruit = new Fruit(2, 2, color(248, 30, 30), 500, 250, 0, 2, "cherry"); 
int score = 0;
String[] types = {"cherry", "strawberry", "grape", "tangerine", 
                  "orange", "apple", "pear", "peach", "pineapple", 
                "melon", "watermelon"};
int currentFruitIndex = 0; 
int currentMergeIndex = 0;
PVector location = new PVector(mouseX, 250);
PVector velocity = new PVector(0, 2);
PVector acceleration = new PVector(0, 0);
int fruitX = 250;
int fruitY = 100;
boolean startGame = false;
boolean endGame = false;
int r = 0;
int g = 0; 
int b = 0;
String text = "";
int textX = 0;
int textY = 0;
Fruit w = watermelon();
boolean reachedTop = false;

void setup() {
  size(800, 800);
  fruits = new ArrayList<Fruit>();
}


void draw() {
  background(r,g,b);
  text(text, textX, textY);
  beginningScreen();
  mainBackgroundDisplay();
  //endScreen();
}

void mouseClicked() {
  if (mouseButton == LEFT) {
  Fruit fruit = nextFruit(currentFruit);
  currentFruit = fruit;  
  if (mouseX >= 100 + fruit.getRad() && mouseX <= 700 - fruit.getRad()) {
    fruit.setX(mouseX); 
    fruits.add(fruit);
  }
  updateScore(); 
  }
}

void mainBackgroundDisplay() {
  if (startGame == true) {
      //color c = color(255, 229, 180);
      r = 255;
      g = 229;
      b = 180;
      textSize(20);
      text = "";
      drawContainer();
      text(score, 30, 40);
      for (Fruit f : fruits) {
        f.display();
        f.move();
        f.overlap(fruits);
        f.bottom();
        //f.merge(f);
       }
       if (endGame == true) {
          r = 0;
          g = 0;
          b = 0;
          textX = 100;
          textY = 400;
          textSize(125);
          fill(255);
          text = "Game Over";
        }
      }
}


void beginningScreen() {
  r = 255;
  g = 224;
  b = 121;
  textX = 100;
  textY = 500; 
  //w.location.set(375, 300);
  //w.display();
  fill(255, 160, 16);
  text = "Suika Game";
  textSize(120);
  if (keyPressed && key == ' ') {
     startGame = true;
    }
}

void endScreen() {
    float loc = currentFruit.location.y;
    float radius = currentFruit.getRad();
    if (loc - radius < 100) {
      endGame = true;
    }
}


void drawContainer(){
  stroke(0);
  strokeWeight(5);
  noFill();
  rect(100, 100, 600, 680);
}

Fruit cherry(){
  currentFruitIndex = 0; 
  return new Fruit(16, 4, color(248, 30, 30), fruitX, fruitY, 0, 2, "cherry"); 
}

Fruit strawberry(){
  currentFruitIndex = 1; 
  return new Fruit(22, 5.5, color(241, 98, 64), fruitX, fruitY, 0, 2, "strawberry"); 
}

Fruit grape(){
  currentFruitIndex = 2; 
  return new Fruit(28, 7, color(198, 55, 238), fruitX, fruitY, 0, 2, "grape"); 
}

Fruit tangerine(){
  currentFruitIndex = 3; 
  return new Fruit(34, 8.5, color(234, 172, 41), fruitX, fruitY, 0, 2, "tangerine"); 
}

Fruit orange(){
  currentFruitIndex = 4;
  return new Fruit(40, 10, color(230, 113, 11), fruitX, fruitY, 0, 2, "orange"); 
  
}

Fruit apple(){
  currentFruitIndex = 5; 
  return new Fruit(46, 11.5, color(250, 10, 10), fruitX, fruitY, 0, 2, "apple"); 
}

Fruit pear(){
  currentFruitIndex = 6; 
  return new Fruit(52, 13, color(247, 183, 7), fruitX, fruitY, 0, 2, "pear"); 
}

Fruit peach(){
  currentFruitIndex = 7; 
  return new Fruit(58, 14.5, color(228, 145, 215), fruitX, fruitY, 0, 2, "peach"); 
}

Fruit pineapple(){
  currentFruitIndex = 8;
  return new Fruit(64, 16, color(247, 220, 84), fruitX, fruitY, 0, 2, "pineapple"); 
}

Fruit melon(){
  currentFruitIndex = 9; 
  return new Fruit(70, 17.5, color(158, 241, 118), fruitX, fruitY, 0, 2, "melon"); 
}

Fruit watermelon(){
  currentFruitIndex = 10; 
  return new Fruit(76, 19, color(38, 207, 32), fruitX, fruitY, 0, 2, "watermelon");
}

Fruit nextFruit(Fruit f){
  currentFruitIndex = (int)(random(types.length - 6));
  if (currentFruitIndex == 0){
    f =  cherry(); 
  } else if (currentFruitIndex == 1){
    f =  strawberry(); 
  }  else if (currentFruitIndex == 2){
    f =  grape(); 
  }  else if (currentFruitIndex == 3){
    f =  tangerine(); 
  }  else if (currentFruitIndex == 4){
    f = orange(); 
  } return f; 
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
    score += 20;
  }  else {
    score += 22; 
  }
}

void updateScoreMerged() {
  if (currentMergeIndex == 0){
    score += 2; 
  } else if (currentMergeIndex == 1){
    score += 4; 
  }  else if (currentMergeIndex == 2){
    score += 6; 
  }  else if (currentMergeIndex == 3){
    score += 8; 
  }  else if (currentMergeIndex == 4){
    score += 10; 
  }  else if (currentMergeIndex == 5){
    score += 12; 
  }  else if (currentMergeIndex == 6){
    score += 14; 
  }  else if (currentMergeIndex == 7){
    score += 16; 
  }  else if (currentMergeIndex == 8){
    score += 18; 
  }  else if (currentMergeIndex == 9){
    score += 20;
  }  else {
    score += 22; 
  }
}
