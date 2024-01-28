using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;

public class CreateCalendarWithEquipmentIdRequest
    : IMapTo<Belaz.WeldingApp.Common.Entities.CalendarInfo.Calendar>
{
    public int Year { get; set; }

    public Guid WeldingEquipmentId { get; set; }

    public List<CreateWorkingShiftRequest>? MainWorkingShift { get; set; }

    public List<CreateDayRequest>? Days { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<
                CreateCalendarWithEquipmentIdRequest,
                Belaz.WeldingApp.Common.Entities.CalendarInfo.Calendar
            >()
            .ForMember(dto => dto.Days, opt => opt.Ignore())
            .ForMember(dto => dto.MainWorkingShifts, opt => opt.Ignore());
    }
}
