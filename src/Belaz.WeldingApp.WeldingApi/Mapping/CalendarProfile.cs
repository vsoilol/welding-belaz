using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class CalendarProfile : Profile
{
    public CalendarProfile()
    {
        CreateMapCalendarToCalendarDto();
        CreateMapCreateCalendarRequestToCalendar();
        CreateMapUpdateCalendarRequestToCalendar();
        CreateMapCreateCalendarWithWelderIdRequestToCalendar();
    }
    
    private void CreateMapCreateCalendarWithWelderIdRequestToCalendar()
    {
        CreateMap<CreateCalendarWithWelderIdRequest, Calendar>()
            .ForMember(dto => dto.Days,
                opt => opt.Ignore())
            .ForMember(dto => dto.MainWorkingShifts,
                opt => opt.Ignore());
    }
    
    private void CreateMapUpdateCalendarRequestToCalendar()
    {
        CreateMap<UpdateCalendarRequest, Calendar>()
            .ForMember(dto => dto.Days,
                opt => opt.Ignore())
            .ForMember(dto => dto.MainWorkingShifts,
                opt => opt.Ignore());
    }

    private void CreateMapCreateCalendarRequestToCalendar()
    {
        CreateMap<CreateCalendarRequest, Calendar>()
            .ForMember(dto => dto.Days,
                opt => opt.Ignore())
            .ForMember(dto => dto.MainWorkingShifts,
                opt => opt.Ignore());
    }

    private void CreateMapCalendarToCalendarDto()
    {
        CreateMap<Calendar, CalendarDto>();
    }
}