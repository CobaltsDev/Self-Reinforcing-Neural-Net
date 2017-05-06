//initializing nodes
Node[] in = new Node[8];
Node[] middle = new Node[5];
Render render = new Render();
Connection[] b = {};
Node end = new Node(b, 1);
void setup(){
  size(500, 500);
  render.InitLayout();
  //setting up Connections
  for(int i = 0; i < in.length; i++){
    Connection[] ingc = {new Connection(10, in[i], middle[0]), new Connection(10, in[i], middle[1]), new Connection(10, in[i], middle[2]), new Connection(10, in[i], middle[3]), new Connection(10, in[i], middle[4])};
    in[i] = new Node(ingc, 1);
  }
  for(int i = 0; i < middle.length; i++){
    Connection[] midgc = {new Connection(10, middle[i], end)};
    middle[i] = new Node(midgc, i/2);
  }
  frameRate(1);
  render.InitLayout();
  initSynapses();
}
void renderNodes(){
  fill(255);
  for(int i = 0; i < in.length; i++){
    fill(255);
    for(int x = 0; x < in[i].co.length; x++){
      line(115, (x*51)+30, 45, (i*50)+30);
    }
    ellipse(30, (i*50)+30, 30, 30);
    fill(0);
    text(in[i].st, 25, (i*50)+35);
  }
  fill(255, 6, 6);
  for(int i = 0; i < middle.length; i++){
    for(int x = 0; x < middle[i].co.length; x++){
      line(145, (i*51)+30, 215, 132);
    }
    ellipse(130, (i*51)+30, 30, 30);
  }
  fill(9, 236, 244);
  ellipse(230, 132, 30, 30);
}
public long updates = 0;
boolean deathDisplayed = false;
Creature creature = new Creature();
Calcs calcs = new Calcs();
int addFood = 1;
void draw(){
  background(255);
  renderNodes();
  render.renderMap();
  render.renderCreature();
  render.PassLayout();
  boolean livingStatus = creature.changeValues(); //<>//
  if(livingStatus == true && deathDisplayed == false)
  {
  updates++;
  }
  
  else
  {
    println("The Creature has died");
    deathDisplayed = true;
    while(true)
    {
      
    }
  }
  
}