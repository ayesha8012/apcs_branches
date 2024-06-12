Fruit closest;

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
  Fruit fr;
  float frX;
  float frY;
  float oldX; 
  float oldY; 
  int i;
  Fruit currentFruit; 
  Fruit otherFruit;
  float currentX;
  float otherX;
  float overlappedIndex;
  int m; 
  boolean isTouching = false; 
  float angularVelocity;
  float angle;
  
  
 Fruit(int rad, float face, int mass, int col, int xPos, int yPos, float xVel, float yVel, String type, int index) {  
    location = new PVector(x, y); 
    velocity = new PVector(xVel, yVel);
    c = col; 
    f = face; 
    r = rad; 
    t = type; 
    x = xPos; 
    y = yPos; 
    i = index;
    m = mass; 
    this.angularVelocity = 0;
    this.angle = 0;
  }
  
  void update() {
        location.add(velocity);
        angle += angularVelocity;
    }
    
    


void collide(Fruit other) {
    if (fruits.size() < 2) {
        return;
    }
    currentFruit = fruits.get(fruits.size() - 1);
    PVector difference = currentFruit.location.copy().sub(other.location);
    while (currentFruit.location.dist(other.location) <= currentFruit.getRad() + other.getRad()) {
        PVector shift = difference.copy().normalize();
        
        shift.y += 0.1; 
        shift.normalize();
        
        currentFruit.location.add(shift);
        other.location.sub(shift);
        
        currentFruit.location.y += 0.5; 
        other.location.y += 0.5;
    }

    currentFruit.velocity = new PVector(0, currentFruit.velocity.mag());
    other.velocity = new PVector(0, other.velocity.mag());
    
    PVector relativeVelocity = PVector.sub(other.velocity, currentFruit.velocity);
    
    float angle = relativeVelocity.heading();
    
    relativeVelocity.rotate(angle / PI);
    
    currentFruit.velocity.add(relativeVelocity);
    other.velocity.add(relativeVelocity);
      PVector finalVel1 = new PVector(1,0);
      PVector finalVel2 = new PVector(1,0);
      float mag1 = (2 * this.getMass()) / (this.getMass() + other.getMass()) * this.velocity.mag() - (this.getMass() - other.getMass()) / (this.getMass() + other.getMass()) * other.velocity.mag();
      finalVel1.setMag(mag1*.3);
      float mag2 = (this.getMass() - other.getMass()) / (this.getMass() + other.getMass()) * this.velocity.mag() + (2 * other.getMass()) / (this.getMass() + other.getMass()) * other.velocity.mag();
      finalVel2.setMag(mag2*.3);
      float heading = this.location.copy().sub(other.location).heading();
      finalVel1.rotate(heading);
      finalVel2.rotate(heading+3.1415);
      this.velocity = finalVel1;
      other.velocity = finalVel2;
      checkBounds(this); 
      checkBounds(other); 
      overlap(fruits); 

}



void checkBounds(Fruit fruit) {
     if (location.x - r <= 100) {
      location.set(location.x + r, location.y);
      velocity.set(0,0);
      acceleration.set(0,0);
    }
    if (location.x + r >= 700) {
      location.set(location.x - r, location.y);
      velocity.set(0,0);
      acceleration.set(0,0);
    }
}


   
  
  public int getMass(){
    return m; 
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


void overlap(ArrayList<Fruit> fruits) {
    if (fruits.size() < 2) {
        return; 
    }
    currentFruit = fruits.get(fruits.size() - 1);
    float currentY = currentFruit.location.y;
    oldY = currentY - 50; 
    currentX = currentFruit.location.x; 
    oldX = currentX; 
    float currentRad = currentFruit.getRad();
    float otherY = 0;
    otherX = 0;
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
            overlappedIndex = i;
            currentMergeIndex = i;
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
            if (currentFruit.location.x != otherFruit.location.x){
            if (Math.random() < 0.4 ) {
             currentFruit.velocity.set(-10, -20);
            } else {
            currentFruit.velocity.set(20, 20);
            }
            }
            acceleration.set(0,1);
            overlapped = true;
            closest = otherFruit;
            merged = ((closest.getType().equals(currentFruit.getType()))
            && !(closest.getType().equals(types[10]))); 
            //collide(closest); 
            checkBounds(closest); 
            checkBounds(currentFruit); 
            }
        }
    }
    

// collision velocity  formula 
  // rotate and heading 
  // .rotate 
  // .heading 
  // subtractor which PVector of the location or velocity 
  
  void merge(Fruit f) {
    if (overlapped && merged) {
        overlapped = false;
        displayNewFruit(f);
        velocity.set(0, 2);
        acceleration.set(0, 0);
        overlap(fruits);
    }
  }
 
  
  Fruit nextFruit(String s) {
    //get the type of the fruits you want to merge
    Fruit f = cherry();  
    println(s); 
    String t = nextType(s); 
    println(t); 
    //Fruit newFruit = cherry(); 
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
    if (fruits.size() >= 2) {
    f = nextFruit(f.getType()); 
    fruits.add(f);
    f.location.x = oldX; 
    f.location.y = oldY; 
    f.display();
    Fruit a = fruits.get(fruits.size() - 2);
    fruits.remove(a);
    listIndex--; 
    fruits.remove(currentMergeIndex); 
    merged = false;
    }
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
  
  
  
  
  
  
  boolean checkFruitNextToIt(ArrayList<Fruit> fruits) {
      float distanceX = 0;
      float requiredDistance = 0;
      Fruit otherFruitNew = cherry(); 
      otherFruit = otherFruitNew; 
      for (int i = 0; i < fruits.size() - 1; i++) {
        if ( i != overlappedIndex) {
          otherFruit = fruits.get(i);
          print(otherFruit.location.x); 
        }
        if (otherFruit.location.x > 0){
        otherX = otherFruit.location.x;
        }
        distanceX = Math.abs(currentX - otherX);
        print(currentFruit.getRad()); 
        requiredDistance = currentFruit.getRad() + otherFruit.getRad();
        if (distanceX < requiredDistance) {
          return false;
        } 
      }
    return true;
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
