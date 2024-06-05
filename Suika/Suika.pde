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
int timer = 0;

void setup() {
  size(800, 800);
  fruits = new ArrayList<Fruit>();
}


void draw() {
  mainBackgroundDisplay();
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
  background(255, 229, 180);
  drawContainer();
  for (Fruit f : fruits) {
    f.display();
    //f.bottom();
    f.overlap(fruits, f);
    f.move();
    //f.overlap(fruits, f);
   
  }
  fill(0);
  text(score, 30, 30);
}


void drawContainer(){
  stroke(0);
  strokeWeight(5);
  noFill();
  rect(100, 100, 600, 680);

}


Fruit cherry(){
  currentFruitIndex = 0; 
  return new Fruit(12, 3, color(248, 30, 30), fruitX, fruitY, 0, 0.1, "cherry"); 
}

Fruit strawberry(){
  currentFruitIndex = 1; 
  return new Fruit(18, 4.5, color(241, 98, 64), fruitX, fruitY, 0, 2, "strawberry"); 

}

Fruit grape(){
  currentFruitIndex = 2; 
  return new Fruit(25, 6.25, color(198, 55, 238), fruitX, fruitY, 0, 2, "grape"); 
}

Fruit tangerine(){
  currentFruitIndex = 3; 
  return new Fruit(31, 7.75, color(234, 172, 41), fruitX, fruitY, 0, 2, "tangerine"); 
}

Fruit orange(){
  currentFruitIndex = 4;
  return new Fruit(37, 9.25, color(230, 113, 11), fruitX, fruitY, 0, 2, "orange"); 
  
}

Fruit apple(){
  currentFruitIndex = 5; 
  return new Fruit(43, 10.75, color(250, 10, 10), fruitX, fruitY, 0, 2, "apple"); 
}

Fruit pear(){
  currentFruitIndex = 6; 
  return new Fruit(49, 12.25, color(247, 183, 7), fruitX, fruitY, 0, 2, "pear"); 
}

Fruit peach(){
  currentFruitIndex = 7; 
  return new Fruit(55, 13.75, color(228, 145, 215), fruitX, fruitY, 0, 2, "peach"); 
}

Fruit pineapple(){
  currentFruitIndex = 8;
  return new Fruit(61, 15.25, color(247, 220, 84), fruitX, fruitY, 0, 2, "pineapple"); 
}

Fruit melon(){
  currentFruitIndex = 9; 
  return new Fruit(67, 16.75, color(158, 241, 118), fruitX, fruitY, 0, 2, "melon"); 
}

Fruit watermelon(){
  currentFruitIndex = 10; 
  return new Fruit(73, 18.25, color(38, 207, 32), fruitX, fruitY, 0, 2, "watermelon");
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

void endScreen() {
  float loc = fruits.get(fruits.size() - 1).location.y;
  int radius = fruits.get(fruits.size() - 1).getRad();
  if (loc + radius <= 100) {
    background(0, 0, 0);
    textSize(200);
    text("Game Over", 350, 440);
  }
}
