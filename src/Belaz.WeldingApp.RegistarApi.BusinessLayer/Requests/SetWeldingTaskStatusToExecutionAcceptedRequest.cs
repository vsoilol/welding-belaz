using System.Text.Json.Serialization;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;

public class SetWeldingTaskStatusToExecutionAcceptedRequest
{
    [JsonPropertyName("tID")]
    public Guid WeldingTaskId { get; set; }
}
