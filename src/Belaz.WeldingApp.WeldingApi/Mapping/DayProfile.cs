using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class DayProfile : Profile
{
    public DayProfile()
    {
        CreateMapDayToDayDto();
        CreateMapCreateDayRequestToDay();
        CreateMapUpdateDayRequestToDay();
        CreateMapCreateDayWithCalendarIdRequestToDay();
    }
    
    private void CreateMapCreateDayWithCalendarIdRequestToDay()
    {
        CreateMap<CreateDayWithCalendarIdRequest, Day>();
    }
    
    private void CreateMapUpdateDayRequestToDay()
    {
        CreateMap<UpdateDayRequest, Day>();
    }

    private void CreateMapCreateDayRequestToDay()
    {
        CreateMap<CreateDayRequest, Day>();
    }

    private void CreateMapDayToDayDto()
    {
        CreateMap<Day, DayDto>();
    }
}