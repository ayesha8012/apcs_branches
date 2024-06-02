class Fruit{
  PVector location;
  PVector velocity;
  PVector acceleration;
  color c;
  float m; 
  int r; 
  String t;
  int x; 
  int y; 
  
 Fruit(int rad, float mass, int col, int xPos, int yPos, float xVel, float yVel, String type) {  
    location = new PVector(x, y); 
    velocity = new PVector(0, 2);
    acceleration = new PVector(0, 0);
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
    acceleration.set(0, 0);
  }

  void bounce() {
    if (location.x > 700 - 50) {
        location.x = 700 - 50;
    } else if (location.x < 150 - r) {
        location.x = 150 + r;
    }
    if (location.y - r > 800 - 50) {
        location.y = 800 - 50;
    } else if (location.y + r < 100) {
        location.y = 100 + r;
    }
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, m);
    acceleration.add(f);
  }

  void display() {
    stroke(1);
    strokeWeight(2);
    fill(c);
    ellipse(location.x, location.y, 50 * m, 50 * m);
  }
  
}
