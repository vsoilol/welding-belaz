using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;

public class CreateInspectorRequest : IMapTo<Domain.Entities.Users.Inspector>
{
    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }

    public string Position { get; set; } = null!;

    /// <summary>
    /// Табельный номер
    /// </summary>
    public string ServiceNumber { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<CreateInspectorRequest, Domain.Entities.Users.Inspector>()
            .ForMember(dto => dto.UserInfo, opt => opt.MapFrom(x => x));

        profile.CreateMap<CreateInspectorRequest, UserData>();
    }
}
