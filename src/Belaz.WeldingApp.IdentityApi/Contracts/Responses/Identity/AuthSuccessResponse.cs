namespace Belaz.WeldingApp.IdentityApi.Contracts.Responses.Identity;

public class AuthSuccessResponse
{
    public string Token { get; set; }

    public Guid UserId { get; set; }

    public string ExpirationDate { get; set; }
}
