namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.SeamAccount;

public class ChangeSeamAccountDefectiveAmountRequest
{
    public Guid SeamAccountId { get; set; }

    public int Amount { get; set; }
}
