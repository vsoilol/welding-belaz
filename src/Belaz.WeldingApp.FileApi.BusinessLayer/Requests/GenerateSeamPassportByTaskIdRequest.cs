namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class GenerateSeamPassportByTaskIdRequest
{
    public Guid TaskId { get; set; }

    public string? SequenceNumber { get; set; }
}