using AutoMapper;
using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class EventLogDto : IMapFrom<EventLog>
{
    public Guid Id { get; set; }

    public string Date { get; set; } = null!;

    public string Time { get; set; } = null!;

    public string Information { get; set; } = null!;

    public UserFullNameDto? User { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<EventLog, EventLogDto>()
            .ForMember(dto => dto.Date,
                opt => 
                    opt.MapFrom(x => x.DateTime.ToBelarusDayInfoString()))
            .ForMember(
                dto => dto.Time,
                opt => opt.MapFrom(x =>
                    x.DateTime.ToBelarusHoursMinutesSecondsString())
            );
    }
}