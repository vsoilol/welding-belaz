using Newtonsoft.Json;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;

public class ChartDatasets
{
    [JsonProperty(PropertyName = "type")]
    public string? Type { get; set; }
    
    [JsonProperty(PropertyName = "width")]
    public string? Width { get; set; }
    
    [JsonProperty(PropertyName = "height")]
    public string? Height { get; set; }
    
    [JsonProperty(PropertyName = "borderWidth")]
    public int? BorderWidth { get; set; }
    
    [JsonProperty(PropertyName = "pointRadius")]
    public int? PointRadius { get; set; }
    
    [JsonProperty(PropertyName = "fill")]
    public bool Fill { get; set; }

    [JsonProperty(PropertyName = "label")] 
    public string Label { get; set; } = null!;
    
    [JsonProperty(PropertyName = "backgroundColor")]
    public string? BackgroundColor { get; set; }
    
    [JsonProperty(PropertyName = "borderColor")]
    public string? BorderColor { get; set; }

    [JsonProperty(PropertyName = "data")] 
    public double[] Data { get; set; } = null!;
}