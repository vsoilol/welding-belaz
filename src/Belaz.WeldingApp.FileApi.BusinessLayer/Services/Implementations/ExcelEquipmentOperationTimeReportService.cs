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

public class ExcelEquipmentOperationTimeReportService : IExcelEquipmentOperationTimeReportService
{
    private readonly IValidationService _validationService;
    private readonly IExcelFileService<EquipmentOperationTimeDto> _excelEquipmentOperationTimeReportService;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;

    public ExcelEquipmentOperationTimeReportService(
        IValidationService validationService,
        IExcelFileService<EquipmentOperationTimeDto> excelEquipmentOperationTimeReportService,
        IWeldingEquipmentRepository weldingEquipmentRepository
    )
    {
        _validationService = validationService;
        _excelEquipmentOperationTimeReportService = excelEquipmentOperationTimeReportService;
        _weldingEquipmentRepository = weldingEquipmentRepository;
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentOperationTimeReportAsync(
        GenerateExcelEquipmentOperationTimeReportRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var data =
            await _weldingEquipmentRepository.GetEquipmentOperationTimeByIdAndDatePeriodAsync(
                request.WeldingEquipmentId,
                dateStart,
                dateEnd
            );

        if (data is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        return await _excelEquipmentOperationTimeReportService.GenerateReportAsync(data);
    }
}
