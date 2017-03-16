class tests{
  float x,y,level;
  public tests(float x,float y){
    this.x=x;
    this.y=y;
    if(y>=x){
    level=0.99;
    }
    else{
    level=0.01;
    }
  }
  public String toString(){
    return(x+" , "+y+" , "+level);
  }
}