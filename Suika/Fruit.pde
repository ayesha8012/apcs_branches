int r; 
int m; 
color c; 
int x; 
int y;
String t; 

PVector location;
PVector velocity;
PVector acceleration;

class Fruit{
  
   Fruit(int rad, int mass, color col, int xPos, int yPos, String type){
    r = rad; 
    m = mass; 
    c = col; 
    x = xPos; 
    y = yPos; 
    t = type; 
    location = new PVector(x, y); 
    velocity = new PVector(5, 5);
    acceleration = new PVector(0, 0);
  }
  
  void move() {
    velocity.add(acceleration); 
    location.add(velocity);
    acceleration.set(0, 0);
  }

  public void setStartPos(int startX, int startY){
    x = startX;
    y = startY;
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

  public int getMass(){
    return m; 
  }

  public void setColor(color col){
    c = col; 
  }

  public color getColor(){
    return c; 
  }

  public void setX(int xPos) {
    if (xPos + 100 > 210 && xPos + 100 < 800){
    x = xPos + 100;
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
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, m);
    acceleration.add(f);
  }
  
}
