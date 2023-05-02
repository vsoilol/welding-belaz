using System.Globalization;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class EquipmentEfficiencyReportService
    : IExcelFileService<List<EquipmentEfficiencyReportDto>>
{
    private const int HeaderStartRow = 1;
    private const int ReportDateColumn = 1;
    private const int OverallEquipmentEfficiencyColumn = 2;
    private const int ColumnWidth = 22;
    private const int DataStartRow = 2;

    public async Task<DocumentDto> GenerateReportAsync(List<EquipmentEfficiencyReportDto> data)
    {
        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add(
                "Отчет об эффективности использования оборудования"
            );
            CreateTable(worksheet, data);

            CreateChart(worksheet, data);

            await package.SaveAsync();
        }

        return new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Отчет об эффективности использования оборудования.xlsx",
            FileType = FileTypes.ExcelType
        };
    }

    private void CreateTable(ExcelWorksheet worksheet, List<EquipmentEfficiencyReportDto> data)
    {
        worksheet.Cells[HeaderStartRow, ReportDateColumn].Value = "Дата";
        worksheet.Cells[HeaderStartRow, OverallEquipmentEfficiencyColumn].Value = "OEE";

        worksheet.Column(ReportDateColumn).Width = ColumnWidth;
        worksheet.Column(OverallEquipmentEfficiencyColumn).Width = ColumnWidth;

        using (
            var rangeHeaders = worksheet.Cells[
                HeaderStartRow,
                ReportDateColumn,
                HeaderStartRow,
                OverallEquipmentEfficiencyColumn
            ]
        )
        {
            rangeHeaders.Style.Font.Bold = true;

            rangeHeaders.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeHeaders.Style.VerticalAlignment = ExcelVerticalAlignment.Center;

            rangeHeaders.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Top.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Right.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        }

        var range = worksheet.Cells[DataStartRow, ReportDateColumn].LoadFromCollection(data, false);

        range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        range.Style.VerticalAlignment = ExcelVerticalAlignment.Center;

        range.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Left.Style = ExcelBorderStyle.Thin;

        worksheet.Cells[DataStartRow, ReportDateColumn, data.Count + 1, ReportDateColumn]
            .Style
            .Numberformat
            .Format = "dd.MMM";

        // worksheet.Cells[
        //     DataStartRow,
        //     OverallEquipmentEfficiencyColumn,
        //     data.Count + 1,
        //     OverallEquipmentEfficiencyColumn
        // ]
        //     .Style
        //     .Numberformat
        //     .Format = "#,##0.00";
    }

    private void CreateChart(ExcelWorksheet worksheet, List<EquipmentEfficiencyReportDto> data)
    {
        var lineChart = worksheet.Drawings.AddLineChart("Line", eLineChartType.LineMarkers);

        lineChart.SetPosition(2, 0, 3, 0);
        lineChart.SetSize(1000, 500);

        var lineChartSeries = lineChart.Series.Add(
            worksheet.Cells[
                DataStartRow,
                OverallEquipmentEfficiencyColumn,
                data.Count + 1,
                OverallEquipmentEfficiencyColumn
            ],
            worksheet.Cells[DataStartRow, ReportDateColumn, data.Count + 1, ReportDateColumn]
        );

        lineChart.Title.Text = "OEE";
        lineChart.Legend.Remove();
    }
}
