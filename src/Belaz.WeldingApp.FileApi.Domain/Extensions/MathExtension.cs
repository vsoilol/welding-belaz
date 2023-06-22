namespace Belaz.WeldingApp.FileApi.Domain.Extensions;

public static class MathExtension
{
    public static double CalculatePercentage(double maximum, double current)
    {
        if (maximum == 0)
        {
            return 0.0;
        }
        
        return (current / maximum) * 100;
    }
}