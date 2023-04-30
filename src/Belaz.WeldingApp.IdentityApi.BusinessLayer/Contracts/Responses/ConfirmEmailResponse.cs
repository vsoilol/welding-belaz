namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;

public class ConfirmEmailResponse
{
    public string Token { get; set; } = null!;
    
    public Guid Id { get; set; }
    
    public string Email { get; set; } = null!;
}