using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
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

    public async Task<CalendarDto> CreateAsync(
        Calendar calendar,
        List<Day>? days,
        List<WorkingShift> workingShifts
    )
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
        var updatedCalendar = (
            await _context.Calendars.FirstOrDefaultAsync(_ => _.Id == calendar.Id)
        )!;

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
            .Where(_ => _.IsMain == false && _.WelderId == welderId && _.Year == year)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<CalendarDto?> GetByEquipmentIdAndYearAsync(Guid weldingEquipmentId, int year)
    {
        return _context.Calendars
            .Where(
                _ =>
                    _.IsMain == false
                    && _.WeldingEquipmentId == weldingEquipmentId
                    && _.Year == year
            )
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

    public Task<int[]> GetAllExistedMainYearAsync()
    {
        return _context.Calendars
            .Where(_ => _.IsMain)
            .Select(_ => _.Year)
            .Distinct()
            .ToArrayAsync();
    }

    public Task<int[]> GetAllExistedYearByWelderIdAsync(Guid welderId)
    {
        return _context.Calendars
            .Where(_ => _.WelderId == welderId)
            .Select(_ => _.Year)
            .Distinct()
            .ToArrayAsync();
    }

    public Task<int[]> GetAllExistedYearByEquipmentIdAsync(Guid weldingEquipmentId)
    {
        return _context.Calendars
            .Where(_ => _.WeldingEquipmentId == weldingEquipmentId)
            .Select(_ => _.Year)
            .Distinct()
            .ToArrayAsync();
    }

    public async Task<CalendarDto> CreateMainCalendarByYearAsync(int oldYear, int newYear)
    {
        var existedCalendar = (await _context.Calendars
            .Include(_ => _.Days!)
            .ThenInclude(_ => _.WorkingShifts)
            .Include(_ => _.MainWorkingShifts)
            .FirstOrDefaultAsync(_ => _.IsMain && _.Year == oldYear))!;

        var newCalendar = new Calendar
        {
            Year = newYear,
            IsMain = true,
            Days = new List<Day>()
        };

        foreach (var day in existedCalendar.Days)
        {
            var newDay = new Day
            {
                MonthNumber = day.MonthNumber,
                Number = day.Number,
                IsWorkingDay = day.IsWorkingDay,
                WorkingShifts = CreateNewWorkingShifts(day.WorkingShifts),
            };

            newCalendar.Days.Add(newDay);
        }

        newCalendar.MainWorkingShifts = CreateNewWorkingShifts(existedCalendar.MainWorkingShifts);

        var entity = _context.Calendars.Add(newCalendar).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task<CalendarDto> CreateWelderCalendarBasedOnMainAsync(int year, Guid welderId)
    {
        var existedCalendar = (await _context.Calendars
            .Include(_ => _.Days!)
            .ThenInclude(_ => _.WorkingShifts)
            .Include(_ => _.MainWorkingShifts)
            .FirstOrDefaultAsync(_ => _.IsMain && _.Year == year))!;

        var newCalendar = new Calendar
        {
            Year = year,
            IsMain = false,
            WelderId = welderId,
            Days = new List<Day>()
        };

        foreach (var day in existedCalendar.Days)
        {
            var newDay = new Day
            {
                MonthNumber = day.MonthNumber,
                Number = day.Number,
                IsWorkingDay = day.IsWorkingDay,
                WorkingShifts = CreateNewWorkingShifts(day.WorkingShifts),
            };

            newCalendar.Days.Add(newDay);
        }

        newCalendar.MainWorkingShifts = CreateNewWorkingShifts(existedCalendar.MainWorkingShifts);

        var entity = _context.Calendars.Add(newCalendar).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task<CalendarDto> CreateEquipmentCalendarBasedOnMainAsync(int year, Guid equipmentId)
    {
        var existedCalendar = (await _context.Calendars
            .Include(_ => _.Days!)
            .ThenInclude(_ => _.WorkingShifts)
            .Include(_ => _.MainWorkingShifts)
            .FirstOrDefaultAsync(_ => _.IsMain && _.Year == year))!;

        var newCalendar = new Calendar
        {
            Year = year,
            IsMain = false,
            WeldingEquipmentId = equipmentId,
            Days = new List<Day>()
        };

        foreach (var day in existedCalendar.Days)
        {
            var newDay = new Day
            {
                MonthNumber = day.MonthNumber,
                Number = day.Number,
                IsWorkingDay = day.IsWorkingDay,
                WorkingShifts = CreateNewWorkingShifts(day.WorkingShifts),
            };

            newCalendar.Days.Add(newDay);
        }

        newCalendar.MainWorkingShifts = CreateNewWorkingShifts(existedCalendar.MainWorkingShifts);

        var entity = _context.Calendars.Add(newCalendar).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    private List<WorkingShift> CreateNewWorkingShifts(List<WorkingShift>? workingShifts)
    {
        var newWorkingShifts = new List<WorkingShift>();

        if (workingShifts is null)
        {
            return newWorkingShifts;
        }

        foreach (var workingShift in workingShifts)
        {
            newWorkingShifts.Add(new WorkingShift
            {
                Number = workingShift.Number,
                ShiftStart = workingShift.ShiftStart,
                ShiftEnd = workingShift.ShiftEnd,
                BreakStart = workingShift.BreakStart,
                BreakEnd = workingShift.BreakEnd
            });
        }

        return newWorkingShifts;
    }
}