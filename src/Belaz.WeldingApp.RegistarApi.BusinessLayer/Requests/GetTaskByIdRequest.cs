using System.Text.Json.Serialization;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;

public class GetTaskByIdRequest
{
    [JsonPropertyName("tID")]
    public Guid TaskId { get; set; }

    [JsonPropertyName("EplRF")]
    public string WelderRfidTag { get; set; } = null!;

    [JsonPropertyName("EqpRF")]
    public string EquipmentRfidTag { get; set; } = null!;
}
