using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;

public class GetWelderWithEquipmentRequest
{
    [Display(Name = "RegID")]
    [JsonProperty(PropertyName = "RegID")]
    [JsonPropertyName("RegID")]
    public string RegistarId { get; set; } = null!;

    [Display(Name = "EplRF")]
    [JsonProperty(PropertyName = "EplRF")]
    [JsonPropertyName("EplRF")]
    public string WelderRfidTag { get; set; } = null!;

    [JsonPropertyName("EqpRF")]
    [Display(Name = "EqpRF")]
    [JsonProperty(PropertyName = "EqpRF")]
    public string EquipmentRfidTag { get; set; } = null!;

    [JsonPropertyName("SDT")]
    [Display(Name = "SDT")]
    [JsonProperty(PropertyName = "SDT")]
    public DateTime StartDateTime { get; set; }
}
