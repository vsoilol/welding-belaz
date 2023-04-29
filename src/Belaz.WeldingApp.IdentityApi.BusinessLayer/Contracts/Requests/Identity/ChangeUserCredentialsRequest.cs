namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;

public class ChangeUserCredentialsRequest
{
    public string UserName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public Guid UserId { get; set; }
}
