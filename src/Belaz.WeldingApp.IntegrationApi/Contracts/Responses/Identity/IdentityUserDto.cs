namespace Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;

public class IdentityUserDto
{
    public Guid Id { get; set; }

    public string FirstName { get; set; }

    public string MiddleName { get; set; }

    public string LastName { get; set; }

    public string Email { get; set; }

    public string UserName { get; set; }

    public string Role { get; set; }
}
