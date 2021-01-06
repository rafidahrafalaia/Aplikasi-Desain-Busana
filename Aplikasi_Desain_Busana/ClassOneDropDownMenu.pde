class ClassOneDropDownMenu{
  MenuItem baseMenu;
  boolean menuOpen=false;
  boolean menuSelected=false;
  float positionY;
  ArrayList<MenuItem> listOfEntries = new ArrayList();
  int selectedLine = -1;
 
  ClassOneDropDownMenu(String menuTitle, int xTemp){
    baseMenu = new MenuItem(menuTitle);
    baseMenu.x = xTemp;
    baseMenu.y = 0;
    baseMenu.w = 100;
    baseMenu.h = 25;
    positionY = baseMenu.y + baseMenu.h;
  }
  
  void addNewLine(String textOfTheNewEntry, int index_){
    MenuItem newItem = new MenuItem(textOfTheNewEntry);
    newItem.x = baseMenu.x;
    newItem.y = positionY;
    newItem.w = 165;
    newItem.h = 25;
    newItem.index = index_;
    listOfEntries.add(newItem);
    positionY += newItem.h;
  }
  
  void display(){
    if(menuSelected)
      baseMenu.display(true);
    else
      baseMenu.display(false);
 
    if(menuOpen)
      for(int i=0; i<listOfEntries.size (); i++)
        if(i==selectedLine)
          listOfEntries.get(i).display(true);
        else
        listOfEntries.get(i).display(false);
  }
 
  int clicked(){
    if(baseMenu.over())
      toggleMenuOpen();
    else if(menuOpen){
      for(int i=0; i<listOfEntries.size (); i++){
        MenuItem currEntry = listOfEntries.get(i); 
        if(currEntry.over()){ 
          // println(currEntry.menuItemText);
          menuOpen=false;
          return currEntry.index;
        }
      }
      menuOpen = false;
    }
    return -1;
  }
 
  void toggleMenuOpen(){
    if(menuOpen)
      menuOpen=false;
    else{
      menuOpen=true;
      selectedLine = -1;
    }
  }
 
  void selectedLineDown(){
    selectedLine++;
    if(selectedLine>listOfEntries.size()-1)
      selectedLine=0;
  }
 
  void selectedLineUp(){
    selectedLine--;
    if(selectedLine<0)
      selectedLine=listOfEntries.size()-1;
  }
 
  void selectedLineFromMouse(){
    for(int i=0; i<listOfEntries.size (); i++){
      MenuItem currEntry = listOfEntries.get(i); 
      if(currEntry.over()){
        selectedLine=i;
        return;
      }
    }
  }
 
  int selectedLineExecute(){
    if(menuOpen){
      for(int i=0; i<listOfEntries.size (); i++){
        MenuItem currEntry = listOfEntries.get(i); 
        if(i==selectedLine){ 
          menuOpen=false;
          menuSelected=false;
          return currEntry.index;
        }
      }
      menuOpen = false;
    }
    return -1;
  }
}
