using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;

public class CreateCalendarWithWelderIdRequest : IMapTo<Domain.Entities.CalendarInfo.Calendar>
{
    public int Year { get; set; }

    public Guid WelderId { get; set; }

    public List<CreateWorkingShiftRequest> MainWorkingShift { get; set; } = null!;
    
    public List<CreateDayRequest>? Days { get; set; }
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<CreateCalendarWithWelderIdRequest, Domain.Entities.CalendarInfo.Calendar>()
            .ForMember(dto => dto.Days,
                opt => opt.Ignore())
            .ForMember(dto => dto.MainWorkingShifts,
                opt => opt.Ignore());
    }
}