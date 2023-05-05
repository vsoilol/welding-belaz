using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class UserFullNameDto : IMapFrom<UserData>
{
    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;
}