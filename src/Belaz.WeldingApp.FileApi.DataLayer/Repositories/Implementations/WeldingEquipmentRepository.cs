using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ConditionTimeInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

internal class WeldingEquipmentRepository : IWeldingEquipmentRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingEquipmentRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<ConditionTimeDto>> GetConditionTimeByDatePeriodAsync(
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w => w.Date >= startDate && w.Date <= endDate
        );

        return conditionTimesQuery
            .ProjectTo<ConditionTimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ConditionTimeDto>> GetConditionTimeByProductionAreaAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w =>
                w.WeldingEquipment.Workplaces.Any(
                    wp =>
                        wp.PostId == null
                            ? wp.ProductionAreaId == productionAreaId
                            : wp.Post!.ProductionAreaId == productionAreaId
                )
                && w.Date >= startDate
                && w.Date <= endDate
        );

        return conditionTimesQuery
            .ProjectTo<ConditionTimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ConditionTimeDto>> GetConditionTimeByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w =>
                w.WeldingEquipment.Workplaces.Any(
                    wp =>
                        wp.PostId == null
                            ? wp.ProductionArea!.WorkshopId == workshopId
                            : wp.Post!.ProductionArea.WorkshopId == workshopId
                )
                && w.Date >= startDate
                && w.Date <= endDate
        );

        return conditionTimesQuery
            .ProjectTo<ConditionTimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<EquipmentDowntimeDto>> GetDownTimeInfoByIdAndDatePeriodAsync(
        Guid id,
        DateTime startDate,
        DateTime endDate
    )
    {
        var equipmentDowntimes = _context.WeldingEquipmentConditionTimes
            .Include(_ => _.DowntimeReason)
            .Where(
                w =>
                    w.WeldingEquipmentId == id
                    && w.Date >= startDate
                    && w.Date <= endDate
                    && w.Condition == Condition.ForcedDowntime
                    && w.DowntimeReason != null
            )
            .GroupBy(w => w.DowntimeReason!.Reason)
            .Select(g => new EquipmentDowntimeDto { Reason = g.Key, Time = g.Sum(w => w.Time) })
            .ToListAsync();

        return equipmentDowntimes;
    }

    public async Task<EquipmentOperationTimeDto> GetEquipmentOperationTimeByIdAndDatePeriodAsync(
        Guid id,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w => w.WeldingEquipmentId == id && w.Date >= startDate && w.Date <= endDate
        );

        var conditionTimeGroups = await conditionTimesQuery
            .GroupBy(w => w.Condition)
            .Select(g => new { Condition = g.Key, Time = g.Sum(w => w.Time) })
            .ToListAsync();

        var allMinutes = endDate.Date.Subtract(startDate.Date).TotalMinutes;

        var onTimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.On)?.Time ?? 0;
        var workTimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.AtWork)?.Time ?? 0;
        var downtimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.ForcedDowntime)?.Time
            ?? 0;

        var offTimeMinutes = allMinutes - downtimeMinutes - workTimeMinutes - onTimeMinutes;

        return new EquipmentOperationTimeDto
        {
            OffTimeMinutes = offTimeMinutes,
            OnTimeMinutes = onTimeMinutes,
            DowntimeMinutes = downtimeMinutes,
            WorkTimeMinutes = workTimeMinutes
        };
    }

    public Task<List<ConditionTimeDto>> GetOnConditionTimeByDatePeriodAsync(
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w => w.Date >= startDate && w.Date <= endDate && w.Condition == Condition.On
        );

        return conditionTimesQuery
            .ProjectTo<ConditionTimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ConditionTimeDto>> GetOnConditionTimeByProductionAreaAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w =>
                w.WeldingEquipment.Workplaces.Any(
                    wp =>
                        wp.PostId == null
                            ? wp.ProductionAreaId == productionAreaId
                            : wp.Post!.ProductionAreaId == productionAreaId
                )
                && w.Date >= startDate
                && w.Date <= endDate
                && w.Condition == Condition.On
        );

        return conditionTimesQuery
            .ProjectTo<ConditionTimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ConditionTimeDto>> GetOnConditionTimeByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w =>
                w.WeldingEquipment.Workplaces.Any(
                    wp =>
                        wp.PostId == null
                            ? wp.ProductionArea!.WorkshopId == workshopId
                            : wp.Post!.ProductionArea.WorkshopId == workshopId
                )
                && w.Date >= startDate
                && w.Date <= endDate
                && w.Condition == Condition.On
        );

        return conditionTimesQuery
            .ProjectTo<ConditionTimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ConditionTimeDto>> GetOnConditionTimeByWorkplaceAndDatePeriodAsync(
        Guid workplaceId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w =>
                w.WeldingEquipment.Workplaces.Any(wp => wp.Id == workplaceId)
                && w.Date >= startDate
                && w.Date <= endDate
                && w.Condition == Condition.On
        );

        return conditionTimesQuery
            .ProjectTo<ConditionTimeDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<WeldingEquipmentBriefDto> GetBriefInfoByIdAsync(Guid id)
    {
        return _context.WeldingEquipments.Where(_ => _.Id == id)
            .ProjectTo<WeldingEquipmentBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}