using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ConditionTimeInfo;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class ExcelEquipmentEfficiencyReportService : IExcelEquipmentEfficiencyReportService
{
    private readonly ICalendarRepository _calendarRepository;

    private readonly IExcelFileService<DocumentInfo<List<EquipmentEfficiencyReportDto>>>
        _excelEquipmentEfficiencyReportService;

    private readonly IProductAccountTaskRepository _productAccountTaskRepository;
    private readonly IProductionAreaRepository _productionAreaRepository;
    private readonly IValidationService _validationService;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly IWorkplaceRepository _workplaceRepository;
    private readonly IWorkshopRepository _workshopRepository;

    public ExcelEquipmentEfficiencyReportService(
        IValidationService validationService,
        IExcelFileService<DocumentInfo<List<EquipmentEfficiencyReportDto>>> excelEquipmentEfficiencyReportService,
        ICalendarRepository calendarRepository,
        IWeldingEquipmentRepository weldingEquipmentRepository, IWorkshopRepository workshopRepository,
        IWorkplaceRepository workplaceRepository, IProductionAreaRepository productionAreaRepository,
        IProductAccountTaskRepository productAccountTaskRepository)
    {
        _validationService = validationService;
        _excelEquipmentEfficiencyReportService = excelEquipmentEfficiencyReportService;
        _calendarRepository = calendarRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _workshopRepository = workshopRepository;
        _workplaceRepository = workplaceRepository;
        _productionAreaRepository = productionAreaRepository;
        _productAccountTaskRepository = productAccountTaskRepository;
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportAsync(
        ExcelEquipmentEfficiencyReportRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid) return new Result<DocumentDto>(validationResult.Exception);

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var weldingEquipmentOnTimes =
            await _weldingEquipmentRepository.GetOnConditionTimeByDatePeriodAsync(
                dateStart,
                dateEnd
            );

        var calendar = await _calendarRepository.GetMainCalendarByYearAsync(dateStart.Year);

        var productAccountTaskAmounts =
            await _productAccountTaskRepository.GetProductAccountTaskAmountsAsync(dateStart, dateEnd);

        var weldingEquipmentIds =
            await _weldingEquipmentRepository.GetWeldingEquipmentIdsAsync();

        var weldingEquipmentsCalendars =
            await _calendarRepository.GetCalendarsForWeldingEquipmentsByYearAsync(weldingEquipmentIds, dateStart.Year);

        if (!weldingEquipmentOnTimes.Any() || !productAccountTaskAmounts.Any() || calendar is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var data = GetEquipmentEfficiencyReportInfo(
            calendar,
            weldingEquipmentOnTimes,
            dateStart,
            dateEnd,
            request.Accessibility,
            request.Efficiency,
            request.Quality,
            productAccountTaskAmounts,
            weldingEquipmentIds,
            weldingEquipmentsCalendars
        );

        var result = new DocumentInfo<List<EquipmentEfficiencyReportDto>>
        {
            Data = data,
            TitleText = new[]
            {
                "Отчёт в разрезе завода",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(result);
    }

    public async Task<
        Result<DocumentDto>
    > GenerateExcelEquipmentEfficiencyReportByProductionAreaAsync(
        ExcelEquipmentEfficiencyReportByProductionAreaRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid) return new Result<DocumentDto>(validationResult.Exception);

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var weldingEquipmentOnTimes =
            await _weldingEquipmentRepository.GetOnConditionTimeByProductionAreaAndDatePeriodAsync(
                request.ProductionAreaId,
                dateStart,
                dateEnd
            );

        var productAccountTaskAmounts =
            await _productAccountTaskRepository.GetProductAccountTaskAmountsByProductionAreaAsync(dateStart, dateEnd,
                request.ProductionAreaId);

        var weldingEquipmentIds =
            await _weldingEquipmentRepository.GetWeldingEquipmentIdsByProductionAreaAsync(request.ProductionAreaId);

        var weldingEquipmentsCalendars =
            await _calendarRepository.GetCalendarsForWeldingEquipmentsByYearAsync(weldingEquipmentIds, dateStart.Year);

        var calendar = await _calendarRepository.GetMainCalendarByYearAsync(dateStart.Year);

        if (!weldingEquipmentOnTimes.Any() || !productAccountTaskAmounts.Any() || calendar is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var data = GetEquipmentEfficiencyReportInfo(
            calendar,
            weldingEquipmentOnTimes,
            dateStart,
            dateEnd,
            request.Accessibility,
            request.Efficiency,
            request.Quality,
            productAccountTaskAmounts,
            weldingEquipmentIds,
            weldingEquipmentsCalendars
        );

        var productionArea = await _productionAreaRepository.GetBriefInfoByIdAsync(request.ProductionAreaId);

        var result = new DocumentInfo<List<EquipmentEfficiencyReportDto>>
        {
            Data = data,
            TitleText = new[]
            {
                $"Отчёт в разрезе производственного участка: {productionArea.Number} {productionArea.Name}",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(result);
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportByWorkplaceAsync(
        ExcelEquipmentEfficiencyReportByWorkplaceRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid) return new Result<DocumentDto>(validationResult.Exception);

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var weldingEquipmentOnTimes =
            await _weldingEquipmentRepository.GetOnConditionTimeByWorkplaceAndDatePeriodAsync(
                request.WorkplaceId,
                dateStart,
                dateEnd
            );

        var productAccountTaskAmounts =
            await _productAccountTaskRepository.GetProductAccountTaskAmountsByWorkplaceAsync(dateStart, dateEnd,
                request.WorkplaceId);

        var weldingEquipmentIds =
            await _weldingEquipmentRepository.GetWeldingEquipmentIdsByWorkplaceAsync(request.WorkplaceId);

        var weldingEquipmentsCalendars =
            await _calendarRepository.GetCalendarsForWeldingEquipmentsByYearAsync(weldingEquipmentIds, dateStart.Year);

        var calendar = await _calendarRepository.GetMainCalendarByYearAsync(dateStart.Year);

        if (!weldingEquipmentOnTimes.Any() || !productAccountTaskAmounts.Any() || calendar is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var data = GetEquipmentEfficiencyReportInfo(
            calendar,
            weldingEquipmentOnTimes,
            dateStart,
            dateEnd,
            request.Accessibility,
            request.Efficiency,
            request.Quality,
            productAccountTaskAmounts,
            weldingEquipmentIds,
            weldingEquipmentsCalendars
        );

        var workplace = await _workplaceRepository.GetBriefInfoByIdAsync(request.WorkplaceId);

        var result = new DocumentInfo<List<EquipmentEfficiencyReportDto>>
        {
            Data = data,
            TitleText = new[]
            {
                $"Отчёт в разрезе рабочего места: {workplace.Number}",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(result);
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportByWorkshopAsync(
        ExcelEquipmentEfficiencyReportByWorkshopRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid) return new Result<DocumentDto>(validationResult.Exception);

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var weldingEquipmentOnTimes =
            await _weldingEquipmentRepository.GetOnConditionTimeByWorkshopAndDatePeriodAsync(
                request.WorkshopId,
                dateStart,
                dateEnd
            );

        var productAccountTaskAmounts =
            await _productAccountTaskRepository.GetProductAccountTaskAmountsByWorkshopAsync(dateStart, dateEnd,
                request.WorkshopId);

        var weldingEquipmentIds =
            await _weldingEquipmentRepository.GetWeldingEquipmentIdsByWorkshopAsync(request.WorkshopId);

        var weldingEquipmentsCalendars =
            await _calendarRepository.GetCalendarsForWeldingEquipmentsByYearAsync(weldingEquipmentIds, dateStart.Year);

        var calendar = await _calendarRepository.GetMainCalendarByYearAsync(dateStart.Year);

        if (!weldingEquipmentOnTimes.Any() || !productAccountTaskAmounts.Any() || calendar is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var data = GetEquipmentEfficiencyReportInfo(
            calendar,
            weldingEquipmentOnTimes,
            dateStart,
            dateEnd,
            request.Accessibility,
            request.Efficiency,
            request.Quality,
            productAccountTaskAmounts,
            weldingEquipmentIds,
            weldingEquipmentsCalendars
        );

        var workshop = await _workshopRepository.GetBriefInfoByIdAsync(request.WorkshopId);

        var result = new DocumentInfo<List<EquipmentEfficiencyReportDto>>
        {
            Data = data,
            TitleText = new[]
            {
                $"Отчёт в разрезе цеха: {workshop.Number} {workshop.Name}",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(result);
    }

    private List<EquipmentEfficiencyReportDto> GetEquipmentEfficiencyReportInfo(
        CalendarDto mainCalendar,
        List<ConditionTimeDto> onConditionTimes,
        DateTime startDate,
        DateTime endDate,
        double? accessibility,
        double? efficiency,
        double? quality,
        List<ProductAccountTaskAmountDto> productAccountTaskAmounts,
        List<Guid> weldingEquipmentsIds,
        List<CalendarDto> weldingEquipmentsCalendars)
    {
        var result = new List<EquipmentEfficiencyReportDto>();

        for (var date = startDate; date <= endDate; date = date.AddDays(1))
        {
            var accessibilityExperimental = CalculateAccessibilityForDate(date, onConditionTimes, mainCalendar,
                weldingEquipmentsIds,
                weldingEquipmentsCalendars);

            var productAccountTasksByDate = productAccountTaskAmounts
                .Where(_ => _.Date.Date == date.Date)
                .ToList();

            // TP - фактическое количество единиц продукции, изготовленное за операционное время OT.
            // Сюда входит вся продукция (изделия, узлы, детали), которая изготовлена за указанный период.
            var TP = (double)productAccountTasksByDate.Sum(d => d.ManufacturedAmount);

            // IRR - идеальная норма производства – теоретически максимальное количество единиц продукции,
            // которое можно изготовить за операционное время OT.
            // Для расчета данного показателя на форме со структурой продукции для каждого изделия,
            // узла и детали вводится норма времени на изготовление.
            // Соответственно, берем из плана количество изделий, узлов и деталей,
            // умножаем на соответствующую норму времени и суммируем.
            var IRR = productAccountTasksByDate.Sum(_ => _.AmountFromPlan * _.ManufacturingTime);

            // GP - выпуск годной продукции – фактическое количество единиц годной
            // продукции, выпущенное за время OT.
            // Сюда входит продукция (изделия, узлы и детали), которая принята контролером
            var GP = (double)productAccountTasksByDate.Sum(_ => _.AcceptedAmount);

            var A = accessibility ?? accessibilityExperimental;

            var P = efficiency ?? (IRR == 0
                ? 0
                : TP / IRR);

            var Q = quality ?? (TP == 0
                ? 0
                : GP / TP);

            var OEE = A * P * Q;

            result.Add(
                new EquipmentEfficiencyReportDto
                {
                    ReportDate = date,
                    OverallEquipmentEfficiency = OEE
                }
            );
        }

        return result;
    }

    /// <summary>
    ///     PPT - планируемое производственное время.
    ///     Это время, которое запланировано для работы оборудования согласно производственному календарю.
    /// </summary>
    /// <param name="date">Дата для которой высчитывается PPT</param>
    /// <param name="onConditionTimes">Время, когда аппарат включен или находился в работе</param>
    /// <param name="mainCalendar">Общезаводской календарь</param>
    /// <param name="weldingEquipmentsIds">Id сварочных оборудований</param>
    /// <param name="weldingEquipmentsCalendars">Календари для конкретного сварочного оборудования</param>
    /// <returns></returns>
    private double CalculateAccessibilityForDate(DateTime date,
        List<ConditionTimeDto> onConditionTimes,
        CalendarDto mainCalendar,
        List<Guid> weldingEquipmentsIds,
        List<CalendarDto> weldingEquipmentsCalendars)
    {
        var totalPPT = 0d;

        // OT – операционное время, т. е. время, оставшееся после учета простоев.
        // Это время, когда сварочный аппарат включен минус простои, превышающие 5 минут.
        // Если простой до 5 минут - он считается подготовкой к сварке. 
        var totalOT = 0d;

        foreach (var weldingEquipmentId in weldingEquipmentsIds)
        {
            var OT = onConditionTimes
                .Where(conditionTime => conditionTime.Date.Date == date.Date &&
                                        conditionTime.WeldingEquipmentId == weldingEquipmentId)
                .Sum(conditionTime => conditionTime.Time);

            if (OT == 0) continue;

            var weldingEquipmentCalendar = weldingEquipmentsCalendars
                .FirstOrDefault(_ => _.WeldingEquipmentId == weldingEquipmentId);

            var calendar = weldingEquipmentCalendar is not null && weldingEquipmentCalendar.MainWorkingShifts.Any()
                ? weldingEquipmentCalendar
                : mainCalendar;

            var day = calendar.Days?.FirstOrDefault(d => d.MonthNumber == date.Month && d.Number == date.Day);
            var mainWorkingShifts = calendar.MainWorkingShifts;

            totalPPT += GetWorkingShiftsWorkingTimeMinutes(mainWorkingShifts, day);
            totalOT += OT;
        }

        var accessibility = totalPPT == 0 ? 0 : totalOT / totalPPT;

        return accessibility;
    }

    private double GetWorkingShiftsWorkingTimeMinutes(
        List<WorkingShiftDto> mainWorkingShifts,
        DayDto? day
    )
    {
        if (IsWorkingDay(day))
        {
            var dayWorkingShift = day!.WorkingShifts;

            return CalculateTimeMinutesByWorkingShifts(dayWorkingShift!);
        }

        if (IsWeekend(day)) return 0;

        return CalculateTimeMinutesByWorkingShifts(mainWorkingShifts);
    }

    private bool IsWorkingDay(DayDto? day)
    {
        return day is not null && day.IsWorkingDay;
    }

    private bool IsWeekend(DayDto? day)
    {
        return day is not null && !day.IsWorkingDay;
    }

    private double CalculateTimeMinutesByWorkingShifts(List<WorkingShiftDto> workingShifts)
    {
        var minutes = 0.0;

        foreach (var workingShift in workingShifts)
        {
            var breakEnd = workingShift.BreakEnd!.Value.Hours == 0
                ? new TimeSpan(24, workingShift.BreakEnd!.Value.Minutes, 0)
                : workingShift.BreakEnd!.Value;
            var workingShiftEnd = workingShift.ShiftEnd.Hours == 0
                ? new TimeSpan(24, workingShift.ShiftEnd.Minutes, 0)
                : workingShift.ShiftEnd;

            var mainBreakDuration = breakEnd - workingShift.BreakStart!.Value;
            var workingShiftDuration = workingShiftEnd - workingShift.ShiftStart;

            minutes += (workingShiftDuration - mainBreakDuration).TotalMinutes;
        }

        return minutes;
    }
}