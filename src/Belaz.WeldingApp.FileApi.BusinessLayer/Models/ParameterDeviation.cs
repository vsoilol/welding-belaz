namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class ParameterDeviation
{
    public string Parameter { get; set; } = null!;

    public decimal TimeSum { get; set; }

    public static List<ParameterDeviation> GetData()
    {
        return new List<ParameterDeviation>
        {
            new ParameterDeviation
            {
                Parameter = "В пределах нормы",
                TimeSum = 10
            },
            new ParameterDeviation
            {
                Parameter = "Отклонение кратковременные, до 1 секунды",
                TimeSum = 2.05m
            },
            new ParameterDeviation
            {
                Parameter = "Отклонения длительные, более 1 секунды",
                TimeSum = 1.15m
            }
        };
    }
}