using AutoMapper;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class WelderDto : IMapFrom<Welder>
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

    public WorkshopDto Workshop { get; set; } = null!;

    public ProductionAreaDto ProductionArea { get; set; } = null!;

    public WorkplaceDto? Workplace { get; set; }

    public PostDto? Post { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Welder, WelderDto>()
            .ForMember(dto => dto.FirstName, opt => opt.MapFrom(x => x.UserInfo.FirstName))
            .ForMember(dto => dto.MiddleName, opt => opt.MapFrom(x => x.UserInfo.MiddleName))
            .ForMember(dto => dto.LastName, opt => opt.MapFrom(x => x.UserInfo.LastName))
            .ForMember(dto => dto.Position, opt => opt.MapFrom(x => x.UserInfo.Position))
            .ForMember(dto => dto.ServiceNumber, opt => opt.MapFrom(x => x.UserInfo.ServiceNumber))
            .ForMember(
                dto => dto.ProductionArea,
                opt => opt.MapFrom(x => x.UserInfo.ProductionArea)
            )
            .ForMember(
                dto => dto.Workshop,
                opt => opt.MapFrom(x => x.UserInfo.ProductionArea!.Workshop)
            );
    }
}
