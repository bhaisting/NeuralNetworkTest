float[] weight;
import java.util.Scanner;
float eint =2.71828182845904523536028747135266249775724709369995;
ArrayList <tests> test;
float learningnum =0.005;
int testamount =10000;
  int done;
float error;
void setup() {
  test = new ArrayList<tests>();
  weight = new float[9];
  for (int i=0; i<weight.length; i++) {//adds weights
    weight[i] =random(-1, 1);
  }
done=0;
error=1;
}

void draw() {
  
  float xout, yout, h1net, h2net, h1out, h2out, onet, oout, level;
  while(error>0.001){
  function func = new function();
  for (int i=0; i<testamount; i++) {//adds tests
    test.add(new tests(random(0, 1), random(0, 1)));
  }
  for (int i=0; i<testamount; i++) {
    xout=test.get(i).x;
    yout=test.get(i).y;
    level=test.get(i).level;
    h1net=func.hiddennet(weight[0], weight[1], weight[2], xout, yout);
    h2net=func.hiddennet(weight[3], weight[4], weight[5], xout, yout);
    h1out=func.sigmoid(h1net);
    h2out=func.sigmoid(h2net);
    onet=func.outputnet(weight[6], weight[7], weight[8], h1out, h2out);
    oout=func.sigmoid(onet);
    error=func.errorcalc(level, oout);
    //public float backderiv(float w, float hout,float hnet,float xory)
    weight[0]-=learningnum*func.frontderiv(level,oout,onet,h1out)*func.backderiv(weight[6],h1out,h1net,xout);
    weight[1]-=learningnum*func.frontderiv(level,oout,onet,h1out)*func.backderiv(weight[6],h1out,h1net,yout);
    weight[2]-=learningnum*func.frontderiv(level,oout,onet,h1out)*func.backderiv(weight[6],h1out,h1net,1);
    weight[3]-=learningnum*func.frontderiv(level,oout,onet,h2out)*func.backderiv(weight[7],h2out,h2net,xout);
    weight[4]-=learningnum*func.frontderiv(level,oout,onet,h2out)*func.backderiv(weight[7],h2out,h2net,yout);
    weight[5]-=learningnum*func.frontderiv(level,oout,onet,h2out)*func.backderiv(weight[7],h2out,h2net,1);
    weight[6]-=func.frontderiv(level, oout, onet, h1out)*learningnum;
    weight[7]-=func.frontderiv(level, oout, onet, h2out)*learningnum;
    weight[8]-=func.frontderiv(level, oout, onet, 1)*learningnum;
  }
  System.out.println(error);
  }
  
  if(error<0.001 && done==0){
    function func=new function();
    Scanner scan = new Scanner(System.in);
   System.out.println("test points entered");
float[] x={.2,.3,.1,.4,.8,.5};
for(int i=0;i<x.length-1;i++){
   h1net=func.hiddennet(weight[0], weight[1], weight[2], x[i], x[i+1]);
    h2net=func.hiddennet(weight[3], weight[4], weight[5], x[i], x[i+1]);
    h1out=func.sigmoid(h1net);
    h2out=func.sigmoid(h2net);
    onet=func.outputnet(weight[6], weight[7], weight[8], h1out, h2out);
    oout=func.sigmoid(onet);
   System.out.println(x[i]+" "+x[i+1]+" "+oout);
   
  }
  done++;
  }
}