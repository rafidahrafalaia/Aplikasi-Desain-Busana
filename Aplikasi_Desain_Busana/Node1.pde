class Node1 {
  float x1, y1, z1, x2, y2;
  boolean selected = false;
  
  Node1(float tempX1, float tempY1, float tempX2, float tempY2){//float tempX2, float tempY2
    x1 = tempX1;
    y1 = 0;
    z1 = tempY1;
    x2 = tempX2;
    y2 = tempY2;
  }
  void display(){
    fill(0);
    scale(10);
    point(x1,z1);
    point(x1,y1);
  }
}
