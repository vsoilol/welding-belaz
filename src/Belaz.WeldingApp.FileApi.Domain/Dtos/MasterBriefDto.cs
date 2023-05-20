using AutoMapper;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class MasterBriefDto : IMapFrom<Master>
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
    
    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Master, MasterBriefDto>()
            .ForMember(
                dto => dto.FirstName,
                opt =>
                    opt.MapFrom(x => x.UserInfo.FirstName)
            )
            .ForMember(
                dto => dto.LastName,
                opt =>
                    opt.MapFrom(x => x.UserInfo.LastName)
            )
            .ForMember(
                dto => dto.MiddleName,
                opt =>
                    opt.MapFrom(x => x.UserInfo.MiddleName)
            )
            .ForMember(
                dto => dto.Position,
                opt =>
                    opt.MapFrom(x => x.UserInfo.Position)
            )
            .ForMember(
                dto => dto.ServiceNumber,
                opt =>
                    opt.MapFrom(x => x.UserInfo.ServiceNumber)
            )
            .ForMember(
                dto => dto.ProductionAreaId,
                opt =>
                    opt.MapFrom(x => x.UserInfo.ProductionAreaId)
            );
    }
}