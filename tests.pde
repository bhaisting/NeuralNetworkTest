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

class function{
  public float sigmoid(float x){
    return (1/(1+(pow(eint,-x))));
  }
  public float hiddennet(float w1, float w2, float w3,float x, float y){
    return w1*x+w2*y+w3;
  }
  public float outputnet(float w1,float w2, float w3,float h1, float h2){
    return w1*h1+w2*h2+w3;
  }
  public float errorcalc(float level,float oout){
    return 0.5*pow(level-oout,2);
  }
  public float frontderiv(float level, float oout,float onet,float hout){
    return (oout-level)*(pow(eint,-onet)/pow(1+pow(eint,-onet),2))*hout;
  }
  public float backderiv(float w, float hout,float hnet,float xory){
    return w*(pow(eint,-hnet)/pow(1+pow(eint,-hnet),2))*xory;
  }
}