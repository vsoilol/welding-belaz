namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class SetUniqueNumberForProductRequest
{
    public Guid ProductAccountId { get; set; }
    
    public int? UniqueNumber { get; set; }
}