float[] weight;
float eint =2.7182818284590452353602874713527;
ArrayList <tests> test;
int testamount =10;
void setup(){
  test = new ArrayList<tests>();
  weight = new float[9];
  for(int i=0;i<weight.length;i++){//adds weights
   weight[i] =random(-1,1);
  }
  for(int i=0;i<testamount;i++){//adds tests
    test.add(new tests(random(0,1),random(0,1)));
  }
}
void draw(){
  float xout,yout,h1net,h2net,h1out,h2out,onet,oout,error,level;
  function func = new function();
  for(int i=0; i<testamount;i++){
    xout=test.get(i).x;
    yout=test.get(i).y;
    level=test.get(i).level;
    h1net=func.hiddennet(weight[0],weight[1],weight[2],xout,yout);
    h2net=func.hiddennet(weight[3],weight[4],weight[5],xout,yout);
    h1out=func.sigmoid(h1net);
    h2out=func.sigmoid(h2net);
    onet=func.outputnet(weight[6],weight[7],weight[8],h1out,h2out);
    oout=func.sigmoid(onet);
    error=func.errorcalc(level,oout);
    System.out.println(error);
}
}