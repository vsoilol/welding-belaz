using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Welder;

public class WelderBriefDto : IMapFrom<Entities.Users.Welder>
{
    public Guid Id { get; set; }
    
    public string? IdFromSystem { get; set; }

    public string RfidTag { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;
    
    public string? Position { get; set; }
    
    /// <summary>
    /// Табельный номер 
    /// </summary>
    public string? ServiceNumber { get; set; }
    
    public WorkplaceBriefDto? Workplace { get; set; }
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<Entities.Users.Welder, WelderBriefDto>()
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
            .ForMember(dto => dto.Position,
                opt => opt
                    .MapFrom(x => x.UserInfo.Position))
            .ForMember(dto => dto.ServiceNumber,
                opt => opt
                    .MapFrom(x => x.UserInfo.ServiceNumber));
    }
}