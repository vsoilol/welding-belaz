namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;

public class ChangePasswordRequest
{
    public string OldPassword { get; set; } = null!;
    
    public string NewPassword { get; set; } = null!;
    
    public string ConfirmNewPassword { get; set; } = null!;
}