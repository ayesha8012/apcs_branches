class Fruit{
int r; 
int m; 
int c; 
int x; 
int y;
String t; 
  
   Fruit(int rad, int mass, color col, int xPos, int yPos, String type){
    r = rad; 
    m = mass; 
    c = col; 
    x = xPos; 
    y = yPos; 
    t = type; 
  }
}
   void drawFruit(Fruit a){
    fill(#edc8ab);
    noStroke();
    ellipse(a.x - 100, a.y - 100, a.r, a.r);
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
  void applyGravity(){
    // apply gravity of PVector
  }
