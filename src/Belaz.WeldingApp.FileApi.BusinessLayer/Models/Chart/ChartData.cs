using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartData
{
    [JsonProperty(PropertyName = "labels")]
    public string[] Labels { get; set; } = null!;

    [JsonProperty(PropertyName = "datasets")]
    public ChartDatasets[] Datasets { get; set; } = null!;
}