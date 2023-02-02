using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartResponse
{
    [JsonProperty(PropertyName = "success")]
    public bool Success { get; set; }

    [JsonProperty(PropertyName = "url")] 
    public string Url { get; set; } = null!;
}