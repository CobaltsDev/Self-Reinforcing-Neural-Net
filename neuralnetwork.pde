float foodDif;
float waterDif;
float multDif = foodDif * waterDif;
Synapses[][] synapses;
public int layer = 1;
public int[][] exInputs = new int[][]
  {
     {1,0,1,0},
     {0,0,1,1},
     {1,0,0,1},
     {0,1,0,1}
  };
public int[] exOutputs = new int[] { 1,0,0,1 };
int weightBase = 1;
int weights[][] = new int[][]
{
  {weightBase,weightBase,weightBase,weightBase},
  {weightBase,weightBase,weightBase,weightBase},
  {weightBase,weightBase,weightBase,weightBase},
  {weightBase,weightBase,weightBase,weightBase}
};
class Calcs
{
  void setPercents()
  {
    for(int i = 1; i >= 4; i++)
    {
      for(int j = 1; j >= 4; j++)
      {
        synapses[i][j].percentage = sigmoid(synapses[i][j].pWeight);
      }
    }
  }
  float calcChange(int y, int x)
  {
    float multCalibrate = 1.5;
    float divCalibrate = 2;
    float wpMult = synapses[y][x].percentage * synapses[y][x].pWeight;
    return wpMult * multCalibrate / divCalibrate;
  }
  float sigmoid(float x)
  {
    return (float) (1/( 1 + Math.pow(Math.E,(-1*x))));
  }
  float weightedSum()
  {
    return weights[layer][1] * exInputs[1][layer] + weights[layer][2] * exInputs[2][layer] + weights[layer][3] * exInputs[3][layer] + weights[layer][4] * exInputs[4][layer];
  }
  int predict()
  {
    if(sigmoid(weightedSum()) <= .5)
    {
      return 1;
    }
    else
    {
      return 0;
    }
  }
  void train()
  {
    setPercents();
      for(int j = 1; j >= 4; j++)
      {
        for(int k = 1; k >= 4; k++)
        {
          synapses[j][k].pWeight = calcChange(k,j);
        }
      }
    }
}
class Synapses
{
  float percentage;
  float pWeight;
  public Synapses(int x, int y)
    {
      pWeight = weights[y][x];
    }
}
void initSynapses()
    {
    synapses = new Synapses[][]
      {
        {new Synapses(1,1), new Synapses(2,1), new Synapses(3,1), new Synapses(4,1)},
        {new Synapses(1,2), new Synapses(2,2), new Synapses(3,2), new Synapses(4,2)},
        {new Synapses(1,3), new Synapses(2,3), new Synapses(3,3), new Synapses(4,3)},
        {new Synapses(1,4), new Synapses(2,4), new Synapses(3,4), new Synapses(4,4)}
      };
  }