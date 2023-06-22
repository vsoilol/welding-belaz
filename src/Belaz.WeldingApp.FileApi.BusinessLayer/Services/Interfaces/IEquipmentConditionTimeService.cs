using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ConditionTimeInfo;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IEquipmentConditionTimeService
{
    double GetWorkingShiftAllMinutesByDateTimeDuration(
        int workingShiftNumber,
        DateTime startDate,
        DateTime endDate,
        List<DayDto> days,
        List<WorkingShiftDto> mainWorkingShifts,
        bool withBreak = true
    );

    int? GetWorkingShiftNumberForConditionTime(
        ConditionTimeDto conditionTime,
        List<DayDto> days,
        List<WorkingShiftDto> mainWorkingShifts
    );

    EquipmentOperationTimeWithShiftDto CalculateConditionTime(
        List<ConditionTimeDto> conditionTimes,
        double allMinutes,
        string? text = null
    );
}