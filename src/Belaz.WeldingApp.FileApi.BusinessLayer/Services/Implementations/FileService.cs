using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.SeamPassport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;
using Microsoft.AspNetCore.Hosting;
using QuestPDF.Fluent;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class FileService : IFileService
{
    private readonly ITaskRepository _taskRepository;
    private readonly IWebHostEnvironment _environment;
    private readonly IValidationService _validationService;
    private readonly IExcelFileService<
        List<EquipmentOperationTimeWithShiftDto>
    > _excelEquipmentOperationAnalysisReportService;
    private readonly IExcelFileService<WelderOperationTimeDto> _excelWelderOperationReportService;
    private readonly IExcelFileService<
        List<EquipmentEfficiencyReportDto>
    > _excelEquipmentEfficiencyReportService;

    public FileService(
        ITaskRepository taskRepository,
        IWebHostEnvironment environment,
        IValidationService validationService,
        IExcelFileService<
            List<EquipmentOperationTimeWithShiftDto>
        > excelEquipmentOperationAnalysisReportService,
        IExcelFileService<WelderOperationTimeDto> excelWelderOperationReportService,
        IExcelFileService<List<EquipmentEfficiencyReportDto>> excelEquipmentEfficiencyReportService
    )
    {
        _taskRepository = taskRepository;
        _environment = environment;
        _validationService = validationService;
        _excelEquipmentOperationAnalysisReportService =
            excelEquipmentOperationAnalysisReportService;
        _excelWelderOperationReportService = excelWelderOperationReportService;
        _excelEquipmentEfficiencyReportService = excelEquipmentEfficiencyReportService;
    }

    public async Task<Result<DocumentDto>> GenerateSeamPassportByTaskIdAsync(
        GenerateSeamPassportByTaskIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var task = await _taskRepository.GetByIdAsync(request.TaskId);

        var fontsPath = Path.Combine(_environment.WebRootPath, $"fonts");
        var document = new SeamPassportDocument(task, fontsPath);

        byte[] bytes;
        using (var stream = new MemoryStream())
        {
            document.GeneratePdf(stream);
            bytes = stream.ToArray();
        }

        var result = new DocumentDto
        {
            FileName = $"Паспорт Шва №{task.Seam.Number}.pdf",
            FileType = FileTypes.PdfType,
            Bytes = bytes
        };

        return result;
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentOperationAnalysisReportAsync()
    {
        var equipmentOperationTimeWithShiftDtos = new List<EquipmentOperationTimeWithShiftDto>
        {
            new()
            {
                CutInfo = "Смена 1",
                OffTimeMinutes = 120,
                OnTimeMinutes = 80,
                WorkTimeMinutes = 132,
                DowntimeMinutes = 118
            },
            new()
            {
                CutInfo = "Смена 2",
                OffTimeMinutes = 133,
                OnTimeMinutes = 92,
                WorkTimeMinutes = 140,
                DowntimeMinutes = 105
            },
            new()
            {
                CutInfo = "Смена 3",
                OffTimeMinutes = 145,
                OnTimeMinutes = 98,
                WorkTimeMinutes = 125,
                DowntimeMinutes = 82
            }
        };

        return await _excelEquipmentOperationAnalysisReportService.GenerateReportAsync(
            equipmentOperationTimeWithShiftDtos
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportAsync()
    {
        var equipmentEfficiencyReportDtos = new List<EquipmentEfficiencyReportDto>
        {
            new() { ReportDate = new DateTime(2023, 9, 1), OverallEquipmentEfficiency = 0.38 },
            new() { ReportDate = new DateTime(2023, 9, 2), OverallEquipmentEfficiency = 0.39 },
            new() { ReportDate = new DateTime(2023, 9, 5), OverallEquipmentEfficiency = 0.4 },
            new() { ReportDate = new DateTime(2023, 9, 6), OverallEquipmentEfficiency = 0.41 },
            new() { ReportDate = new DateTime(2023, 9, 7), OverallEquipmentEfficiency = 0.41 },
            new() { ReportDate = new DateTime(2023, 9, 8), OverallEquipmentEfficiency = 0.39 },
            new() { ReportDate = new DateTime(2023, 9, 9), OverallEquipmentEfficiency = 0.4 },
            new() { ReportDate = new DateTime(2023, 9, 12), OverallEquipmentEfficiency = 0.38 },
            new() { ReportDate = new DateTime(2023, 9, 13), OverallEquipmentEfficiency = 0.39 },
            new() { ReportDate = new DateTime(2023, 9, 14), OverallEquipmentEfficiency = 0.41 },
            new() { ReportDate = new DateTime(2023, 9, 15), OverallEquipmentEfficiency = 0.42 },
            new() { ReportDate = new DateTime(2023, 9, 16), OverallEquipmentEfficiency = 0.38 },
            new() { ReportDate = new DateTime(2023, 9, 19), OverallEquipmentEfficiency = 0.39 },
            new() { ReportDate = new DateTime(2023, 9, 20), OverallEquipmentEfficiency = 0.41 },
            new() { ReportDate = new DateTime(2023, 9, 21), OverallEquipmentEfficiency = 0.45 },
            new() { ReportDate = new DateTime(2023, 9, 22), OverallEquipmentEfficiency = 0.42 },
            new() { ReportDate = new DateTime(2023, 9, 23), OverallEquipmentEfficiency = 0.4 },
            new() { ReportDate = new DateTime(2023, 9, 26), OverallEquipmentEfficiency = 0.38 },
            new() { ReportDate = new DateTime(2023, 9, 27), OverallEquipmentEfficiency = 0.4 },
            new() { ReportDate = new DateTime(2023, 9, 28), OverallEquipmentEfficiency = 0.42 },
        };

        return await _excelEquipmentEfficiencyReportService.GenerateReportAsync(
            equipmentEfficiencyReportDtos
        );
    }
}
