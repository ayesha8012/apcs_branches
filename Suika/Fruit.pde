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
  float oldX; 
  float oldY; 
  int i;
  
  
 Fruit(int rad, float face, int col, int xPos, int yPos, float xVel, float yVel, String type, int index) {  
    location = new PVector(x, y); 
    velocity = new PVector(0, 2);
    c = col; 
    f = face; 
    r = rad; 
    t = type; 
    x = xPos; 
    y = yPos; 
    i = index;
  }
  
  public void setIndex(int index) {
    i = index;
  }
  
  public int getIndex() {
    return i;
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
    oldY = currentY; 
    float currentX = currentFruit.location.x; 
    oldX = currentX; 
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
            if (currentX < otherX) {
              if (currentFruit.getIndex() == otherFruit.getIndex()) {
                if (currentX < otherX - (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 13);
                }
                if (currentX < otherX - (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 12.5);
                }
                if (currentX < otherX - (otherFruit.getRad()/2)) {
                  currentY += (otherFruit.getRad() / 12);
                }
                 if (currentX < otherX - (otherFruit.getRad() + (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 11.5);
                }
                if (currentX < otherX - (otherFruit.getRad() + (otherFruit.getRad() / 8))) {
                  currentY += (otherFruit.getRad() / 11);
                }
                if (currentX < otherX - (otherFruit.getRad())) {
                  currentY += (otherFruit.getRad() / 10.5);
                }
                if (currentX < otherX - (otherFruit.getRad())) {
                  currentY += (otherFruit.getRad() / 10);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 5))) {
                  currentY += (otherFruit.getRad() / 9.5);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 9);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 3))) {
                  currentY += (otherFruit.getRad() / 8.5);
                }
              }
              if (currentFruit.getIndex() > otherFruit.getIndex()) {
                if (currentX < otherX - (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 17);
                }
                if (currentX < otherX - (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 16);
                }
                if (currentX < otherX - (otherFruit.getRad()/2)) {
                  currentY += (otherFruit.getRad() / 15);
                }
                 if (currentX < otherX - (otherFruit.getRad() + (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 14);
                }
                if (currentX < otherX - (otherFruit.getRad() + (otherFruit.getRad() / 8))) {
                  currentY += (otherFruit.getRad() / 13);
                }
                if (currentX < otherX - (otherFruit.getRad())) {
                  currentY += (otherFruit.getRad() / 12);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 5))) {
                  currentY += (otherFruit.getRad() / 11);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 10);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 3))) {
                  currentY += (otherFruit.getRad() / 9);
                }
              }
              if (currentFruit.getIndex() < otherFruit.getIndex()) {
                if (currentX < otherX - (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 15);
                }
                if (currentX < otherX - (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 14);
                }
                if (currentX < otherX - (otherFruit.getRad()/2)) {
                  currentY += (otherFruit.getRad() / 13);
                }
                 if (currentX < otherX - (otherFruit.getRad() + (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 12);
                }
                if (currentX < otherX - (otherFruit.getRad() + (otherFruit.getRad() / 8))) {
                  currentY += (otherFruit.getRad() / 11);
                }
                if (currentX < otherX - (otherFruit.getRad())) {
                  currentY += (otherFruit.getRad() / 10);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 5))) {
                  currentY += (otherFruit.getRad() / 9);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 8);
                }
                if (currentX < otherX - (otherFruit.getRad() - (otherFruit.getRad() / 3))) {
                  currentY += (otherFruit.getRad() / 7);
                }
              }
            }
            if (currentX > otherX) {
              if (currentFruit.getIndex() == otherFruit.getIndex()) {
                if (currentX > otherX + (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 13);
                }
                if (currentX > otherX + (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 12.5);
                }
                if (currentX > otherX + (otherFruit.getRad()/2)) {
                  currentY += (otherFruit.getRad() / 12);
                }
                if (currentX > otherX + (otherFruit.getRad() - (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 11.5);
                }
                if (currentX > otherX + (otherFruit.getRad() - (otherFruit.getRad() / 8))) {
                  currentY += (otherFruit.getRad() / 11);
                }
                if (currentX == otherX + (otherFruit.getRad())) {
                  currentY += (otherFruit.getRad() / 10.5);
                }
                if (currentX > otherX + (otherFruit.getRad())) {
                  currentY += (otherFruit.getRad() / 10);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/5)) {
                  currentY += (otherFruit.getRad() / 9.5);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 9);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 8.5);
                }
              }
              if (currentFruit.getIndex() > otherFruit.getIndex()) {
                if (currentX > otherX + (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 17);
                }
                if (currentX > otherX + (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 16);
                }
                if (currentX > otherX + (otherFruit.getRad()/2)) {
                  currentY += (otherFruit.getRad() / 15);
                }
                if (currentX > otherX + (otherFruit.getRad() - (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 14);
                }
                if (currentX > otherX + (otherFruit.getRad() - (otherFruit.getRad() / 8))) {
                  currentY += (otherFruit.getRad() / 13);
                }
                if (currentX > otherX + (otherFruit.getRad())) {
                  currentY += (otherFruit.getRad() / 12);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/5)) {
                  currentY += (otherFruit.getRad() / 11);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 10);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 9);
                }
              }
              if (currentFruit.getIndex() < otherFruit.getIndex()) {
                if (currentX > otherX + (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 15);
                }
                if (currentX > otherX + (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 14);
                }
                if (currentX > otherX + (otherFruit.getRad()/2)) {
                  currentY += (otherFruit.getRad() / 13);
                }
                if (currentX > otherX + (otherFruit.getRad() - (otherFruit.getRad() / 4))) {
                  currentY += (otherFruit.getRad() / 12);
                }
                if (currentX > otherX + (otherFruit.getRad() - (otherFruit.getRad() / 8))) {
                  currentY += (otherFruit.getRad() / 11);
                }
                if (currentX > otherX + (otherFruit.getRad())) {
                  currentY += (otherFruit.getRad() / 10);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/5)) {
                  currentY += (otherFruit.getRad() / 9);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/4)) {
                  currentY += (otherFruit.getRad() / 8);
                }
                if (currentX > otherX + (otherFruit.getRad()) + (otherFruit.getRad()/3)) {
                  currentY += (otherFruit.getRad() / 7);
                }
              }
            }
            currentFruit.location.set(currentX, currentY);
            velocity.set(0, 0);
            acceleration.set(0,0);
            overlapped = true;
            closest = otherFruit;
            //println(closest.getType()); 
            //println(currentFruit.getType()); 
            merged = ((closest.getType().equals(currentFruit.getType())) && !(closest.getType().equals(types[10]))); 
        }
    }
}
  





  
  void merge(Fruit f) {
    if (overlapped && merged) {
        overlapped = false;
        //ArrayList<Fruit> newFruits = fruits; 
        //delete(newFruits);
        //listIndex--; 
        //listIndex--; 
        //dzeleteDisplay(f);
        //deleteDisplay(closest);
        displayNewFruit(f); 
    }
  }
 
  
  Fruit nextFruit(String s) {
    //get the type of the fruits you want to merge
    Fruit f = cherry();  
    println(s); 
    String t = nextType(s); 
    println(t); 
    Fruit newFruit = cherry(); 
    if (t.equals(types[1])){
      f = strawberry();  
    } if (t.equals(types[2])){
      f = grape(); 
    } if (t.equals(types[3])){
      f = tangerine(); 
    } if (t.equals(types[4])){
      f = orange(); 
    } if (t.equals(types[5])){
      f = apple(); 
    } if (t.equals(types[6])){
      f = pear(); 
    } if (t.equals(types[7])){
      f = peach(); 
    } if (t.equals(types[8])){
      f = pineapple(); 
    } if (t.equals(types[9])){
      f = melon(); 
    } if (t.equals(types[10])) {
      f = watermelon(); 
    } return f; 
  }
  
  void displayNewFruit(Fruit f){
    f = nextFruit(f.getType()); 
    f.location.x = oldX; 
    f.location.y = oldY; 
    f.display();
  }
  
  String nextType(String t){
    if (t.equals(types[0])){
      return types[1]; 
    } if (t.equals(types[1])){
      return types[2]; 
    } if (t.equals(types[2])){
      return types[3]; 
    } if (t.equals(types[3])){
      return types[4]; 
    } if (t.equals(types[4])){
      return types[5]; 
    } if (t.equals(types[5])){
      return types[6]; 
    } if (t.equals(types[6])){
      return types[7]; 
    } if (t.equals(types[7])){
      return types[8]; 
    } if (t.equals(types[8])){
      return types[9]; 
    } if (t.equals(types[9])){
      return types[10]; 
    } else {
      return types[10]; 
    }
  }
  
  void roll(ArrayList<Fruit> fr, Fruit f) {
    if (overlapped == true) {
      
    }
  }
  
   void delete(ArrayList<Fruit> fruits) {
    Fruit f = fruits.get(fruits.size() - 1);
    fruits.remove(fruits.size() - 1);
    fruits.remove(currentMergeIndex); 
    String nt = nextType(f.getType()); 
    fruits.add(nextFruit(nt)); 
    merged = false;
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
