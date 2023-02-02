using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartFont
{
    [JsonProperty(PropertyName = "size")]
    public int Size { get; set; }
}