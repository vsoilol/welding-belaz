using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.IdentityApi.Domain.Mappings;

namespace Belaz.WeldingApp.IdentityApi.Domain.Dtos;

public class IdentityUserDto : IMapFrom<UserData>
{
    public Guid Id { get; set; }
    
    public Guid? ProductionAreaId { get; set; }
    
    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string? UserName { get; set; }
    
    public bool IsFirstLogin { get; set; }

    public string Email { get; set; } = null!;

    public bool IsEmailConfirmed { get; set; }

    public Role Role { get; set; }
    
    public string? PasswordHash { get; set; }
}