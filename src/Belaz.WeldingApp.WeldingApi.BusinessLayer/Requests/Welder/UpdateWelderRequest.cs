using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;

public class UpdateWelderRequest : IMapTo<Domain.Entities.Users.Welder>
{
    public Guid Id { get; set; }

    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<UpdateWelderRequest, Domain.Entities.Users.Welder>()
            .ForMember(dto => dto.UserInfo,
                opt => opt
                    .MapFrom(x => x));

        profile.CreateMap<UpdateWelderRequest, UserData>();
    }
}