namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class AddProductAccountRequest
{
    public Guid ProductId { get; set; }
    
    public string Date { get; set; } = null!;
    
    public int? UniqueNumber { get; set; }
}