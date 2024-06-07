class Fruit{
  PVector location;
  PVector velocity;
  final PVector acceleration = new PVector(0, 2);
  color c;
  float f; 
  int r; 
  String t;
  int x; 
  int y; 
  boolean overlapped = false;
  boolean merged = false;
  boolean close = false;
  Fruit closest;
  Fruit fr;
  float frX;
  float frY;
  
  
 Fruit(int rad, float face, int col, int xPos, int yPos, float xVel, float yVel, String type) {  
    location = new PVector(x, y); 
    velocity = new PVector(0, 2);
    c = col; 
    f = face; 
    r = rad; 
    t = type; 
    x = xPos; 
    y = yPos; 
  }
  
  public void setRad(int rad){
    r = rad; 
  }

  public int getRad(){
    return r; 
  }

  public void setFace(int face){
    f = face; 
  }

  public float getFace(){
    return f; 
  }

  public void setColor(color col){
    c = col; 
  }

  public color getColor(){
    return c; 
  }

  public void setX(int xPos) {
    if (xPos + 100 > 210 && xPos < 800){
    location.x = xPos;
    }
  }

  public int getX(){
    return x; 
  }

  public void setY(int yPos) {
    y = yPos;
  }

  public int getY(){
    return y; 
  }
  
  public String getType(){
    return t; 
  }
  
  public void setType(String type){
    t = type; 
  }

  void move() {
    velocity.add(acceleration); 
    location.add(velocity);
  }
  
  void bottom() {
    if (location.y + r >= 780) {
      location.set(location.x, 780 - r);
      velocity.set(0,0);
      acceleration.set(0,0);
    }
  }

  //void closestFruit(ArrayList<Fruit> fruits, Fruit f) {
  //  if (fruits.size() < 2) {
  //    return;
  //  }
  //  float currentX = f.location.x;
  //  float currentY = f.location.y;
  //  float currentRad = f.getRad();
  //  float otherX = 0;
  //  float otherY = 0;
  //  float otherRad = 0;
  //  float distanceX = 0;
  //  float distanceY = 0;
  //  float requiredDistance = 0;
  //  float hypotenuse = 0;
  //  float closestDistance = 1000000;
  //  for (int i = 0; i < fruits.size(); i++) {
  //      Fruit otherFruit = fruits.get(i);
  //      otherY = otherFruit.location.y;
  //      otherX = otherFruit.location.x; 
  //      otherRad = otherFruit.getRad();
  //      distanceY = Math.abs(currentY - otherY);
  //      distanceX = Math.abs(currentX - otherX);
  //      hypotenuse = sqrt(sq(distanceX) + sq(distanceY));
  //      requiredDistance = currentRad + otherRad;
  //      if (hypotenuse < closestDistance) {
  //        closestDistance = hypotenuse;
  //        closest = otherFruit;
  //      }
  //  }
  //  //if (closestDistance != 1000000) {
  //    close = true;
  //  //}
  //}

void overlap(ArrayList<Fruit> fruits) {
    if (fruits.size() < 2) {
        return; 
    }
    Fruit currentFruit = fruits.get(fruits.size() - 1);
    float currentY = currentFruit.location.y;
    float currentX = currentFruit.location.x; 
    float currentRad = currentFruit.getRad();
    float otherY = 0;
    float otherX = 0;
    float otherRad = 0;
    float distanceY = 0;
    float distanceX = 0;
    float requiredDistance = 0;
    for (int i = 0; i < fruits.size() - 1; i++) {
        Fruit otherFruit = fruits.get(i);
        otherY = otherFruit.location.y;
        otherX = otherFruit.location.x; 
        otherRad = otherFruit.getRad();
        distanceY = Math.abs(currentY - otherY);
        distanceX = Math.abs(currentX - otherX);
        requiredDistance = currentRad + otherRad;
        if (distanceY <= requiredDistance && distanceX <= requiredDistance) {
            currentY = otherY - requiredDistance;
            currentFruit.location.set(currentX, currentY);
            velocity.set(0, 0);
            acceleration.set(0,0);
            overlapped = true;
            closest = otherFruit;
        }
    }
}


  
  void merge(Fruit f) {
    if (overlapped == true) {
      if (closest.getType() == f.getType()) {
        merged = true;
        overlapped = false;
        frX = f.location.x;
        frY = f.location.y;
        delete();
        deleteDisplay(f);
        deleteDisplay(closest);
        currentMergeIndex = currentFruitIndex + 1;
        if (currentMergeIndex > 0 && currentMergeIndex <= 10) {
          returnFruit(currentMergeIndex);
        }
          Fruit m = fr;
          fruits.add(m);
          displayNewFruit();
          }
        }
        else {
          return;
    }
  }
  
  void returnFruit(int c) {
     if (c == 1) {
      fr = strawberry();
    }
    else if (c == 2) {
      fr = grape();
    }
    else if (c == 3) {
      fr = tangerine();
    }
    else if (c == 4) {
      fr = orange();
    }
    else if (c == 5) {
      fr = apple();
    }
    else if (c == 6) {
      fr = pear();
    }
    else if (c == 7) {
      fr = peach();
    }
    else if (c == 8) {
      fr = pineapple();
    }
    else if (c == 9) {
      fr = melon();
    }
    else if (c == 10) {
     fr = watermelon();
    }
  }
  
  
  void displayNewFruit() {
    Fruit f = cherry();
    if (currentMergeIndex == 1) {
      f = strawberry();
      f.location.set(frX, frY);
      strawberry().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 2) {
      f = grape();
      f.location.set(frX, frY);
      grape().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 3) {
      f = tangerine();
      f.location.set(frX, frY);
      tangerine().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 4) {
      f = orange();
      f.location.set(frX, frY);
      orange().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 5) {
      f = apple();
      f.location.set(frX, frY);
      apple().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 6) {
      f = pear();
      f.location.set(frX, frY);
      pear().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 7) {
      f = peach();
      f.location.set(frX, frY);
      peach().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 8) {
      f = pineapple();
      f.location.set(frX, frY);
      pineapple().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 9) {
      f = melon();
      f.location.set(frX, frY);
      melon().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 10) {
      f = watermelon();
      f.location.set(frX, frY);
      watermelon().display();
      overlap(fruits);
    }
    else if (currentMergeIndex == 11) {
      currentMergeIndex = 0;
    }
  }
  
  void roll() {
    if (overlapped == true) {
      
    }
  }
  
  //void bounce() {
    
  //}
  
  void delete() {
    if (merged == true) {
    fruits.remove(fruits.size() - 1);
    fruits.remove(currentMergeIndex);
    merged = false;
    }
  }


  void display() {
    stroke(1);
    strokeWeight(2);
    fill(c);
    ellipse(location.x, location.y, 2*r, 2*r);
    if (currentFruitIndex == 0 || currentFruitIndex == 3 || currentFruitIndex == 6 || currentFruitIndex == 9) {
      fill(0, 0, 0);
      ellipse(location.x + f, location.y - f, f * 0.6, f * 0.6);
      ellipse(location.x - f, location.y - f, f * 0.6, f * 0.6);
      fill(255, 255, 255);
      ellipse(location.x, location.y + f, f * 1.5, 0.5);
      fill(255, 192, 203);
      arc(location.x + f, location.y + f, f, f*2, 0, PI, CHORD);
    }
    if (currentFruitIndex == 1 || currentFruitIndex == 4 || currentFruitIndex == 7 || currentFruitIndex == 10) {
      fill(0, 0, 0);
      ellipse(location.x + f, location.y - f, f * 0.6, f * 0.6);
      ellipse(location.x - f, location.y - f, f * 0.6, 1);
      fill(255, 255, 255);
      arc(location.x, location.y + f, f, f, 0, PI, CHORD);
    }  
    if (currentFruitIndex == 2 || currentFruitIndex == 5 || currentFruitIndex == 8) {
      fill(0, 0, 0);
      ellipse(location.x + f, location.y - f, f * 0.6, 1);
      ellipse(location.x - f, location.y - f, f * 0.6, 1);
      noFill();
      arc(location.x, location.y + f, f , f , 0, PI, OPEN);
    }  
  }
  
  void deleteDisplay(Fruit a) {
    noFill();
    noStroke();
    c = color(255, 229, 180);
    fill(c);
    ellipse(a.location.x, a.location.y, (2*r)+4.4, (2*r)+4.4);
  }
  
}
