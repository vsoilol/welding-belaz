namespace Belaz.WeldingApp.IntegrationApi.Contracts.Requests.User;

public class CreateUserRequest
{
    public string FirstName { get; set; }

    public string MiddleName { get; set; }

    public string LastName { get; set; }

    public string Email { get; set; }

    public string UserName { get; set; }

    public string Role { get; set; }
}
