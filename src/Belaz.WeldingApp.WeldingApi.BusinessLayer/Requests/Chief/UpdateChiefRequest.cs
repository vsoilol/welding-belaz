using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;

public class UpdateChiefRequest : IMapTo<Domain.Entities.Users.Chief>
{
    public Guid Id { get; set; }

    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
    
    public IReadOnlyList<Guid>? WeldingEquipmentIds { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<UpdateChiefRequest, Domain.Entities.Users.Chief>()
            .ForMember(dto => dto.UserInfo,
                opt => opt
                    .MapFrom(x => x));
        
        profile.CreateMap<UpdateChiefRequest, UserData>();
    }
}