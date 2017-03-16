float[] weight;
ArrayList <tests> test;
void setup(){
  test = new ArrayList<tests>();
  weight = new float[9];
  for(int i=0;i<weight.length;i++){//adds weights
   weight[i] =random(-1,1);
  }
  for(int i=0;i<1000;i++){//adds tests
    test.add(new tests(random(0,1),random(0,1)));
  }
}
void draw(){
  
}