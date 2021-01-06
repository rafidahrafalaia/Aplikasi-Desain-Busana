class Pattern implements Cloneable{
  PShape ps;
  PShape ps_ori;
  String id;
  float x_ori,y_ori,x,y;
  //float yori;
  float w,h;
  int r=0, rad=0;
  
  Pattern(PShape shape,String id){
    //ps=shape;
    this.id=id;
    ps_ori=shape;
    reDefineShape();
    x=2*width/3+20;
    y=125;
  }
  
  PShape reDefineShape(){
    float minx=0,miny=0,maxx=0,maxy=0;
    for(int i=0;i<ps_ori.getVertexCount();i++){
      PVector v=ps_ori.getVertex(i);
      //println("x: "+v.array()[0]+", y: "+v.array()[1]+"\r\n");
      float[] ar=v.array();
      
      if(i==0||ar[0]<minx)
        minx = ar[0];
      if(i==0||ar[1]<miny)
        miny = ar[1];
      if(i==0||ar[0]>maxx)
        maxx = ar[0];
      if(i==0||ar[1]>maxy)
        maxy = ar[1];
    }
    //println(minx,maxx,miny,maxy);
    
    w=maxx-minx;
    h=maxy-miny;
    
    ps=createShape();
    ps.beginShape();
    ps.stroke(255,255,255,50);
    ps.fill(0,0,0,50);
    
    x_ori=(w/2);
    y_ori=(h/2);
    //println(x_ori,y_ori);
    
    for(int i=0;i<ps_ori.getVertexCount();i++){
      PVector v=ps_ori.getVertex(i);
      float x=v.array()[0];
      float y=v.array()[1];
      ps.vertex(x-minx-x_ori+2*width/3+20,y-miny-y_ori+125);
    }
    ps.endShape();
    return ps;
  }
  
  String toString(){
    //return this.id+" "+this.getX()+" "+this.getY()+" "+this.r; //center
    return this.id+" "+this.getUX()+" "+this.getUY()+" "+this.r; //corner
  }
  
  Pattern n;
  public Object clone() throws CloneNotSupportedException{
    Pattern p = (Pattern)super.clone();
    p.n = new Pattern(ps,id);
    p.n.setX(this.x);
    p.n.setY(this.y);
    p.n.setR(this.r);
    return p.n;
  }
  
  PShape getShape(){
    return ps;
  }  
  void setShape(PShape shape){
    ps=shape;
  }
  
  String getId(){
    return id;
  }
  void setId(String idNum){
    id=idNum;
  }
  
  float getX(){
    return x+x_ori;
  }
  void setX(float x){
    this.x=x;
  }
  
  float getY(){
    return y+y_ori;
  }  
  void setY(float y){
    this.y=y;
  }
  
  float getUX(){
    return x;
  }
  void setUX(float xa){
    x=xa-x_ori;
  }
  
  float getUY(){
    return y;
  }
  void setUY(float ya){
    y=ya-y_ori;
  }
  
  void resetY(){
    y=125;
  }
  
  float getW(){
    return w;
  }  
  //void setW(int w){
  //  this.w=w;
  //}
  
  float getH(){
    return h;
  }  
  //void setH(int h){
  //  this.h=h;
  //}
  
  int getR(){
    return r;
  }  
  void setR(int r){
    this.r=r;
    this.getShape().rotate(radians(r));
    if(this.r==90 || this.r==270){
      float temp = this.w;
      this.w = this.h;
      this.h = temp;
      x_ori=w/2;
      y_ori=h/2;
    }
  }
  
  boolean compareTo(Object o) {
    if(this.getId()==((Pattern)o).getId() && this.getR()==((Pattern)o).getR()){
      return true;
    }
    return false;
  }
}
