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

        }
        class Init
        {
            public Init(int weight, string inputs)
            {
                Synapses = new Synapse[3]{ new Synapse(weight), new Synapse(weight), new Synapse(weight) };
                string[] splitputs = inputs.Split(' ');
                Inputs = Array.ConvertAll(splitputs, new Converter<string, int>(convert));
            }
            public Init(int[] inputs)
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
            float Weight;
            float Percentage;
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
