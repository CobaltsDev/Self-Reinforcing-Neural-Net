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
            public float weightedSum()
            {
                float one = Synapses[1].Weight * Inputs[1];
                float two = Synapses[2].Weight * Inputs[2];
                float three = Synapses[3].Weight * Inputs[3];
                return one + two + three;
            }
            double sigmoid(double x)
            {
                return 2 / (1 + Math.Exp(-2 * x)) - 1;
            }
        }
        public class Init
        {
            public void init(int weight, string inputs)
            {
                Synapses = new Synapse[3]{ new Synapse(weight), new Synapse(weight), new Synapse(weight) };
                string[] splitputs = inputs.Split(' ');
                Inputs = Array.ConvertAll(splitputs, new Converter<string, int>(convert));
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
            public Synapse(float weight)
            {
                Weight = weight;
            }
            public Synapse(float change, float percentage)
            {
                Weight += change;
                Percentage = percentage;
            }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {

        }
    }
}
