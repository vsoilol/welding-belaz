using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class CalendarRepository : ICalendarRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public CalendarRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<CalendarDto> CreateAsync(Calendar calendar, List<Day>? days, List<WorkingShift> workingShifts)
    {
        var createdCalendar = _context.Calendars.Add(calendar).Entity;

        if (days is not null)
        {
            days.ForEach(_ => _.CalendarId = createdCalendar.Id);
            _context.Days.AddRange(days);
        }

        workingShifts.ForEach(_ => _.CalendarId = createdCalendar.Id);
        _context.WorkingShifts.AddRange(workingShifts);

        await _context.SaveChangesAsync();

        return await GetByIdAsync(createdCalendar.Id);
    }

    public async Task<CalendarDto> UpdateAsync(Calendar calendar)
    {
        var updatedCalendar = (await _context.Calendars
            .FirstOrDefaultAsync(_ => _.Id == calendar.Id))!;

        updatedCalendar.Year = calendar.Year;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(calendar.Id);
    }

    public Task<CalendarDto?> GetMainCalendarByYearAsync(int year)
    {
        return _context.Calendars
            .Where(_ => _.IsMain == true && _.Year == year)
            .OrderByDescending(_ => _.Year)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<CalendarDto?> GetByWelderIdAndYearAsync(Guid welderId, int year)
    {
        return _context.Calendars
            .Where(_ => _.IsMain == false 
                                      && _.WelderId == welderId 
                                      && _.Year == year)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<CalendarDto?> GetByEquipmentIdAndYearAsync(Guid weldingEquipmentId, int year)
    {
        return _context.Calendars
            .Where(_ => _.IsMain == false 
                        && _.WeldingEquipmentId == weldingEquipmentId 
                        && _.Year == year)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<CalendarDto> GetByIdAsync(Guid id)
    {
        return _context.Calendars
            .Where(_ => _.Id == id)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}