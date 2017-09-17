using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using TensorFlow;

namespace TensorflowSharpTest
{
    class Program
    {
        static string modelFile = "fronze.pb";
        static string labelsFile = "asl_labels.txt";

        public static void Main(string[] args)
        {
            // Construct an in-memory graph from the serialized form.
            var graph = new TFGraph();
            // Load the serialized GraphDef from a file.
            var model = File.ReadAllBytes(modelFile);
            var file = "test.jpg";
            graph.Import(model, "");
            using (var session = new TFSession(graph))
            {
                var labels = File.ReadAllLines(labelsFile);
                // For multiple images, session.Run() can be called in a loop (and
                // concurrently). Alternatively, images can be batched since the model
                // accepts batches of image data as input.
                var tensor = ImageUtil.CreateTensorFromImageFile(file);
                var runner = session.GetRunner();
                runner.AddInput(graph["conv2d_1_input"][0], tensor).Fetch(graph["activation_5/Sigmoid"][0]);
                var output = runner.Run();
                // output[0].Value() is a vector containing probabilities of
                // labels for each image in the "batch". The batch size was 1.
                // Find the most probably label index.

                var result = output[0];
                var rshape = result.Shape;
                if (result.NumDims != 2 || rshape[0] != 1)
                {
                    var shape = "";
                    foreach (var d in rshape)
                    {
                        shape += $"{d} ";
                    }
                    shape = shape.Trim();
                    Console.WriteLine($"Error: expected to produce a [1 N] shaped tensor where N is the number of labels, instead it produced one with shape [{shape}]");
                    Environment.Exit(1);
                }

                // You can get the data in two ways, as a multi-dimensional array, or arrays of arrays, 
                // code can be nicer to read with one or the other, pick it based on how you want to process
                // it
                bool jagged = true;

                var bestIdx = 0;
                float p = 0, best = 0;

                if (jagged)
                {
                    var probabilities = ((float[][])result.GetValue(jagged: true))[0];
                    for (int i = 0; i < probabilities.Length; i++)
                    {
                        if (probabilities[i] > best)
                        {
                            bestIdx = i;
                            best = probabilities[i];
                        }
                    }

                }
                else
                {
                    var val = (float[,])result.GetValue(jagged: false);

                    // Result is [1,N], flatten array
                    for (int i = 0; i < val.GetLength(1); i++)
                    {
                        if (val[0, i] > best)
                        {
                            bestIdx = i;
                            best = val[0, i];
                        }
                    }
                }

                Console.WriteLine($"{file} best match: [{bestIdx}] {best * 100.0}% {labels[bestIdx]}");
                Console.ReadLine();
            }
        }
    }
}
