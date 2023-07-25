using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class WorkingShiftDto : IMapFrom<WorkingShift>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public string ShiftStart { get; set; } = null!;

    public string ShiftEnd { get; set; } = null!;

    public string? BreakStart { get; set; }

    public string? BreakEnd { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WorkingShift, WorkingShiftDto>()
            .ForMember(
                dto => dto.ShiftStart,
                opt => 
                    opt.MapFrom(x => x.ShiftStart.ToHoursMinutesString())
            )
            .ForMember(
                dto => dto.ShiftEnd,
                opt => opt.MapFrom(x => x.ShiftEnd.ToHoursMinutesString())
            )
            .ForMember(
                dto => dto.BreakStart,
                opt => opt.MapFrom(x => x.BreakStart.ToHoursMinutesString())
            )
            .ForMember(
                dto => dto.BreakEnd,
                opt => opt.MapFrom(x => x.BreakEnd.ToHoursMinutesString())
            );
    }
}
