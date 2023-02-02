using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartLegend
{
    [JsonProperty(PropertyName = "position")]
    public string? Position { get; set; }
    
    [JsonProperty(PropertyName = "labels")]
    public ChartLabels? Labels { get; set; }
}