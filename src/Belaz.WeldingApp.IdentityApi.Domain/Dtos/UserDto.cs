using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.IdentityApi.Domain.Mappings;

namespace Belaz.WeldingApp.IdentityApi.Domain.Dtos;

public class UserDto : IMapFrom<UserData>
{
    public Guid Id { get; set; }
    
    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string? UserName { get; set; }

    public string? Email { get; set; }

    public bool IsEmailConfirmed { get; set; }
    
    public Role Role { get; set; }
}