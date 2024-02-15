using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Enums;
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

    public Task<List<RecordDto>> GetRecordsByDatePeriodAsync(DateTime startDate, DateTime endDate, string? seamNumber,
        int? weldingTaskNumber,
        Guid? welderId, Guid? masterId, Guid? equipmentId)
    {
        var weldingRecords = _context.WeldingRecords
            .OrderByDescending(_ => _.Date.Date)
            .ThenByDescending(x => x.WeldingStartTime.TotalSeconds)
            .Where(_ => _.Date.Date >= startDate.Date
                        && _.Date.Date <= endDate.Date);

        if (seamNumber is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WeldPassage!.WeldingTask.SeamAccount.Seam.Number == seamNumber);
        }

        if (weldingTaskNumber is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WeldPassage!.WeldingTask.Number == weldingTaskNumber);
        }

        if (welderId is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WelderId == welderId);
        }

        if (masterId is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WeldPassage!.WeldingTask.MasterId != null
                    ? _.WeldPassage!.WeldingTask.MasterId == masterId
                    : _.MasterId == masterId);
        }

        if (equipmentId is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WeldingEquipmentId == equipmentId);
        }

        return weldingRecords
            .ProjectTo<RecordDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<WeldingRecord>> GetRecordsByDateAsync(DateTime date, TimeSpan? startTime, TimeSpan? endTime,
        Guid? welderId, Guid? equipmentId)
    {
        var weldingRecords = _context.WeldingRecords
            .OrderBy(_ => _.Date.Date)
            .ThenBy(x => x.WeldingStartTime.TotalSeconds)
            .Where(_ => _.Date.Date == date.Date);

        if (startTime is not null && endTime is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WeldingStartTime.TotalSeconds >= startTime.Value.TotalSeconds
                            && _.WeldingEndTime.TotalSeconds <= endTime.Value.TotalSeconds);
        }

        if (welderId is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WelderId == welderId);
        }

        if (equipmentId is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WeldingEquipmentId == equipmentId);
        }

        return weldingRecords.ToListAsync();
    }

    public Task<List<RecordDto>> GetRecordsByDatePeriodAsync(DateTime startDate, DateTime endDate, string? seamNumber)
    {
        var weldingRecords = _context.WeldingRecords
            .OrderByDescending(_ => _.Date.Date)
            .ThenByDescending(x => x.WeldingStartTime.TotalSeconds)
            .Where(_ => _.Date.Date >= startDate.Date
                        && _.Date.Date <= endDate.Date);

        if (seamNumber is not null)
        {
            weldingRecords = weldingRecords
                .Where(_ => _.WeldPassage!.WeldingTask.SeamAccount.Seam.Number == seamNumber);
        }

        return weldingRecords
            .ProjectTo<RecordDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task SetSequenceNumberToWeldingRecordsAsync(List<Guid> weldingRecordIds, string sequenceNumber)
    {
        var weldingRecords = await _context
            .WeldingRecords
            .Where(weldingRecord => weldingRecordIds.Any(_ => _ == weldingRecord.Id))
            .ToListAsync();

        foreach (var weldingRecord in weldingRecords)
        {
            weldingRecord.SequenceNumber = sequenceNumber;
        }

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

    public async Task<PaginatedList<RecordDto>> GetFilteredRecordsAsync(string? searchTerm, string sortColumn,
        SortOrder sortOrder,
        int pageSize, int pageNumber)
    {
        IQueryable<WeldingRecord> recordsQuery = _context.WeldingRecords.AsQueryable();

        recordsQuery = ApplySearchTermFilter(recordsQuery, searchTerm);
        recordsQuery = ApplySorting(recordsQuery, sortColumn, sortOrder);

        var count = await recordsQuery.CountAsync();
        var records = await recordsQuery
            .Skip((pageNumber - 1) * pageSize)
            .Take(pageSize)
            .ProjectTo<RecordDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        return new PaginatedList<RecordDto>(records, count, pageNumber, pageSize);
    }

    private IQueryable<WeldingRecord> ApplySearchTermFilter(IQueryable<WeldingRecord> query, string? searchTerm)
    {
        if (!string.IsNullOrWhiteSpace(searchTerm))
        {
            query = query.Where(record =>
                ApplicationContext.ToChar(record.Date, "DD.MM.YYYY").Contains(searchTerm) ||
                EF.Functions.Like(record.WeldPassage!.WeldingTask.ProductAccountTask!.SequenceNumber,
                    $"%{searchTerm}%") ||
                record.WeldPassage.WeldingTask.SeamAccount.Seam.Number.Contains(searchTerm) ||
                EF.Functions.Like(record.WeldPassage.WeldingTask.Number.ToString(), $"%{searchTerm}%") ||
                ApplicationContext.ToChar(record.WeldingStartTime, "HH24:MI:SS").Contains(searchTerm) ||
                record.Welder.UserInfo.FirstName.Contains(searchTerm) ||
                record.Welder.UserInfo.LastName.Contains(searchTerm) ||
                record.Welder.UserInfo.MiddleName.Contains(searchTerm) ||
                (record.WeldPassage != null &&
                 (record.WeldPassage!.WeldingTask.Master!.UserInfo.MiddleName.Contains(searchTerm) ||
                  record.WeldPassage!.WeldingTask.Master!.UserInfo.LastName.Contains(searchTerm) ||
                  record.WeldPassage!.WeldingTask.Master!.UserInfo.FirstName.Contains(searchTerm))) ||
                (record.WeldPassage == null && (record.Master!.UserInfo.MiddleName.Contains(searchTerm) ||
                                                record.Master!.UserInfo.LastName.Contains(searchTerm) ||
                                                record.Master!.UserInfo.FirstName.Contains(searchTerm))) ||
                record.WeldingEquipment.FactoryNumber.Contains(searchTerm) ||
                record.WeldingEquipment.Marking.Contains(searchTerm));
        }

        return query;
    }

    private IQueryable<WeldingRecord> ApplySorting(IQueryable<WeldingRecord> query, string sortColumn,
        SortOrder sortOrder)
    {
        var isAscending = sortOrder == SortOrder.Ascending;

        var sortOptions = new Dictionary<string, Func<IQueryable<WeldingRecord>, IQueryable<WeldingRecord>>>
        {
            ["date"] = q => ApplyDynamicOrder(q, r => r.Date.Date + r.WeldingStartTime, isAscending),
            ["sequencenumber"] = q =>
                ApplyOrderByNestedProperty(q, "WeldPassage.WeldingTask.ProductAccountTask.SequenceNumber", isAscending),
            ["seamnumber"] = q =>
                ApplyOrderByNestedProperty(q, "WeldPassage.WeldingTask.SeamAccount.Seam.Number", isAscending),
            ["master"] = q =>
                ApplyOrderByNestedProperty(q, "WeldPassage.WeldingTask.Master.UserInfo.MiddleName", isAscending),
            ["welder"] = q => ApplyOrderByNestedProperty(q, "Welder.UserInfo.MiddleName", isAscending),
            ["weldingequipment"] = q => ApplyOrderByNestedProperty(q, "WeldingEquipment.FactoryNumber", isAscending),
            ["weldingtask"] = q => ApplyOrderByNestedProperty(q, "WeldPassage.WeldingTask.Number", isAscending),
            ["weldingstarttime"] = q => ApplyDynamicOrder(q, r => r.WeldingStartTime.TotalSeconds, isAscending),
            ["weldingduration"] = q =>
                ApplyDynamicOrder(q, r => (r.WeldingStartTime - r.WeldingEndTime).TotalSeconds, isAscending),
            ["weldingcurrentaverage"] = q => ApplyOrderByNestedProperty(q, "WeldingCurrentAverage", isAscending),
            ["arcvoltageaverage"] = q => ApplyOrderByNestedProperty(q, "ArcVoltageAverage", isAscending),
        };

        Func<IQueryable<WeldingRecord>, IQueryable<WeldingRecord>> defaultSort = q =>
            ApplyDynamicOrder(q, r => r.Date.Date + r.WeldingStartTime, isAscending);

        query = sortOptions.TryGetValue(sortColumn.ToLower(), out var sortFunction)
            ? sortFunction(query)
            : defaultSort(query);

        return query;
    }

    private IQueryable<WeldingRecord> ApplyOrderByNestedProperty(IQueryable<WeldingRecord> query, string propertyPath,
        bool isAscending)
    {
        return query.OrderByNestedPropertyAndFilterNonNull(propertyPath, isAscending);
    }

    private IQueryable<WeldingRecord> ApplyDynamicOrder<T>(IQueryable<WeldingRecord> query,
        Expression<Func<WeldingRecord, T>> keySelector, bool isAscending)
    {
        return query.OrderByDynamic(keySelector, isAscending);
    }
}