namespace Belaz.WeldingApp.FileApi.Domain.Extensions;

public static class MathExtension
{
    public static double CalculatePercentage(double maximum, double current) =>
        (current / maximum) * 100;
}
