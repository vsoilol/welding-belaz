using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartTitle
{
    [JsonProperty(PropertyName = "display")]
    public bool Display { get; set; }

    [JsonProperty(PropertyName = "text")] 
    public string Text { get; set; } = null!;

    [JsonProperty(PropertyName = "fullSize")] 
    public bool? FullSize { get; set; }

    [JsonProperty(PropertyName = "font")] 
    public ChartFont? Font { get; set; }
}