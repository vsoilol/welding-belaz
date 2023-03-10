using System.Text.Json.Serialization;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;

public class MarkWeldingTaskAsCompletedRequest
{
    [JsonPropertyName("tID")]
    public Guid TaskId { get; set; }
}
