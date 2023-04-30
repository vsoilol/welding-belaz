namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;

public class ChangePasswordRequest : ChangePasswordWithoutIdRequest
{
    public Guid Id { get; set; }
}