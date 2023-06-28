using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class DayRepository : IDayRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public DayRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<List<DayDto>> GetAllDaysByDatePeriodAsync(DateTime startDate, DateTime endDate)
    {
        var queryableDays = GetDaysByPeriod(startDate, endDate).Where(_ => _.Calendar.IsMain);

        var days = await queryableDays
            .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        return days;
    }

    public async Task<List<DayDto>> GetAllDaysByDatePeriodForWelderAsync(DateTime startDate,
        DateTime endDate, Guid? welderId)
    {
        var days = GetDaysByPeriod(startDate, endDate).Where(_ => !_.Calendar.IsMain);

        if (await days.AnyAsync(_ => _.Calendar.WelderId == welderId))
        {
            return await days.Where(_ => _.Calendar.WelderId == welderId)
                .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
                .ToListAsync();
        }

        return await GetAllDaysByDatePeriodAsync(startDate, endDate);
    }

    public async Task<List<DayDto>> GetAllDaysByDatePeriodForEquipmentAsync(DateTime startDate,
        DateTime endDate, Guid? weldingEquipmentId)
    {
        var days = GetDaysByPeriod(startDate, endDate).Where(_ => !_.Calendar.IsMain);

        if (await days.AnyAsync(_ => _.Calendar.WeldingEquipmentId == weldingEquipmentId))
        {
            return await days.Where(_ => _.Calendar.WeldingEquipmentId == weldingEquipmentId)
                .ProjectTo<DayDto>(_mapper.ConfigurationProvider)
                .ToListAsync();
        }

        return await GetAllDaysByDatePeriodAsync(startDate, endDate);
    }

    private IQueryable<Day> GetDaysByPeriod(DateTime startDate, DateTime endDate)
    {
        int startYear = startDate.Year;
        int startMonth = startDate.Month;
        int startDay = startDate.Day;

        int endYear = endDate.Year;
        int endMonth = endDate.Month;
        int endDay = endDate.Day;

        var days = _context.Days
            .Where(d => (d.Calendar.Year > startYear && d.Calendar.Year < endYear)
                        || (d.Calendar.Year == startYear && d.MonthNumber > startMonth)
                        || (d.Calendar.Year == startYear && d.MonthNumber == startMonth && d.Number >= startDay)
                        || (d.Calendar.Year == endYear && d.MonthNumber < endMonth)
                        || (d.Calendar.Year == endYear && d.MonthNumber == endMonth && d.Number <= endDay)
                        || (d.Calendar.Year > startYear && d.Calendar.Year < endYear && d.MonthNumber >= startMonth &&
                            d.MonthNumber <= endMonth));

        return days;
    }
}