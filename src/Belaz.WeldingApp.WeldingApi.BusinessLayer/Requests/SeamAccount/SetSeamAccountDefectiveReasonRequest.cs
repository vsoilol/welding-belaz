namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.SeamAccount;

public class SetSeamAccountDefectiveReasonRequest
{
    public Guid SeamAccountId { get; set; }

    public string DefectiveReason { get; set; } = null!;
}
