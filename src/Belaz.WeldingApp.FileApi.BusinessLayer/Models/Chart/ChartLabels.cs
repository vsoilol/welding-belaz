using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartLabels
{
    [JsonProperty(PropertyName = "font")]
    public ChartFont? Font { get; set; }
}