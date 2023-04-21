using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class WelderRepository : IWelderRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WelderRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByProductionAreaIdAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    )
    {
        throw new NotImplementedException();
    }

    public async Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByWelderIdAndDatePeriodAsync(
        Guid welderId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var conditionTimesQuery = _context.WeldingEquipmentConditionTimes.Where(
            w => w.WelderId == welderId && w.Date >= startDate && w.Date <= endDate
        );

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

        //var weldingTask = _context.WeldingRecords

        return new WelderOperationTimeDto
        {
            WeldingPreparationTimeMinutes = onTimeMinutes,
            DowntimeMinutes = downtimeMinutes,
            WorkTimeMinutes = workTimeMinutes
        };
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
