using AutoMapper;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class CalendarDto : IMapFrom<Calendar>
{
    public Guid Id { get; set; }

    public int Year { get; set; }

    public IReadOnlyCollection<DayDto>? Days { get; set; }

    public IReadOnlyCollection<WorkingShiftDto> MainWorkingShifts { get; set; } = null!;
    
    public Guid? WelderId { get; set; }

    public Guid? WeldingEquipmentId { get; set; }
    
    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Calendar, CalendarDto>()
            .ForMember(dto => dto.Days, opt => 
                opt.MapFrom(x => x.Days!.OrderBy(_ => _.MonthNumber).ThenBy(_ => _.Number)))
            .ForMember(dto => dto.MainWorkingShifts, opt => 
                opt.MapFrom(x => x.MainWorkingShifts.OrderBy(_ => _.Number)));
    }
}
