namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;

public class ChangeEndWeldingDateRequest
{
    public Guid ProductAccountTaskId { get; set; }

    public string? WeldingEndDate { get; set; }
}