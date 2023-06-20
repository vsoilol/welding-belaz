namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;

public class AuthSuccessResponse
{
    public string Token { get; set; } = null!;

    public Guid UserId { get; set; }

    public string ExpirationDate { get; set; } = null!;

    public bool IsFirstLogin { get; set; }
}