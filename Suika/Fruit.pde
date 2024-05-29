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

  public setStartPos(int startX, int startY){
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
  
  public int getX(){
    return x; 
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
}
