using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.IdentityApi.Domain.Mappings;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;

public class UpdateUserRequest : IMapTo<UserData>
{
    public Guid Id { get; set; }
    
    public string FirstName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public Role Role { get; set; }
}