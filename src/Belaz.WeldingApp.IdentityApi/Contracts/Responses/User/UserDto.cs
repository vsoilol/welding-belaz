using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IdentityApi.Contracts.Responses.User;

public class UserDto
{
    public Guid? Id { get; set; }

    public string FirstName { get; set; }

    public string MiddleName { get; set; }

    public string LastName { get; set; }

    public string Email { get; set; }

    public string UserName { get; set; }

    public Role Role { get; set; }
}
