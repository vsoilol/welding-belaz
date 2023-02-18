using System.Text.Json.Serialization;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;

public class RecordWithoutTaskRequest
{
    [JsonPropertyName("RegID")]
    public string RegistarId { get; set; } = null!;

    [JsonPropertyName("EqpID")]
    public Guid WeldingEquipmentId { get; set; }

    [JsonPropertyName("EplID")]
    public Guid WelderId { get; set; }

    [JsonPropertyName("SDT")]
    public DateTime StartDateTime { get; set; }

    [JsonPropertyName("Amp")]
    public double[] Amperages { get; set; } = null!;
    
    [JsonPropertyName("Volt")]
    public double[] Voltages { get; set; } = null!;
}