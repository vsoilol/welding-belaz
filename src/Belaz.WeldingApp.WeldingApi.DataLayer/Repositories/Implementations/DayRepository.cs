using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class DayRepository : IDayRepository
{
    private readonly IMapper _mapper;
    private readonly ApplicationContext _context;

    public DayRepository(IMapper mapper, ApplicationContext context)
    {
        _mapper = mapper;
        _context = context;
    }

    public Task<List<DayDto>> GetAllMainAsync()
    {
        return _context.Days
            .Where(_ => _.Calendar.IsMain)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<DayDto>> GetAllByWelderIdAsync(Guid welderId)
    {
        return _context.Days
            .Where(_ => _.Calendar.WelderId == welderId)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<DayDto>> GetAllByEquipmentIdAsync(Guid equipmentId)
    {
        return _context.Days
            .Where(_ => _.Calendar.WeldingEquipmentId == equipmentId)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<DayDto> UpdateAsync(Day day)
    {
        var updatedDay = (
            await _context.Days
                .Include(_ => _.WorkingShifts)
                .FirstOrDefaultAsync(_ => _.Id == day.Id)
        )!;

        updatedDay.MonthNumber = day.MonthNumber;
        updatedDay.Number = day.Number;
        updatedDay.IsWorkingDay = day.IsWorkingDay;

        if (!day.IsWorkingDay)
        {
            updatedDay.WorkingShifts = new List<WorkingShift>();
        }

        await _context.SaveChangesAsync();

        return await GetByIdAsync(day.Id);
    }

    public async Task<DayDto> CreateAsync(
        Day day,
        int year,
        Guid? weldingEquipmentId,
        Guid? welderId
    )
    {
        var calendar = await _context.Calendars
            .Where(
                _ =>
                    _.Year == year
                    && _.WelderId == welderId
                    && _.WeldingEquipmentId == weldingEquipmentId
            )
            .FirstOrDefaultAsync();

        if (calendar is null)
        {
            var newCalendar = new Calendar
            {
                Year = year,
                WelderId = welderId,
                WeldingEquipmentId = weldingEquipmentId,
                IsMain = welderId is null && weldingEquipmentId is null
            };

            calendar = _context.Calendars.Add(newCalendar).Entity;
        }

        day.CalendarId = calendar.Id;
        var createdDay = _context.Days.Add(day).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(createdDay.Id);
    }

    public Task<DayDto> GetByIdAsync(Guid id)
    {
        return _context.Days
            .Where(_ => _.Id == id)
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task DeleteByIdAsync(Guid id)
    {
        var deletedDay = (await _context.Days
            .Include(_ => _.WorkingShifts)
            .FirstOrDefaultAsync(_ => _.Id == id))!;

        _context.Days.Remove(deletedDay);
        await _context.SaveChangesAsync();
    }
}
