class Node{
  Connection[] co;
  Connection n;
  float st;
  ArrayList<Float> p = new ArrayList<Float>();
  float tp = 0;
  float r;
  Node(Connection[] ci, float sti){
    co = ci;
    st = sti;
  }
  void recieveInput(Input in){
    in.v = in.v * st;
    for(int i = 0; i < co.length; i++){
      tp+=co[i].p;
      p.add(tp);
    }
    r = random(0, tp);
    for(int i = 0; i < co.length; i++){
      if(r == p.get(i)){
        in.h.add(co[i]);
        in.n = co[i].out;
        break;
      }
    }
  }
}