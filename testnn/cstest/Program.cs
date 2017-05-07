using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Disfunctional at the moment, don't try to run. It does nothing
namespace cstest
{
    class NeuralNet
    {
        static Synapse[] Synapses;
        static int[] Inputs;
        static int[] Outputs = new int[]{ 1,0,1 };
        class Predict
        {
            public int p()
            {
                Init I = new Init();
                if(sigmoid(weightedSum()) <= .5)
                {
                    int[] gizz = new int[3] { 1, 1, 1 };
                    I.init(gizz);
                    return 1;
                }
                else
                {
                    int[] gizz = new int[3] { 0, 0, 0 };
                    I.init(gizz);
                    return 0;
                }
            }
            float weightedSum()
            {
                float one = Synapses[0].Weight * Inputs[0];
                double done = (double)one;
                Synapses[0].Percentage = (float) sigmoid(done);
                float two = Synapses[1].Weight * Inputs[1];
                double dtwo = (double)two;
                Synapses[1].Percentage = (float) sigmoid(dtwo);
                float three = Synapses[2].Weight * Inputs[2];
                double dthree = (double)three;
                Synapses[2].Percentage = (float) sigmoid(dthree);
                return one + two + three;
            }
            double sigmoid(double x)
            {
                return 2 / (1 + Math.Exp(-2 * x)) - 1;
            }
        }
        class Train
        {
            float nDiff;
            float chVal;
            public void train()
            {
                for(int i = 0; i > 2; i++)
                {
                    if(Outputs[i] == 1)
                    {
                        nDiff = 1 - Synapses[i].Percentage;
                        chVal = Synapses[i].Difference - nDiff;
                    }
                    else
                    {
                        nDiff = Synapses[1].Percentage;
                        chVal = Synapses[i].Difference - nDiff;
                    }
                    float perVal = 1 + chVal;
                    Synapses[i].Weight *= perVal;
                    Synapses[i].Difference = nDiff;
                }
            }
        }
        public class Init
        {
            Predict P = new Predict();
            Train T = new Train();
            public void init(int weight, string inputs)
            {
                Synapses = new Synapse[3]{ new Synapse(weight), new Synapse(weight), new Synapse(weight) };
                string[] splitputs = inputs.Split(' ');
                Inputs = Array.ConvertAll(splitputs, new Converter<string, int>(convert));
                P.p();
                T.train();
            }
            public void init(int[] inputs)
            {
                Inputs = inputs;
            }
            private int convert(string s)
            {
                return Int32.Parse(s);
            }
        }
        class Synapse
        {
            public float Weight;
            public float Percentage;
            public float Difference = 1;
            public Synapse(float weight)
            {
                Weight = weight;
            }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            NeuralNet.Init nni = new NeuralNet.Init();
            nni.init(1, "1 0 1");

            
        }
    }
}
