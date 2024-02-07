namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;

public class ChangeManufacturedAmountRequest
{
    public Guid Id { get; set; }

    public int ManufacturedAmount { get; set; }
}