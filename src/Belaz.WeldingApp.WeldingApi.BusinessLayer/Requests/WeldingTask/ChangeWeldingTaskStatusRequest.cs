using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;

public class ChangeWeldingTaskStatusRequest
{
    public Guid Id { get; set; }

    public WeldingTaskStatus Status { get; set; }
}
