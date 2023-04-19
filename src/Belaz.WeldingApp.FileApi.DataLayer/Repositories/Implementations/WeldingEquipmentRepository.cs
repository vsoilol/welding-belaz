using AutoMapper;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class WeldingEquipmentRepository : IWeldingEquipmentRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingEquipmentRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
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

    public Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByProductionAreaIdAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    )
    {
        throw new NotImplementedException();
    }

    public Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByWelderIdAndDatePeriodAsync(
        Guid welderId,
        DateTime startDate,
        DateTime endDate
    )
    {
        throw new NotImplementedException();
    }

    public Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByWorkplaceIdAndDatePeriodAsync(
        Guid workplaceId,
        DateTime startDate,
        DateTime endDate
    )
    {
        throw new NotImplementedException();
    }

    public Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByWorkshopIdAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    )
    {
        throw new NotImplementedException();
    }
}
