using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;

public class UpdateCalendarRequest : IMapTo<Belaz.WeldingApp.Common.Entities.CalendarInfo.Calendar>
{
    public Guid Id { get; set; }

    public int Year { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<UpdateCalendarRequest, Belaz.WeldingApp.Common.Entities.CalendarInfo.Calendar>()
            .ForMember(dto => dto.Days,
                opt => opt.Ignore())
            .ForMember(dto => dto.MainWorkingShifts,
                opt => opt.Ignore());
    }
}