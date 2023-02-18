using System.Text.Json.Serialization;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;

public class GetWelderWithEquipmentRequest
{
    [JsonPropertyName("RegID")]
    public string RegistarId { get; set; } = null!;

    [JsonPropertyName("EplRF")]
    public string WelderRfidTag { get; set; } = null!;
    
    [JsonPropertyName("EqpRF")]
    public string EquipmentRfidTag { get; set; } = null!;
    
    [JsonPropertyName("SDT")]
    public DateTime StartDateTime { get; set; }
}