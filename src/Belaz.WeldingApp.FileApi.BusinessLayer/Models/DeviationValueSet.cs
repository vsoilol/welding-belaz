namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class DeviationValueSet
{
    public double[] Values { get; }
    
    public double[] DeviationValues { get; }

    public DeviationValueSet(double[] values, double[] deviationValues)
    {
        Values = values;
        DeviationValues = deviationValues;
    }
}