using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartOptions
{
    [JsonProperty(PropertyName = "animation")]
    public const bool Animation = false;
    
    [JsonProperty(PropertyName = "title")]
    public ChartTitle? Title { get; set; }

    [JsonProperty(PropertyName = "responsive")]
    public bool? Responsive { get; set; }

    [JsonProperty(PropertyName = "plugins")]
    public ChartPlugins? Plugins { get; set; }
    
    [JsonProperty(PropertyName = "elements")]
    public ChartElements? Elements { get; set; }
}