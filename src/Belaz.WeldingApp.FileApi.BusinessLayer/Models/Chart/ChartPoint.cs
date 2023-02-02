using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartPoint
{
    [JsonProperty(PropertyName = "radius")]
    public int Radius { get; set; }
}