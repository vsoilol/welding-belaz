using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartLine
{
    [JsonProperty(PropertyName = "borderWidth")]
    public int BorderWidth { get; set; }
}