using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

public class CalendarDto : IMapFrom<Calendar>
{
    public int Year { get; set; }

    public List<WorkingShiftDto> MainWorkingShifts { get; set; } = null!;

    public List<DayDto>? Days { get; set; }
    
    public Guid? WeldingEquipmentId { get; set; }
}
