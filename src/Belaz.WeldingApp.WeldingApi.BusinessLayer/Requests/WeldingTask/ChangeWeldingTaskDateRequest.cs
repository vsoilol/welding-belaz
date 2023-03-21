namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;

public class ChangeWeldingTaskDateRequest
{
    public Guid Id { get; set; }

    public string Date { get; set; } = null!;
}
