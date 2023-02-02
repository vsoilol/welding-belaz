using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartElements
{
    [JsonProperty(PropertyName = "point")]
    public ChartPoint? Point { get; set; }
    
    [JsonProperty(PropertyName = "line")]
    public ChartLine? Line { get; set; }
}