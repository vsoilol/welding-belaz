namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;

public class ChangeWeldingSeamAmountRequest
{
    public Guid Id { get; set; }

    public int SeamAmount { get; set; }
}
