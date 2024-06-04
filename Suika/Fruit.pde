class Fruit{
  PVector location;
  PVector velocity;
  final PVector acceleration = new PVector(0, 2);
  color c;
  float m; 
  int r; 
  String t;
  int x; 
  int y; 
  
  
 Fruit(int rad, float mass, int col, int xPos, int yPos, float xVel, float yVel, String type) {  
    location = new PVector(x, y); 
    velocity = new PVector(0, 2);
    c = col; 
    m = mass; 
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

  public void setMass(int mass){
    m = mass; 
  }

  public float getMass(){
    return m; 
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

  void overlap(ArrayList<Fruit> f){
    for (int i = 0 ; i < f.size() - 1; i++) {
    }
    //go through the array 
    //find the distance between the other fruits and the fruit you just dropped.
    //if the distance between the two centers is too close, make the y value that distance above
  }
  

  void display() {
    stroke(1);
    strokeWeight(2);
    fill(c);
    ellipse(location.x, location.y, 2*r, 2*r);
  }
  
}
