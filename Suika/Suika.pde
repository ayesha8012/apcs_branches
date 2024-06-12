ArrayList<Fruit> fruits;
Fruit currentFruit = new Fruit(16, 4, 4, color(248, 30, 30), 500, 250, 0, 2, "Cherry", 0); 
int score = 0;
String[] types = {"Cherry", "Strawberry", "Grape", "Tangerine", 
                  "Orange", "Apple", "Pear", "Peach", "Pineapple", 
                "Melon", "Watermelon"};
int currentFruitIndex = 0; 
int listIndex = -1;
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
int wIndex = 10;
Fruit a = apple();
int aIndex = 5;
Fruit o = orange();
int oIndex = 4;
Fruit t = tangerine();
int tIndex = 3;
boolean reachedTop = false;
String whichFruit = "Cherry";

void setup() {
  size(800, 800);
  fruits = new ArrayList<Fruit>();
}


void draw() {
  background(r,g,b);
  text(text, textX, textY);
  beginningScreen();
  mainBackgroundDisplay();
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    whichFruit = nextFruitType(currentFruit); 
  }
  if (mouseButton == LEFT) {
    Fruit fruit = nextFruit(currentFruit);
    currentFruit = fruit;
    listIndex++; 
  if (mouseX >= 100 + fruit.getRad() && mouseX <= 700 - fruit.getRad()) {
    fruit.setX(mouseX); 
    fruits.add(fruit);
  }
  updateScore(); 
  }
}

void mainBackgroundDisplay() {
  if (startGame == true) {
      r = 255;
      g = 229;
      b = 180;
      textSize(20);
      text = "";
      drawContainer();
      text(score, 30, 40);
      text(whichFruit, 680, 40);
      w.deleteDisplay(w);
      a.deleteDisplay(a);
      o.deleteDisplay(o);
      t.deleteDisplay(t);
      //Fruit fr = cherry(); 
      for (int i = 0; i < fruits.size(); i++) {
        Fruit f = fruits.get(i); 
        //fr = f; 
        f.display();
        f.move();
        f.overlap(fruits);
        f.bottom(); 
        f.merge(f);
        f.roll(fruits); 
       }
       if (listIndex > 1) {
         //println((fruits.get(listIndex - 1)).location.y);
         endScreen(fruits.get(listIndex - 1));
       }
       if (endGame == true) { 
          background(0);
          textSize(75);
          fill(255);
          text("Score: " + score, width/2 - 100, 300);
          textSize(112); 
          fill(255);
          String game = "Game Over :("; 
          text(game, width/2 - 310, 500);
        } 
    }
}


void beginningScreen() {
  r = 255;
  g = 224;
  b = 121;
  textX = 100;
  textY = 500; 
  w.location.set(400, 300);
  w.display();
  a.location.set(300, 350);
  a.display();
  o.location.set(500, 350);
  o.display();
  t.location.set(400, 200);
  t.display();
  currentFruitIndex = 10;
  fill(255, 160, 16);
  text = "Suika Game";
  textSize(120);
  if (keyPressed && key == ENTER) {
     startGame = true;
    }
}

void endScreen(Fruit f) {
    if (f.location.y - f.getRad() <= 100) {
      endGame = true;
    }
}






String nextFruitType(Fruit f){
  String s = f.getType();  
  currentFruitIndex = (int)(random(types.length - 6));
  if (currentFruitIndex == 0){
    s = "Cherry";
  } else if (currentFruitIndex == 1){
    s = "Strawberry"; 
  }  else if (currentFruitIndex == 2){
    s = "Grape";
  }  else if (currentFruitIndex == 3){
    s = "Tangerine";
  }  else if (currentFruitIndex == 4){
    s = "Orange";
  } return s; 
  
}

Fruit nextFruit(Fruit f){
  if (whichFruit.equals("Cherry")){
    f = cherry(); 
  } else if (whichFruit.equals("Strawberry")){
    f =  strawberry(); 
  }  else if (whichFruit.equals("Grape")){
    f =  grape(); 
  }  else if (whichFruit.equals("Tangerine")){
    f =  tangerine(); 
  }  else if (whichFruit.equals("Orange")){
    f = orange(); 
  } 
  return f; 
}


void drawContainer(){
  stroke(0);
  strokeWeight(5);
  noFill();
  rect(100, 100, 600, 680);
}

Fruit cherry(){
  currentFruitIndex = 0; 
  return new Fruit(16, 4, 4, color(248, 30, 30), fruitX, fruitY, 0, 2, "Cherry", 0); 
}

Fruit strawberry(){
  currentFruitIndex = 1; 
  return new Fruit(22, 5.5, 5.5, color(241, 98, 64), fruitX, fruitY, 0, 2, "Strawberry", 1); 
}

Fruit grape(){
  currentFruitIndex = 2; 
  return new Fruit(28, 7, 7, color(198, 55, 238), fruitX, fruitY, 0, 2, "Grape", 2); 
}

Fruit tangerine(){
  currentFruitIndex = 3; 
  return new Fruit(34, 8.5, 8.5, color(255, 203, 80), fruitX, fruitY, 0, 2, "Tangerine", 3); 
}

Fruit orange(){
  currentFruitIndex = 4;
  return new Fruit(40, 10, 10, color(252, 153, 24), fruitX, fruitY, 0, 2, "Orange", 4); 
  
}

Fruit apple(){
  currentFruitIndex = 5; 
  return new Fruit(46, 11.5, 11.5, color(250, 10, 10), fruitX, fruitY, 0, 2, "Apple", 5); 
}

Fruit pear(){
  currentFruitIndex = 6; 
  return new Fruit(52, 13, 13, color(247, 183, 7), fruitX, fruitY, 0, 2, "Pear", 6); 
}

Fruit peach(){
  currentFruitIndex = 7; 
  return new Fruit(58, 14.5, 14.5, color(228, 145, 215), fruitX, fruitY, 0, 2, "Peach", 7); 
}

Fruit pineapple(){
  currentFruitIndex = 8;
  return new Fruit(64, 16, 16, color(247, 220, 84), fruitX, fruitY, 0, 2, "Pineapple", 8); 
}

Fruit melon(){
  currentFruitIndex = 9; 
  return new Fruit(70, 17.5, 17.5, color(158, 241, 118), fruitX, fruitY, 0, 2, "Melon", 9); 
}

Fruit watermelon(){
  currentFruitIndex = 10; 
  return new Fruit(76, 19, 19, color(38, 207, 32), fruitX, fruitY, 0, 2, "Watermelon", 10);
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
