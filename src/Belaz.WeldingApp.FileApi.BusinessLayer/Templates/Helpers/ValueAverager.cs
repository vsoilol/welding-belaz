namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;

public static class ValueAverager
{
    public static double[] GetAveragedValues(double[] values, double sampleRate, double averageInterval)
    {
        int samplesPerInterval = (int)(averageInterval / sampleRate);
        int numIntervals = values.Length / samplesPerInterval;

        double[] averagedValues = new double[numIntervals];

        for (int i = 0; i < numIntervals; i++)
        {
            int startIndex = i * samplesPerInterval;
            int endIndex = (i + 1) * samplesPerInterval;

            double sum = 0;

            for (int j = startIndex; j < endIndex; j++)
            {
                sum += values[j];
            }

            double average = sum / samplesPerInterval;
            averagedValues[i] = average;
        }

        return averagedValues;
    }
}