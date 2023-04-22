using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

internal class WelderRepository : IWelderRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WelderRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<WelderOperationTimeDto?> GetWelderOperationTimeInfoAndDatePeriodAsync(
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w => w.Date >= startDate && w.Date <= endDate
        );

        if (!(await conditionTimesQuery.AnyAsync()))
        {
            return null;
        }

        var weldPassagesQuery = _context.WeldPassages.Where(
            _ => _.WeldingRecord.Date >= startDate && _.WeldingRecord.Date <= endDate
        );

        var result = await CalculateWelderOperationTimeAsync(
            conditionTimesQuery,
            weldPassagesQuery
        );

        return result;
    }

    public async Task<WelderOperationTimeDto?> GetWelderOperationTimeInfoByProductionAreaIdAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w =>
                w.Welder.UserInfo.ProductionAreaId == productionAreaId
                && w.Date >= startDate
                && w.Date <= endDate
        );

        if (!(await conditionTimesQuery.AnyAsync()))
        {
            return null;
        }

        var weldPassagesQuery = _context.WeldPassages.Where(
            _ =>
                _.WeldingTask.Welder!.UserInfo.ProductionAreaId == productionAreaId
                && _.WeldingRecord.Date >= startDate
                && _.WeldingRecord.Date <= endDate
        );

        var result = await CalculateWelderOperationTimeAsync(
            conditionTimesQuery,
            weldPassagesQuery
        );

        return result;
    }

    public async Task<WelderOperationTimeDto?> GetWelderOperationTimeInfoByWelderIdAndDatePeriodAsync(
        Guid welderId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w => w.WelderId == welderId && w.Date >= startDate && w.Date <= endDate
        );

        if (!(await conditionTimesQuery.AnyAsync()))
        {
            return null;
        }

        var weldPassagesQuery = _context.WeldPassages.Where(
            _ =>
                _.WeldingTask.WelderId == welderId
                && _.WeldingRecord.Date >= startDate
                && _.WeldingRecord.Date <= endDate
        );

        var result = await CalculateWelderOperationTimeAsync(
            conditionTimesQuery,
            weldPassagesQuery
        );

        return result;
    }

    public async Task<WelderOperationTimeDto?> GetWelderOperationTimeInfoByWorkplaceIdAndDatePeriodAsync(
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
        );

        if (!(await conditionTimesQuery.AnyAsync()))
        {
            return null;
        }

        var weldPassagesQuery = _context.WeldPassages.Where(
            _ =>
                _.WeldingTask.WeldPassages.Any(
                    weldPassage =>
                        weldPassage.WeldingRecord.WeldingEquipment.Workplaces.Any(
                            wp => wp.Id == workplaceId
                        )
                )
                && _.WeldingRecord.Date >= startDate
                && _.WeldingRecord.Date <= endDate
        );

        var result = await CalculateWelderOperationTimeAsync(
            conditionTimesQuery,
            weldPassagesQuery
        );

        return result;
    }

    public async Task<WelderOperationTimeDto?> GetWelderOperationTimeInfoByWorkshopIdAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w =>
                w.Welder.UserInfo.ProductionArea!.WorkshopId == workshopId
                && w.Date >= startDate
                && w.Date <= endDate
        );

        if (!(await conditionTimesQuery.AnyAsync()))
        {
            return null;
        }

        var weldPassagesQuery = _context.WeldPassages.Where(
            _ =>
                _.WeldingTask.Welder!.UserInfo.ProductionArea!.WorkshopId == workshopId
                && _.WeldingRecord.Date >= startDate
                && _.WeldingRecord.Date <= endDate
        );

        var result = await CalculateWelderOperationTimeAsync(
            conditionTimesQuery,
            weldPassagesQuery
        );

        return result;
    }

    private double CalculateAverageEstimation(List<WeldPassage> weldPassages)
    {
        var weldingTimesMinute = weldPassages
            .Select(wp => wp.WeldingRecord.WeldingEndTime - wp.WeldingRecord.WeldingStartTime)
            .Select(timeSpan => timeSpan.TotalMinutes)
            .ToList();

        var minTime = weldingTimesMinute.Min();
        var maxTime = weldingTimesMinute.Max();

        var totalNormalizeTime = 0.0;
        var totalEstimationMultiplyNormalizeTime = 0.0;

        foreach (var weldPassage in weldPassages)
        {
            var weldingTimeMinutes = (
                weldPassage.WeldingRecord.WeldingEndTime
                - weldPassage.WeldingRecord.WeldingStartTime
            ).TotalMinutes;
            var estimation = weldPassage.Estimation ?? 0;

            var normalizeTime = (weldingTimeMinutes - minTime) / (maxTime - minTime);

            totalNormalizeTime += normalizeTime;
            totalEstimationMultiplyNormalizeTime += estimation * normalizeTime;
        }

        return totalEstimationMultiplyNormalizeTime / totalNormalizeTime;
    }

    private async Task<WelderOperationTimeDto> CalculateWelderOperationTimeAsync(
        IQueryable<WeldingEquipmentConditionTime> conditionTimesQuery,
        IQueryable<WeldPassage> weldPassagesQuery
    )
    {
        var conditionTimeGroups = await conditionTimesQuery
            .GroupBy(w => w.Condition)
            .Select(g => new { Condition = g.Key, Time = g.Sum(w => w.Time) })
            .ToListAsync();

        var onTimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.On)?.Time ?? 0;
        var workTimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.AtWork)?.Time ?? 0;
        var downtimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.ForcedDowntime)?.Time
            ?? 0;

        var weldPassages = await weldPassagesQuery.Include(_ => _.WeldingRecord).ToListAsync();

        var averageEstimation = weldPassages.Any() ? CalculateAverageEstimation(weldPassages) : 0;

        return new WelderOperationTimeDto
        {
            WeldingPreparationTimeMinutes = onTimeMinutes,
            DowntimeMinutes = downtimeMinutes,
            WorkTimeMinutes = workTimeMinutes,
            AverageEstimation = averageEstimation
        };
    }
}
