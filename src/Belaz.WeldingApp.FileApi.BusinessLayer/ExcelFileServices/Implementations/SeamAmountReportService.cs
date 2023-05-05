using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class SeamAmountReportService : IExcelFileService<DocumentInfo<SeamAmountDto>>
{
    private const int TitleRow = 1;
    private const int HeaderStartRow = 2;
    private const int DataStartRow = 3;

    private const int TextInfoColumn = 1;
    private const int DataColumn = 2;
    private const int DataPercentageColumn = DataColumn + 1;

    private readonly IExcelExtensions _excelExtensions;

    public SeamAmountReportService(IExcelExtensions excelExtensions)
    {
        _excelExtensions = excelExtensions;
    }

    public async Task<DocumentDto> GenerateReportAsync(DocumentInfo<SeamAmountDto> data)
    {
        var tableReportModels = GetReportModels(data.Data);

        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Отчет о выполненных операциях (швах)");
            
            CreateHeader(worksheet, data.TitleText);

            CreateTable(worksheet, tableReportModels);

            CreateChart(worksheet, tableReportModels);

            await package.SaveAsync();
        }

        return new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Отчет о выполненных операциях (швах).xlsx",
            FileType = FileTypes.ExcelType
        };
    }

    private List<TableReportModel> GetReportModels(SeamAmountDto data)
    {
        var all = data.NumAddedManually + data.NumControlledRegistrar;
        var numRejectedAll = data.NumRejectedManually + data.NumRejectedRegistrar;
        var numQuality = all - numRejectedAll;

        return new List<TableReportModel>
        {
            new()
            {
                Parameter = "Количество швов, проконтролированных регистратором",
                Value = data.NumControlledRegistrar,
                ValuePercentages = MathExtension.CalculatePercentage(
                    all,
                    data.NumControlledRegistrar
                )
            },
            new()
            {
                Parameter = "Количество швов, добавленных вручную",
                Value = data.NumAddedManually,
                ValuePercentages = MathExtension.CalculatePercentage(all, data.NumAddedManually)
            },
            new()
            {
                Parameter =
                    "Количество швов с отклонениями от нормативных параметров режима сварки",
                Value = data.NumDeviantWelding,
                ValuePercentages = MathExtension.CalculatePercentage(all, data.NumDeviantWelding)
            },
            new()
            {
                Parameter = "Количество забракованных швов среди проконтролированных регистратором",
                Value = data.NumRejectedRegistrar,
                ValuePercentages = MathExtension.CalculatePercentage(all, data.NumRejectedRegistrar)
            },
            new()
            {
                Parameter = "Количество забракованных швов среди добавленных вручную",
                Value = data.NumRejectedManually,
                ValuePercentages = MathExtension.CalculatePercentage(all, data.NumRejectedManually)
            },
            new()
            {
                Parameter = "Общее количество забракованных швов",
                Value = numRejectedAll,
                ValuePercentages = MathExtension.CalculatePercentage(all, numRejectedAll)
            },
            new()
            {
                Parameter = "Количество качественных швов",
                Value = numQuality,
                ValuePercentages = MathExtension.CalculatePercentage(all, numQuality)
            },
            new()
            {
                Parameter = "Общее количество выполненных швов",
                Value = all,
                ValuePercentages = 100
            }
        };
    }

    private void CreateTable(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        worksheet.Cells[HeaderStartRow, TextInfoColumn].Value = "Наименование параметра";
        worksheet.Cells[HeaderStartRow, DataColumn].Value = "Количество швов";
        worksheet.Cells[HeaderStartRow, DataPercentageColumn].Value = "% швов";

        worksheet.Column(DataColumn).Width = 22;
        worksheet.Column(DataPercentageColumn).Width = 22;

        using (var rangeHeaders = worksheet.Cells[HeaderStartRow, TextInfoColumn, HeaderStartRow, DataPercentageColumn])
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

        var range = worksheet.Cells[DataStartRow, TextInfoColumn].LoadFromCollection(tableReportModels, false);

        range.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Left.Style = ExcelBorderStyle.Thin;

        worksheet.Column(TextInfoColumn).AutoFit();

        using (var rangeData = worksheet.Cells[DataStartRow, DataColumn, tableReportModels.Count + HeaderStartRow,
                   DataPercentageColumn])
        {
            rangeData.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeData.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        }

        using (var rangeData =
               worksheet.Cells[DataStartRow, DataPercentageColumn, tableReportModels.Count + HeaderStartRow,
                   DataPercentageColumn])
        {
            rangeData.Style.Numberformat.Format = "#,##0.00";
        }
    }

    private void CreateChart(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        _excelExtensions.CreatePie3DExcelChart(
            worksheet,
            tableReportModels,
            "Chart1",
            tableReportModels.Count + DataStartRow,
            0,
            worksheet.Cells[DataStartRow + 2, DataPercentageColumn, DataStartRow + 4, DataPercentageColumn],
            worksheet.Cells[DataStartRow + 2, TextInfoColumn, DataStartRow + 4, TextInfoColumn]
        );

        _excelExtensions.CreatePie3DExcelChart(
            worksheet,
            tableReportModels,
            "Chart2",
            tableReportModels.Count + DataStartRow,
            2,
            worksheet.Cells[DataStartRow + 5, DataPercentageColumn, DataStartRow + 6, DataPercentageColumn],
            worksheet.Cells[DataStartRow + 5, TextInfoColumn, DataStartRow + 6, TextInfoColumn]
        );
    }
    
    private void CreateHeader(ExcelWorksheet worksheet, string[] titles)
    {
        using (var rangeHeaders =
               worksheet.Cells[TitleRow, TextInfoColumn, TitleRow, DataPercentageColumn])
        {
            rangeHeaders.Merge = true;
            rangeHeaders.Style.Font.Bold = true;
            rangeHeaders.Style.WrapText = true;

            rangeHeaders.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeHeaders.Style.VerticalAlignment = ExcelVerticalAlignment.Center;

            rangeHeaders.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Top.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Right.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        }

        worksheet.Cells[TitleRow, TextInfoColumn].Value = string.Join("\n", titles);

        var textRow = worksheet.Row(TitleRow);
        textRow.Height = 15 * titles.Length;
    }
}