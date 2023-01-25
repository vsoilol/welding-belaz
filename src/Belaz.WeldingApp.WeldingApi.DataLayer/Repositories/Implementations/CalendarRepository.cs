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

    public async Task<bool> UpdateAsync(Calendar entity)
    {
        var updatedCalendar = await _context.Calendars
            .FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedCalendar is null)
        {
            return false;
        }

        updatedCalendar.Year = entity.Year;

        await _context.SaveChangesAsync();

        return true;
    }

    public Task<CalendarDto?> GetByIdAsync(Guid id)
    {
        return _context.Calendars
            .Where(_ => _.Id == id)
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<List<CalendarDto>> GetAllAsync()
    {
        return _context.Calendars
            .ProjectTo<CalendarDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<IQueryable<Calendar>> AddAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task<IQueryable<Calendar>> UpdateAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task<IQueryable<Calendar>> GetMainCalendarByYearAsync(int year)
    {
        throw new NotImplementedException();
    }

    public Task<IQueryable<Calendar>> GetByWelderIdAsync(int year, Guid welderId)
    {
        throw new NotImplementedException();
    }

    public Task<IQueryable<Calendar>> GetByEquipmentIdAsync(int year, Guid weldingEquipmentId)
    {
        throw new NotImplementedException();
    }
}