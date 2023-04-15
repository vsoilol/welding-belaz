using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class EquipmentOperationReportService : IExcelFileService<EquipmentOperationTimeDto>
{
    private readonly IExcelExtensions _excelExtensions;

    public EquipmentOperationReportService(IExcelExtensions excelExtensions)
    {
        _excelExtensions = excelExtensions;
    }

    public async Task<DocumentDto> GenerateReportAsync(EquipmentOperationTimeDto data)
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

    private List<TableReportModel> GetReportModels(EquipmentOperationTimeDto data)
    {
        var allTime =
            data.OffTimeMinutes + data.OnTimeMinutes + data.WorkTimeMinutes + data.DowntimeMinutes;

        return new List<TableReportModel>
        {
            new()
            {
                Parameter = "Сварочный аппарат ВЫКЛЮЧЕН",
                Value = data.OffTimeMinutes,
                ValuePercentages = MathExtension.CalculatePercentage(allTime, data.OffTimeMinutes)
            },
            new()
            {
                Parameter = "Сварочный аппарат ВКЛЮЧЕН",
                Value = data.OnTimeMinutes,
                ValuePercentages = MathExtension.CalculatePercentage(allTime, data.OnTimeMinutes)
            },
            new()
            {
                Parameter = "СВАРКА",
                Value = data.WorkTimeMinutes,
                ValuePercentages = MathExtension.CalculatePercentage(allTime, data.WorkTimeMinutes)
            },
            new()
            {
                Parameter = "Вынужденный простой",
                Value = data.DowntimeMinutes,
                ValuePercentages = MathExtension.CalculatePercentage(allTime, data.DowntimeMinutes)
            },
            new()
            {
                Parameter = "Общий фонд рабочего времени",
                Value = allTime,
                ValuePercentages = 100
            }
        };
    }

    private void CreateTable(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        worksheet.Cells[1, 1].Value = "Состояние";
        worksheet.Cells[1, 2].Value = "Время, мин";
        worksheet.Cells[1, 3].Value = "%";

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

            rangeData.Style.Numberformat.Format = "#,##0.00";
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
            worksheet.Cells[2, 3, tableReportModels.Count, 3],
            worksheet.Cells[2, 1, tableReportModels.Count, 1]
        );
    }
}
