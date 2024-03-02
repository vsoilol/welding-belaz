using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

internal class CalendarRepository : ICalendarRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public CalendarRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<CalendarDto?> GetMainCalendarByYearAsync(int year)
    {
        var calendarQuery = _context.Calendars.Where(_ => _.IsMain && _.Year == year);

        return calendarQuery
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<List<CalendarDto>> GetCalendarsForWeldingEquipmentsByYearAsync(IEnumerable<Guid> weldingEquipmentIds,
        int year)
    {
        var calendarQuery =
            _context.Calendars.Where(calendar =>
                calendar.WeldingEquipmentId != null && weldingEquipmentIds.Contains(calendar.WeldingEquipmentId.Value));

        return calendarQuery
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}