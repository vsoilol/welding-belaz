using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class ExcelEquipmentDowntimeReportService : IExcelEquipmentDowntimeReportService
{
    private readonly IValidationService _validationService;
    private readonly IExcelFileService<
        List<EquipmentDowntimeDto>
    > _excelEquipmentDowntimeReportService;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;

    public ExcelEquipmentDowntimeReportService(
        IValidationService validationService,
        IExcelFileService<List<EquipmentDowntimeDto>> excelEquipmentDowntimeReportService,
        IWeldingEquipmentRepository weldingEquipmentRepository
    )
    {
        _validationService = validationService;
        _excelEquipmentDowntimeReportService = excelEquipmentDowntimeReportService;
        _weldingEquipmentRepository = weldingEquipmentRepository;
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentDowntimeReportAsync(
        GenerateExcelEquipmentDowntimeReportRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var data = await _weldingEquipmentRepository.GetDownTimeInfoByIdAndDatePeriodAsync(
            request.WeldingEquipmentId,
            dateStart,
            dateEnd
        );

        if (data is null || !data.Any())
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        return await _excelEquipmentDowntimeReportService.GenerateReportAsync(data);
    }
}
