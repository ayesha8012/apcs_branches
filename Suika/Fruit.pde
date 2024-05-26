int r; 
int m; 
color c; 
int x; 
int y;
String t; 

class Fruit{
  
   Fruit(int rad, int mass, color col, int xPos, int yPos, String type){
    r = rad; 
    m = mass; 
    c = col; 
    x = xPos; 
    y = yPos; 
    t = type; 
  }
  
  public int getRad(){
    return r; 
  }
  
  public void setRad(int rad){
    r = rad; 
  }
  
  public int getMass(){
    return m; 
  }
  
  public void setMass(int mass){
    m = mass; 
  }
    
  
  public color getColor(){
    return c; 
  }
  
  public void setColor(color col){
    c = col; 
  }
  
  public int getX(){
    return x; 
  }
  
  public void setX(int xPos){
    x = xPos; 
  }
  
  public int getY(){
    return y; 
  }
  
  public void setY(int yPos){
    y = yPos; 
  }
  
  public String getType(){
    return t; 
  }
  
  public void setType(String type){
    t = type; 
  }
}

  void merge(Fruit a, Fruit b){
      if (bounce(a, b)){
        //drawFruit(fruit()); 
      }
      // draw new fruit and delete older fruit
      // update score 
  }
  boolean bounce(Fruit a, Fruit b){
    //if (a.t == b.type){
    //}
    return false; 
  }
