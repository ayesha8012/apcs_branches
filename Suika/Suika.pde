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
int fruitX = 100;
int fruitY = 250;

void setup() {
  size(800, 800);
  fruits = new ArrayList<Fruit>();
}

void mouseClicked() {
  if (mouseButton == LEFT) {
  Fruit fruit = nextFruit(currentFruit);
  //fruit = watermelon(); 
  currentFruit = fruit;  
  fruit.setX(mouseX); 
  fruits.add(fruit);
  updateScore(); 
  }
}

void draw() {
  
  background(255, 229, 180);
  drawContainer();
  for (Fruit f : fruits) {
    f.applyForce(new PVector(0, 1).mult(f.m)); 
    f.move();
    f.bounce();
  }
  fill(0);
  text(score, 20, 20);
}

void drawContainer(){
  stroke(0);
  strokeWeight(5);
  noFill();
  rect(100, 100, 600, 680);

}


Fruit cherry(){
  currentFruitIndex = 0; 
  return new Fruit(0.5, 0.5, color(248, 30, 30), fruitX, fruitY, 0, 0.1, "cherry"); 
}

Fruit strawberry(){
  currentFruitIndex = 1; 
  return new Fruit(0.75, 0.75, color(241, 98, 64), fruitX, fruitY, 0, 2, "strawberry"); 

}

Fruit grape(){
  currentFruitIndex = 2; 
  return new Fruit(1, 1, color(198, 55, 238), fruitX, fruitY, 0, 2, "grape"); 
}

Fruit tangerine(){
  currentFruitIndex = 3; 
  return new Fruit(1.25, 1.25, color(234, 172, 41), fruitX, fruitY, 0, 2, "tangerine"); 
}

Fruit orange(){
  currentFruitIndex = 4;
  return new Fruit(1.5, 1.5, color(230, 113, 11), fruitX, fruitY, 0, 2, "orange"); 
  
}

Fruit apple(){
  currentFruitIndex = 5; 
  return new Fruit(1.75, 1.75, color(250, 10, 10), fruitX, fruitY, 0, 2, "apple"); 
}

Fruit pear(){
  currentFruitIndex = 6; 
  return new Fruit(2, 2, color(247, 183, 7), fruitX, fruitY, 0, 2, "pear"); 
}

Fruit peach(){
  currentFruitIndex = 7; 
  return new Fruit(2.25, 2.25, color(228, 145, 215), fruitX, fruitY, 0, 2, "peach"); 
}

Fruit pineapple(){
  currentFruitIndex = 8;
  return new Fruit(2.5, 2.5, color(247, 220, 84), fruitX, fruitY, 0, 2, "pineapple"); 
}

Fruit melon(){
  currentFruitIndex = 9; 
  return new Fruit(2.75, 2.75, color(158, 241, 118), fruitX, fruitY, 0, 2, "melon"); 
}

Fruit watermelon(){
  currentFruitIndex = 10; 
  return new Fruit(3, 3, color(38, 207, 32), fruitX, fruitY, 0, 2, "watermelon");
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
    score += 2;
  }  else {
    score += 22; 
  }
  
}
