using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartPlugins
{
    [JsonProperty(PropertyName = "legend")]
    public ChartLegend? Legend { get; set; }
    
    [JsonProperty(PropertyName = "title")]
    public ChartTitle? Title { get; set; }
}