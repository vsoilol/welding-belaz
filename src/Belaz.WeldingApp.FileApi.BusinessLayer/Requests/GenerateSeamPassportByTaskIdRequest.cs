namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class GenerateSeamPassportByTaskIdRequest
{
    public Guid TaskId { get; set; }

    public int? SequenceNumber { get; set; }
}