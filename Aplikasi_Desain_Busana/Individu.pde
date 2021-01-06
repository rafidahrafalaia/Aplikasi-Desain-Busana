class Individu implements Comparable, Cloneable{
  ArrayList<Pattern> i;
  int fit=0;
  int pojok=0;
  boolean end=false;
  int order=0;
  
  Individu(){
    i = new ArrayList<Pattern>();
    this.fit = 0;
  }
  
  String toString(){  
    return i.toString()+" (" +this.fit+")";
  }
  
  int compareTo(Object o) { //besar ke kecil ? memudahkan penggandaan item roulette
    if(this.getFit()<((Individu)o).getFit()){
      return 1;
    }
    else if(this.getFit()>((Individu)o).getFit()){
      return -1;
    }
    else{
      //  return 0;
      if(this.getOrder()<((Individu)o).getOrder()){
        return 1;
      }
      else if(this.getOrder()>((Individu)o).getOrder()){
        return -1;
      }
      else{
        return 0;
      }
    }
  }
  
  Individu n;
  public Object clone() throws CloneNotSupportedException{
    Individu i = (Individu)super.clone();
    i.n = new Individu();
    
    for(int x=0;x<this.getIn().size();x++){
      Pattern z = (Pattern)this.getIn().get(x).clone();
      i.n.add(z);
    }
    i.n.setFit(this.fit);
    i.n.setOrder(this.order);
    
    return i.n;
  }
  
  ArrayList<Pattern> getIn(){
    return i;
  }
  
  void setIn(ArrayList<Pattern> indi){
    i=indi;
  }
  
  void add(Pattern patt){ //addPattern
    i.add(patt);
  }
  
  Pattern get(int x){ //getPattern
    return i.get(x);
  }
  
  int size(){
    return i.size();
  }
  
  int getFit(){
    return fit;
  }
  void setFit(int fit){
    this.fit=fit;
  }
  
  void generateFit(){
    pgraph=createGraphics(sx,sy);
    pgraph.beginDraw();
    pgraph.background(255);
    //pg.stroke(255,255,255,50);
    //pg.fill(0,0,0,50);
    
    for(int m=0;m<this.size();m++){
      Pattern p = this.get(m);
      pgraph.shape(p.getShape(),p.getX(),p.getY());
      pgraph.endDraw();
      
      image(pgraph,2*width/3+20,pg[1].height+100);
      pgraph.loadPixels();
      int pos;
      
      for(int n=width*124+(2*width/3+20); n<sx*sy; n++){
        color c=pgraph.pixels[n];
        pos = n%sx;
        
        //warna pixel paling ujung
        if(c<-1 && pos>pojok){
          pojok=pos;
        }
        //println(pojok);
      }
      //println(i.get(0),i.get(1),i.get(2));
      this.setFit(pojok+1);
      print("fitness: "+pojok);
      
      pgraph.beginDraw();
    }
    pgraph.endDraw();
    
    //return pojok;
  }
  
  int getOrder(){
    return order;
  }
  void setOrder(int order){
    this.order=order;
  }
  
  boolean checkDuplicate(Individu z){
    for(int m=0;m<this.size();m++){
      Pattern p1 = this.get(m);
      Pattern p2 = z.get(m);
      if(p1.compareTo(p2)){
        return false;
      }
    }
    
    return true;
  }
}
