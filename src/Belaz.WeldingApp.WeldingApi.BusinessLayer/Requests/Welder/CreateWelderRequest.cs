using AutoMapper;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;

public class CreateWelderRequest : IMapTo<Belaz.WeldingApp.Common.Entities.Users.Welder>
{
    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }

    public string Position { get; set; } = null!;

    /// <summary>
    /// Табельный номер
    /// </summary>
    public string ServiceNumber { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<CreateWelderRequest, Belaz.WeldingApp.Common.Entities.Users.Welder>()
            .ForMember(dto => dto.UserInfo, opt => opt.MapFrom(x => x));

        profile.CreateMap<CreateWelderRequest, UserData>();
    }
}
