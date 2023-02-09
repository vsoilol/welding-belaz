using Belaz.WeldingApp.FileApi.BusinessLayer.ChartModels;
using Belaz.WeldingApp.FileApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.SeamPassport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;
using Microsoft.AspNetCore.Hosting;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using OfficeOpenXml.Style;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class FileService : IFileService
{
    private readonly ITaskRepository _taskRepository;
    private readonly IWebHostEnvironment _environment;
    private readonly IMarkEstimateService _markEstimateService;
    private readonly IValidationService _validationService;

    public FileService(ITaskRepository taskRepository, IWebHostEnvironment environment,
        IMarkEstimateService markEstimateService, IValidationService validationService)
    {
        _taskRepository = taskRepository;
        _environment = environment;
        _markEstimateService = markEstimateService;
        _validationService = validationService;
    }

    public async Task<DocumentDto> GenerateSeamPassportAsync()
    {
        var task = await _taskRepository.GetByIdAsync(Guid.Parse("cc61244a-3e7c-408f-bd2e-419e4bbb369f"));

        var fontsPath = Path.Combine(_environment.WebRootPath, $"fonts");
        var document = new SeamPassportDocument(task, fontsPath, _markEstimateService);

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

    public async Task<Result<DocumentDto>> GenerateSeamPassportByTaskIdAsync(
        GenerateSeamPassportByTaskIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var task = await _taskRepository.GetByIdAsync(request.TaskId);

            var fontsPath = Path.Combine(_environment.WebRootPath, $"fonts");
            var document = new SeamPassportDocument(task, fontsPath, _markEstimateService);

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
        });
    }

    public async Task<Result<DocumentDto>> GenerateExcelChartAsync()
    {
        var data = ParameterDeviation.GetData();
        var content = new MemoryStream();

        var allTimeSum = data.Sum(_ => _.TimeSum);

        var chartData = data.Select(_ => new ParameterDeviationChartModel
        {
            Parameter = _.Parameter,
            TimeSum = _.TimeSum,
            TimeSumPercentages = (100m * _.TimeSum) / allTimeSum
        }).ToList() ?? new List<ParameterDeviationChartModel>();

        chartData.Add(new ParameterDeviationChartModel
        {
            Parameter = "Общее время сварки, мин.",
            TimeSum = allTimeSum,
            TimeSumPercentages = 100,
        });

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook
                .Worksheets
                .Add("Отчет об отклонениях от нормативных параметров режимов сварки");

            CreateTableForParameterDeviations(worksheet, chartData);

            CreateChartForParameterDeviations(worksheet, chartData);

            await package.SaveAsync();
        }

        return new Result<DocumentDto>(new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Dff.xlsx",
            FileType = FileTypes.ExcelType
        });
    }
    
     private void CreateTableForParameterDeviations(ExcelWorksheet worksheet,
        List<ParameterDeviationChartModel> chartData)
    {
        worksheet.Cells[1, 1].Value = "Параметры режима сварки";
        worksheet.Cells[1, 2].Value = "Суммарное время выхода параметров за пределы допустимых значений, мин.";
        worksheet.Cells[1, 3].Value = "Суммарное время выхода параметров за пределы допустимых значений, %";

        worksheet.Column(2).Width = 22;
        worksheet.Column(3).Width = 22;

        using (var rangeHeaders = worksheet.Cells[1, 1, 1, 3])
        {
            rangeHeaders.Style.Font.Bold = true;
            rangeHeaders.Style.WrapText = true;

            rangeHeaders.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeHeaders.Style.VerticalAlignment = ExcelVerticalAlignment.Center;

            rangeHeaders.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Top.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Right.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        }

        var range = worksheet.Cells[2, 1].LoadFromCollection(chartData, false);

        range.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Left.Style = ExcelBorderStyle.Thin;

        worksheet.Column(1).AutoFit();

        using (var rangeData = worksheet.Cells[2, 2, chartData.Count + 1, 3])
        {
            rangeData.Style.Numberformat.Format = "#,##0.00";
            rangeData.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeData.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        }
    }

    private void CreateChartForParameterDeviations(ExcelWorksheet worksheet,
        List<ParameterDeviationChartModel> chartData)
    {
        var pieChart = worksheet.Drawings.AddPieChart("Chart1", ePieChartType.Pie3D);

        pieChart.SetPosition(chartData.Count + 2, 0, 0, 0);
        pieChart.SetSize(600, 400);

        pieChart.Legend.Position = eLegendPosition.Bottom;

        var pieSeries = pieChart.Series.Add(worksheet.Cells[2, 3, chartData.Count, 3],
            worksheet.Cells[2, 1, chartData.Count, 1]);
        pieSeries.DataLabel.ShowPercent = true;
        pieSeries.DataLabel.ShowLeaderLines = true;
        pieSeries.DataLabel.Position = eLabelPosition.Center;
    }
}