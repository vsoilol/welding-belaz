using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class EquipmentOperationReportService : IExcelFileService<DocumentInfo<EquipmentOperationTimeDto>>
{
    private const int TitleRow = 1;
    private const int HeaderStartRow = 2;
    private const int DataStartRow = 3;

    private const int TextInfoColumn = 1;
    private const int DataColumn = 2;
    private const int DataPercentageColumn = DataColumn + 1;

    private readonly IExcelExtensions _excelExtensions;

    public EquipmentOperationReportService(IExcelExtensions excelExtensions)
    {
        _excelExtensions = excelExtensions;
    }

    public async Task<DocumentDto> GenerateReportAsync(DocumentInfo<EquipmentOperationTimeDto> data)
    {
        var tableReportModels = GetReportModels(data.Data);

        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Отчет работе оборудования за период");
            
            CreateHeader(worksheet, data.TitleText);

            CreateTable(worksheet, tableReportModels);

            CreateChart(worksheet, tableReportModels);

            await package.SaveAsync();
        }

        return new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Отчет работе оборудования за период.xlsx",
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
        worksheet.Cells[HeaderStartRow, TextInfoColumn].Value = "Состояние";
        worksheet.Cells[HeaderStartRow, DataColumn].Value = "Время, мин";
        worksheet.Cells[HeaderStartRow, DataPercentageColumn].Value = "%";

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

        using (var rangeData =
               worksheet.Cells[DataStartRow, DataColumn, tableReportModels.Count + HeaderStartRow,
                   DataPercentageColumn])
        {
            rangeData.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeData.Style.VerticalAlignment = ExcelVerticalAlignment.Center;

            rangeData.Style.Numberformat.Format = "#,##0.00";
        }
    }

    private void CreateChart(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        _excelExtensions.CreatePie3DExcelChart(
            worksheet,
            tableReportModels,
            "Chart1",
            tableReportModels.Count + HeaderStartRow + 1,
            0,
            worksheet.Cells[DataStartRow, DataPercentageColumn, tableReportModels.Count + HeaderStartRow - 1,
                DataPercentageColumn],
            worksheet.Cells[DataStartRow, TextInfoColumn, tableReportModels.Count + HeaderStartRow - 1, TextInfoColumn]
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