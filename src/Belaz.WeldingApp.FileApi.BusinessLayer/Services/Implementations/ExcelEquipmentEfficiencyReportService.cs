using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ConditionTimeInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class ExcelEquipmentEfficiencyReportService : IExcelEquipmentEfficiencyReportService
{
    private readonly IValidationService _validationService;
    private readonly IExcelFileService<
        List<EquipmentEfficiencyReportDto>
    > _excelEquipmentEfficiencyReportService;
    private readonly ICalendarRepository _calendarRepository;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly IProductAccountRepository _productAccountRepository;

    public ExcelEquipmentEfficiencyReportService(
        IValidationService validationService,
        IExcelFileService<List<EquipmentEfficiencyReportDto>> excelEquipmentEfficiencyReportService,
        ICalendarRepository calendarRepository,
        IWeldingEquipmentRepository weldingEquipmentRepository,
        IProductAccountRepository productAccountRepository
    )
    {
        _validationService = validationService;
        _excelEquipmentEfficiencyReportService = excelEquipmentEfficiencyReportService;
        _calendarRepository = calendarRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _productAccountRepository = productAccountRepository;
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportAsync(
        ExcelEquipmentEfficiencyReportRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var weldingEquipmentOnTimes =
            await _weldingEquipmentRepository.GetOnConditionTimeByDatePeriodAsync(
                dateStart,
                dateEnd
            );

        var calendar = await _calendarRepository.GetMainCalendarByYearAsync(dateStart.Year);

        var productAccounts =
            await _productAccountRepository.GetProductAccountBriefsByDatePeriodAsync(
                dateStart,
                dateEnd
            );

        if (!weldingEquipmentOnTimes.Any() || !productAccounts.Any() || calendar is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var data = GetEquipmentEfficiencyReportInfo(
            calendar,
            weldingEquipmentOnTimes,
            productAccounts,
            dateStart,
            dateEnd,
            request.Accessibility,
            request.Efficiency,
            request.Quality
        );

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(data);
    }

    public async Task<
        Result<DocumentDto>
    > GenerateExcelEquipmentEfficiencyReportByProductionAreaAsync(
        ExcelEquipmentEfficiencyReportByProductionAreaRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var weldingEquipmentOnTimes =
            await _weldingEquipmentRepository.GetOnConditionTimeByProductionAreaAndDatePeriodAsync(
                request.ProductionAreaId,
                dateStart,
                dateEnd
            );

        var calendar = await _calendarRepository.GetMainCalendarByYearAsync(dateStart.Year);

        var productAccounts =
            await _productAccountRepository.GetProductAccountBriefsByDatePeriodAndProductionAreaAsync(
                request.ProductionAreaId,
                dateStart,
                dateEnd
            );

        if (!weldingEquipmentOnTimes.Any() || !productAccounts.Any() || calendar is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var data = GetEquipmentEfficiencyReportInfo(
            calendar,
            weldingEquipmentOnTimes,
            productAccounts,
            dateStart,
            dateEnd,
            request.Accessibility,
            request.Efficiency,
            request.Quality
        );

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(data);
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportByWorkplaceAsync(
        ExcelEquipmentEfficiencyReportByWorkplaceRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var weldingEquipmentOnTimes =
            await _weldingEquipmentRepository.GetOnConditionTimeByWorkplaceAndDatePeriodAsync(
                request.WorkplaceId,
                dateStart,
                dateEnd
            );

        var calendar = await _calendarRepository.GetMainCalendarByYearAsync(dateStart.Year);

        var productAccounts =
            await _productAccountRepository.GetProductAccountBriefsByDatePeriodAndWorkplaceAsync(
                request.WorkplaceId,
                dateStart,
                dateEnd
            );

        if (!weldingEquipmentOnTimes.Any() || !productAccounts.Any() || calendar is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var data = GetEquipmentEfficiencyReportInfo(
            calendar,
            weldingEquipmentOnTimes,
            productAccounts,
            dateStart,
            dateEnd,
            request.Accessibility,
            request.Efficiency,
            request.Quality
        );

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(data);
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportByWorkshopAsync(
        ExcelEquipmentEfficiencyReportByWorkshopRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var weldingEquipmentOnTimes =
            await _weldingEquipmentRepository.GetOnConditionTimeByWorkshopAndDatePeriodAsync(
                request.WorkshopId,
                dateStart,
                dateEnd
            );

        var calendar = await _calendarRepository.GetMainCalendarByYearAsync(dateStart.Year);

        var productAccounts =
            await _productAccountRepository.GetProductAccountBriefsByDatePeriodAndWorkshopAsync(
                request.WorkshopId,
                dateStart,
                dateEnd
            );

        if (!weldingEquipmentOnTimes.Any() || !productAccounts.Any() || calendar is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var data = GetEquipmentEfficiencyReportInfo(
            calendar,
            weldingEquipmentOnTimes,
            productAccounts,
            dateStart,
            dateEnd,
            request.Accessibility,
            request.Efficiency,
            request.Quality
        );

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(data);
    }

    private List<EquipmentEfficiencyReportDto> GetEquipmentEfficiencyReportInfo(
        CalendarDto calendar,
        List<ConditionTimeDto> onConditionTimes,
        List<ProductAccountBriefDto> productAccounts,
        DateTime startDate,
        DateTime endDate,
        double? accessibility,
        double? efficiency,
        double? quality
    )
    {
        var result = new List<EquipmentEfficiencyReportDto>();

        for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
        {
            var day = calendar.Days?.FirstOrDefault(
                _ => _.MonthNumber == date.Month && _.Number == date.Day
            );

            var PPT = GetWorkingShiftsWorkingTimeMinutes(calendar.MainWorkingShifts, day);
            var OT = onConditionTimes.Where(_ => _.Date.Date == date.Date).Sum(_ => _.Time);

            var productAccountsByDate = productAccounts
                .Where(_ => _.DateFromPlan.Date == date.Date)
                .ToList();

            var TP = (double)productAccountsByDate.Sum(_ => _.AmountManufactured);
            var IRR = productAccountsByDate.Sum(_ => _.AmountFromPlan * _.ManufacturingTime);

            var GP = (double)productAccountsByDate.Sum(_ => _.AmountAccept);

            var A = accessibility is not null
                ? (double)accessibility
                : PPT == 0
                    ? 0
                    : (OT / PPT);

            var P = efficiency is not null
                ? (double)efficiency
                : IRR == 0
                    ? 0
                    : (TP / IRR);

            var Q = quality is not null
                ? (double)quality
                : TP == 0
                    ? 0
                    : (GP / TP);

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

        if (IsWeekend(day))
        {
            return 0;
        }

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
            if (workingShift.ShiftEnd.Hours == 0)
            {
                workingShift.ShiftEnd = new TimeSpan(24, workingShift.ShiftEnd.Minutes, 0);
            }

            minutes += (workingShift.ShiftEnd - workingShift.ShiftStart).TotalMinutes;
        }

        return minutes;
    }
}
