using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Exceptions;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

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

    public async Task<DayDto?> CreateAsync(CreateDayWithCalendarIdRequest request)
    {
        var day = _mapper.Map<Day>(request);
        
        var createdDay = _dayRepository.Add(day);
        await _dayRepository.SaveAsync();

        return await _dayRepository
            .AsQueryable()
            .Where(_ => _.Id == createdDay.Id)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task UpdateAsync(UpdateDayRequest request)
    {
        var day = _mapper.Map<Day>(request);
        
        var isUpdate = await _dayRepository.UpdateAsync(day);

        if (!isUpdate)
        {
            throw new UpdateFailedException(typeof(Calendar), request.Id);
        }
    }

    public Task CreateRangeAsync(List<CreateDayRequest> values, Guid calendarId)
    {
        var days = _mapper.Map<List<Day>>(values);
        days.ForEach(_ => _.CalendarId = calendarId);

        return _dayRepository.AddRangeAsync(days);
    }

    public Task UpdateRangeAsync(List<UpdateDayRequest> values)
    {
        throw new NotImplementedException();
    }
}