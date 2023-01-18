namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class DowntimeReasonDto
{
    public Guid Id { get; set; }

    public string Reason { get; set; } = null!;
}