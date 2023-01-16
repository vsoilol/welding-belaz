using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class DayManager : IDayManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Day> _dayRepository;

    public DayManager(IMapper mapper, EntityFrameworkRepository<Day> dayRepository)
    {
        _mapper = mapper;
        _dayRepository = dayRepository;
    }

    public Task<DayDto?> CreateAsync(CreateDayRequest request)
    {
        throw new NotImplementedException();
    }

    public Task CreateRangeAsync(List<CreateDayRequest> values, Guid calendarId)
    {
        var days = _mapper.Map<List<Day>>(values);
        days.ForEach(_ => _.CalendarId = calendarId);

        return _dayRepository.AddRangeAsync(days);
    }
}