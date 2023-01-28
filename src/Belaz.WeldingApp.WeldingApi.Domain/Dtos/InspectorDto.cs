using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class InspectorDto : IMapFrom<Inspector>
{
    public Guid Id { get; set; }

    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<Inspector, InspectorDto>()
            .ForMember(dto => dto.RfidTag,
                opt => opt
                    .MapFrom(x => x.UserInfo.RfidTag))
            .ForMember(dto => dto.FirstName,
                opt => opt
                    .MapFrom(x => x.UserInfo.FirstName))
            .ForMember(dto => dto.MiddleName,
                opt => opt
                    .MapFrom(x => x.UserInfo.MiddleName))
            .ForMember(dto => dto.LastName,
                opt => opt
                    .MapFrom(x => x.UserInfo.LastName))
            .ForMember(dto => dto.ProductionArea,
                opt => opt
                    .MapFrom(x => x.UserInfo.ProductionArea));
    }
}