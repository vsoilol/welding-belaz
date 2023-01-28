using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;

public class UpdateMasterRequest : IMapTo<Domain.Entities.Users.Master>
{
    public Guid Id { get; set; }
    
    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }

    public Guid? WeldingEquipmentId { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<UpdateMasterRequest, Domain.Entities.Users.Master>()
            .ForMember(dto => dto.UserInfo,
                opt => opt
                    .MapFrom(x => x));

        profile.CreateMap<UpdateMasterRequest, UserData>();
    }
}