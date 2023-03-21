using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class SeamAmountReportService : IExcelFileService<SeamAmountDto>
{
    private readonly IExcelExtensions _excelExtensions;

    public SeamAmountReportService(IExcelExtensions excelExtensions)
    {
        _excelExtensions = excelExtensions;
    }

    public async Task<DocumentDto> GenerateReportAsync(SeamAmountDto data)
    {
        var tableReportModels = GetReportModels(data);

        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Отчет о выполненных операциях (швах)");

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
        worksheet.Cells[1, 1].Value = "Наименование параметра";
        worksheet.Cells[1, 2].Value = "Количество швов";
        worksheet.Cells[1, 3].Value = "% швов";

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

        var range = worksheet.Cells[2, 1].LoadFromCollection(tableReportModels, false);

        range.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Left.Style = ExcelBorderStyle.Thin;

        worksheet.Column(1).AutoFit();

        using (var rangeData = worksheet.Cells[2, 2, tableReportModels.Count + 1, 3])
        {
            rangeData.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeData.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        }

        using (var rangeData = worksheet.Cells[2, 3, tableReportModels.Count + 1, 3])
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
            tableReportModels.Count + 2,
            0,
            worksheet.Cells[4, 3, 6, 3],
            worksheet.Cells[4, 1, 6, 1]
        );

        _excelExtensions.CreatePie3DExcelChart(
            worksheet,
            tableReportModels,
            "Chart2",
            tableReportModels.Count + 2,
            2,
            worksheet.Cells[7, 3, 8, 3],
            worksheet.Cells[7, 1, 8, 1]
        );
    }
}
