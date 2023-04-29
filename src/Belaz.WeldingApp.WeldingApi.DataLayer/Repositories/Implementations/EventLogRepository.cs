using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

internal class EventLogRepository : IEventLogRepository
{
    private readonly IMapper _mapper;
    private readonly ApplicationContext _context;

    public EventLogRepository(IMapper mapper, ApplicationContext context)
    {
        _mapper = mapper;
        _context = context;
    }

    public Task<List<EventLogDto>> GetAllAsync()
    {
        return _context.EventLogs
            .OrderByDescending(_ => _.DateTime)
            .ProjectTo<EventLogDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<EventLogDto> GetByIdAsync(Guid id)
    {
        return _context.EventLogs
            .Where(_ => _.Id == id)
            .ProjectTo<EventLogDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<EventLogDto> AddAsync(EventLog entity)
    {
        var newEventLog = _context.EventLogs.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newEventLog.Id);
    }
}