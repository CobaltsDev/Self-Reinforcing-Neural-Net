class Input{
  Node n;
  float v;
  ArrayList<Connection> h = new ArrayList<Connection>();
  Input(Node ni, float vi){
    n = ni;
    v = vi;
  }
  void eval(boolean in){
    for(int i = 0; i < h.size(); i++){
      h.get(i).p = in ? h.get(i).p + 1 : h.get(i).p - 1;
    }
  }
}