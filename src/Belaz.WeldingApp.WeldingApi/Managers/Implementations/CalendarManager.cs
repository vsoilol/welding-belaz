using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Exceptions;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class CalendarManager : ICalendarManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Calendar> _calendarRepository;
    private readonly IDayManager _dayManager;
    private readonly IWorkingShiftManager _workingShiftManager;

    public CalendarManager(IMapper mapper, EntityFrameworkRepository<Calendar> calendarRepository,
        IDayManager dayManager, IWorkingShiftManager workingShiftManager)
    {
        _mapper = mapper;
        _calendarRepository = calendarRepository;
        _dayManager = dayManager;
        _workingShiftManager = workingShiftManager;
    }

    public async Task<CalendarDto?> CreateAsync(CreateCalendarRequest request, bool isMain)
    {
        var calendar = _mapper.Map<Calendar>(request);
        calendar.IsMain = isMain;

        var createdCalendar = _calendarRepository.Add(calendar);
        await _calendarRepository.SaveAsync();

        if (request.Days is not null && request.Days.Any())
        {
            await _dayManager.CreateRangeAsync(request.Days, createdCalendar.Id);
        }

        await _workingShiftManager.CreateRangeAsync(request.MainWorkingShift, createdCalendar.Id);

        return await _calendarRepository
            .GetByIdAsQueryable(createdCalendar.Id)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task UpdateAsync(UpdateCalendarRequest request)
    {
        var calendar = _mapper.Map<Calendar>(request);

        var isUpdate = await _calendarRepository.UpdateAsync(calendar);

        if (!isUpdate)
        {
            throw new UpdateFailedException(typeof(Calendar), request.Id);
        }
    }

    public async Task<CalendarDto?> GetMainCalendarByYearAsync(int year)
    {
        return await _calendarRepository
            .AsQueryableByFilter(_ => _.IsMain == true && _.Year == year)
            .OrderByDescending(_ => _.Year)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<CalendarDto?> CreateAsync(CreateCalendarWithWelderIdRequest request)
    {
        var calendar = _mapper.Map<Calendar>(request);
        calendar.IsMain = false;

        var createdCalendar = _calendarRepository.Add(calendar);
        await _calendarRepository.SaveAsync();

        if (request.Days is not null && request.Days.Any())
        {
            await _dayManager.CreateRangeAsync(request.Days, createdCalendar.Id);
        }

        await _workingShiftManager.CreateRangeAsync(request.MainWorkingShift, createdCalendar.Id);

        return await _calendarRepository
            .GetByIdAsQueryable(createdCalendar.Id)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<CalendarDto?> GetByWelderIdAsync(GetByWelderIdRequest request)
    {
        return await _calendarRepository
            .AsQueryableByFilter(_ => _.IsMain == false 
                                      && _.WelderId == request.WelderId 
                                      && _.Year == request.Year)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }
}