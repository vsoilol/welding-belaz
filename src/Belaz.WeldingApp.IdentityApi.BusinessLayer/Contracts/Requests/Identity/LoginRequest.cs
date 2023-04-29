namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;

public class LoginRequest
{
    public string UserName { get; set; } = null!;

    public string Password { get; set; } = null!;
}
