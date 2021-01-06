class MenuItem {
  String menuItemText;  // text
  float x, y, w, h;     // pos and size 
  int index = -1;       // its index for command
 
  MenuItem(String string_){
    menuItemText = string_;
  }
 
  void display(boolean selected){
    fill(selected?255:25);
    stroke(180);
    rect(x, y, w, h);
    fill(selected?25:255);
    textSize(18);
    text(menuItemText, x+5, y+15);
  }
 
  boolean over(){
    return(mouseX>x && mouseY>y && mouseX<=x+w && mouseY<=y+h);
  }
}
