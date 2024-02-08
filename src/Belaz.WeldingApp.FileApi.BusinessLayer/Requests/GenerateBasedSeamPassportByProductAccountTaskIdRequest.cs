namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class GenerateBasedSeamPassportByProductAccountTaskIdRequest
{
    public Guid ProductAccountTaskId { get; set; }

    public double? AverageIntervalSeconds { get; set; }
    
    public double? SecondsToIgnoreBetweenGraphs { get; set; }
}