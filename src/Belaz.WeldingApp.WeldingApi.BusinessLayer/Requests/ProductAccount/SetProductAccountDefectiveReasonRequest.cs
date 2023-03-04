namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class SetProductAccountDefectiveReasonRequest
{
    public Guid ProductAccountId { get; set; }

    public string DefectiveReason { get; set; } = null!;
}
