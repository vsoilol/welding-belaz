using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class UserBriefDto : IMapFrom<UserData>
{
    public Guid Id { get; set; }
    
    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string? Position { get; set; }

    /// <summary>
    /// Табельный номер
    /// </summary>
    public string? ServiceNumber { get; set; }

    public Guid? ProductionAreaId { get; set; }
}