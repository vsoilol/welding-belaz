using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartConfig
{
    [JsonProperty(PropertyName = "type")] 
    public string Type { get; set; } = null!;

    [JsonProperty(PropertyName = "data")] 
    public ChartData Data { get; set; } = null!;

    [JsonProperty(PropertyName = "options")]
    public ChartOptions? Options { get; set; }
}