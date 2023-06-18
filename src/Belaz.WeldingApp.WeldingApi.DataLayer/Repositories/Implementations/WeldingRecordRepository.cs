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

    public async Task<WeldingRecordLimitDto> UpdateWeldingRecordLimitAsync(WeldingRecordLimit entity)
    {
        var weldingRecordLimit = (await _context.WeldingRecordLimits.FirstOrDefaultAsync())!;

        weldingRecordLimit.ArcVoltageMax = entity.ArcVoltageMax;
        weldingRecordLimit.ArcVoltageMin = entity.ArcVoltageMin;
        weldingRecordLimit.WeldingCurrentMax = entity.WeldingCurrentMax;
        weldingRecordLimit.WeldingCurrentMin = entity.WeldingCurrentMin;

        var records = await _context.WeldingRecords.ToListAsync();

        foreach (var record in records)
        {
            record.IsEnsuringCurrentAllowance = CalculateIsEnsuringValue(record.WeldingCurrentValues,
                entity.WeldingCurrentMin, entity.WeldingCurrentMax);
            record.IsEnsuringVoltageAllowance = CalculateIsEnsuringValue(record.ArcVoltageValues,
                entity.ArcVoltageMin, entity.ArcVoltageMax);
        }
        
        await _context.SaveChangesAsync();

        return _mapper.Map<WeldingRecordLimitDto>(weldingRecordLimit);
    }

    public Task<WeldingRecordLimitDto> GetWeldingRecordLimitAsync()
    {
        return _context.WeldingRecordLimits
            .ProjectTo<WeldingRecordLimitDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
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
    
    private bool? CalculateIsEnsuringValue(double[] values, double? min, double? max)
    {
        if (min is null || max is null)
        {
            return null;
        }
        
        var countSequential = 0;
        var longCount = 0;

        for (var i = 0; i < values.Length; i++)
        {
            if (values[i] < min || values[i] > max)
            {
                countSequential++;

                if (i != values.Length - 1)
                    continue;
            }

            if (countSequential > 50)
            {
                longCount += countSequential;
            }

            countSequential = 0;
        }

        return !(longCount > 0);
    }
}