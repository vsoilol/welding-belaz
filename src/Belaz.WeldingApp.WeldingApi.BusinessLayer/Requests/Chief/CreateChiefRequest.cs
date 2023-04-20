using AutoMapper;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;

public class CreateChiefRequest : IMapTo<Belaz.WeldingApp.Common.Entities.Users.Chief>
{
    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid WorkshopId { get; set; }

    public string Position { get; set; } = null!;

    /// <summary>
    /// Табельный номер
    /// </summary>
    public string ServiceNumber { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<CreateChiefRequest, Belaz.WeldingApp.Common.Entities.Users.Chief>()
            .ForMember(dto => dto.UserInfo, opt => opt.MapFrom(x => x));

        profile.CreateMap<CreateChiefRequest, UserData>();
    }
}
