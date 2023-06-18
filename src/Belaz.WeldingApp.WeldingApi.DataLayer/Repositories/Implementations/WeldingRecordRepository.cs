using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WeldingRecordRepository : IWeldingRecordRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingRecordRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<RecordDto>> GetAllWithDeviationsAsync()
    {
        var weldingRecords = _context.WeldingRecords
            .OrderByDescending(_ => _.Date.Date)
            .ThenByDescending(x => x.WeldingStartTime.TotalSeconds)
            .Where(x => x.WeldPassage != null
                ? (x.WeldPassage!.IsEnsuringCurrentAllowance.HasValue
                   && !x.WeldPassage.IsEnsuringCurrentAllowance.Value)
                  || (x.WeldPassage.IsEnsuringTemperatureAllowance.HasValue
                      && !x.WeldPassage.IsEnsuringTemperatureAllowance.Value)
                  || (x.WeldPassage.IsEnsuringVoltageAllowance.HasValue
                      && !x.WeldPassage.IsEnsuringVoltageAllowance.Value)
                : (x.IsEnsuringCurrentAllowance.HasValue && !x.IsEnsuringCurrentAllowance.Value)
                  ||
                  (x.IsEnsuringVoltageAllowance.HasValue && !x.IsEnsuringVoltageAllowance.Value));

        return weldingRecords
            .ProjectTo<RecordDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedWeldingRecord = (
            await _context.WeldingRecords.FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        _context.WeldingRecords.Remove(deletedWeldingRecord);
        await _context.SaveChangesAsync();
    }

    public Task<List<RecordDto>> GetAllAsync()
    {
        var weldingRecords = _context.WeldingRecords
            .OrderByDescending(_ => _.Date.Date)
            .ThenByDescending(x => x.WeldingStartTime.TotalSeconds);

        return weldingRecords
            .ProjectTo<RecordDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}