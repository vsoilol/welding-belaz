using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class EquipmentOperationAnalysisReportService
    : IExcelFileService<List<EquipmentOperationTimeWithShiftDto>>
{
    private readonly IExcelExtensions _excelExtensions;

    public EquipmentOperationAnalysisReportService(IExcelExtensions excelExtensions)
    {
        _excelExtensions = excelExtensions;
    }

    public async Task<DocumentDto> GenerateReportAsync(
        List<EquipmentOperationTimeWithShiftDto> data
    )
    {
        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Анализ работы оборудования");

            CreateTable(worksheet, data);

            await package.SaveAsync();
        }

        return new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Анализ работы оборудования.xlsx",
            FileType = FileTypes.ExcelType
        };
    }

    private void CreateTable(
        ExcelWorksheet worksheet,
        List<EquipmentOperationTimeWithShiftDto> data
    )
    {
        CreateTableHeader(worksheet);

        CreateTableBody(worksheet, data);
    }

    private void CreateTableBody(
        ExcelWorksheet worksheet,
        List<EquipmentOperationTimeWithShiftDto> data
    )
    {
        using (var rangeHeaders = worksheet.Cells[3, 1, data.Count + 2, 10])
        {
            rangeHeaders.Style.WrapText = true;

            rangeHeaders.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeHeaders.Style.VerticalAlignment = ExcelVerticalAlignment.Center;

            rangeHeaders.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Top.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Right.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        }

        for (int i = 0; i < data.Count; i++)
        {
            var item = data[i];
            var columnNumber = i + 3;
            var allMinutes =
                item.OffTimeMinutes
                + item.OnTimeMinutes
                + item.WorkTimeMinutes
                + item.DowntimeMinutes;

            worksheet.Cells[columnNumber, 1].Value = $"Смена {item.WorkingShifNumber}";

            worksheet.Cells[columnNumber, 2].Value = item.OffTimeMinutes;
            worksheet.Cells[columnNumber, 3].Value = MathExtension.CalculatePercentage(
                allMinutes,
                item.OffTimeMinutes
            );

            worksheet.Cells[columnNumber, 4].Value = item.OnTimeMinutes;
            worksheet.Cells[columnNumber, 5].Value = MathExtension.CalculatePercentage(
                allMinutes,
                item.OnTimeMinutes
            );

            worksheet.Cells[columnNumber, 6].Value = item.WorkTimeMinutes;
            worksheet.Cells[columnNumber, 7].Value = MathExtension.CalculatePercentage(
                allMinutes,
                item.WorkTimeMinutes
            );

            worksheet.Cells[columnNumber, 8].Value = item.DowntimeMinutes;
            worksheet.Cells[columnNumber, 9].Value = MathExtension.CalculatePercentage(
                allMinutes,
                item.DowntimeMinutes
            );

            worksheet.Cells[columnNumber, 10].Value = allMinutes;
        }

        using (var rangeHeaders = worksheet.Cells[3, 1, data.Count + 2, 1])
        {
            rangeHeaders.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
        }

        using (var rangeHeaders = worksheet.Cells[3, 3, data.Count + 2, 3])
        {
            rangeHeaders.Style.Numberformat.Format = "#,##0.00";
        }

        using (var rangeHeaders = worksheet.Cells[3, 5, data.Count + 2, 5])
        {
            rangeHeaders.Style.Numberformat.Format = "#,##0.00";
        }

        using (var rangeHeaders = worksheet.Cells[3, 7, data.Count + 2, 7])
        {
            rangeHeaders.Style.Numberformat.Format = "#,##0.00";
        }

        using (var rangeHeaders = worksheet.Cells[3, 9, data.Count + 2, 9])
        {
            rangeHeaders.Style.Numberformat.Format = "#,##0.00";
        }
    }

    private void CreateTableHeader(ExcelWorksheet worksheet)
    {
        worksheet.Cells[1, 1].Value = "Состояние";
        var columnOne = worksheet.Column(1);

        worksheet.Cells[1, 1, 2, 1].Merge = true;
        columnOne.Width = 20;

        _excelExtensions.AutoFitMergedColumns(worksheet, "Св. аппарат ВЫКЛЮЧЕН", 1, 2, 3);
        _excelExtensions.AutoFitMergedColumns(worksheet, "Св. аппарат ВКЛЮЧЕН", 1, 4, 5);
        _excelExtensions.AutoFitMergedColumns(worksheet, "СВАРКА", 1, 6, 7);
        _excelExtensions.AutoFitMergedColumns(worksheet, "Вынужденный простой", 1, 8, 9);

        worksheet.Cells[1, 10].Value = "Общий фонд рабочего времени";

        worksheet.Column(10).AutoFit();

        worksheet.Columns[6, 7].Width = 9;

        worksheet.Cells[2, 2].Value = "Минут";
        worksheet.Cells[2, 3].Value = "%";

        worksheet.Cells[2, 4].Value = "Минут";
        worksheet.Cells[2, 5].Value = "%";

        worksheet.Cells[2, 6].Value = "Минут";
        worksheet.Cells[2, 7].Value = "%";

        worksheet.Cells[2, 8].Value = "Минут";
        worksheet.Cells[2, 9].Value = "%";

        worksheet.Cells[2, 10].Value = "Минут";

        using (var rangeHeaders = worksheet.Cells[1, 1, 2, 10])
        {
            rangeHeaders.Style.WrapText = true;

            rangeHeaders.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeHeaders.Style.VerticalAlignment = ExcelVerticalAlignment.Center;

            rangeHeaders.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Top.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Right.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        }
    }
}
