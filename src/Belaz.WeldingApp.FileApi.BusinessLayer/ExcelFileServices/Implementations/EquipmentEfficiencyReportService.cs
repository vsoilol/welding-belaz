using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class EquipmentEfficiencyReportService
    : IExcelFileService<DocumentInfo<List<EquipmentEfficiencyReportDto>>>
{
    private const int TitleRow = 1;

    private int _headerStartRow = 2;
    private int _dataStartRow = 3;

    private const int ReportDateColumn = 1;
    private const int OverallEquipmentEfficiencyColumn = 2;
    private const int ColumnWidth = 22;

    private readonly IExcelExtensions _excelExtensions;

    public EquipmentEfficiencyReportService(IExcelExtensions excelExtensions)
    {
        _excelExtensions = excelExtensions;
    }

    public async Task<DocumentDto> GenerateReportAsync(DocumentInfo<List<EquipmentEfficiencyReportDto>> data)
    {
        var content = new MemoryStream();

        _headerStartRow = TitleRow + data.TitleText.Length;
        _dataStartRow = _headerStartRow + 1;

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add(
                "Отчет об эффективности использования оборудования"
            );

            CreateHeader(worksheet, data.TitleText);

            CreateTable(worksheet, data.Data);

            CreateChart(worksheet, data.Data);

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
        worksheet.Cells[_headerStartRow, ReportDateColumn].Value = "Дата";
        worksheet.Cells[_headerStartRow, OverallEquipmentEfficiencyColumn].Value = "OEE";

        using (
            var rangeHeaders = worksheet.Cells[
                _headerStartRow,
                ReportDateColumn,
                _headerStartRow,
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

        var range = worksheet.Cells[_dataStartRow, ReportDateColumn].LoadFromCollection(data, false);

        range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        range.Style.VerticalAlignment = ExcelVerticalAlignment.Center;

        range.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Left.Style = ExcelBorderStyle.Thin;

        worksheet.Cells[_dataStartRow, ReportDateColumn, data.Count + _headerStartRow, ReportDateColumn]
            .Style
            .Numberformat
            .Format = "dd.MMM";

        using (
            var rangeData = worksheet.Cells[
                _dataStartRow,
                OverallEquipmentEfficiencyColumn,
                data.Count + _headerStartRow,
                OverallEquipmentEfficiencyColumn
            ]
        )
        {
            rangeData.Style.Numberformat.Format = "#,###0.000";
        }
    }

    private void CreateChart(ExcelWorksheet worksheet, List<EquipmentEfficiencyReportDto> data)
    {
        var lineChart = worksheet.Drawings.AddLineChart("Line", eLineChartType.LineMarkers);

        lineChart.SetPosition(2, 0, 3, 0);
        lineChart.SetSize(1000, 500);

        var lineChartSeries = lineChart.Series.Add(
            worksheet.Cells[
                _dataStartRow,
                OverallEquipmentEfficiencyColumn,
                data.Count + _headerStartRow,
                OverallEquipmentEfficiencyColumn
            ],
            worksheet.Cells[_dataStartRow, ReportDateColumn, data.Count + _headerStartRow, ReportDateColumn]
        );

        lineChart.Title.Text = "OEE";
        lineChart.Legend.Remove();
    }

    private void CreateHeader(ExcelWorksheet worksheet, string[] titles)
    {
        var maxLengthIndex = titles.Select((s, i) => new { Value = s, Index = i })
            .Aggregate((a, b) => a.Value.Length > b.Value.Length ? a : b)
            .Index;

        for (int i = 0; i < titles.Length; i++)
        {
            if (i == maxLengthIndex)
            {
                _excelExtensions.AutoFitMergedColumns(worksheet, titles[i],
                    i + 1, ReportDateColumn,
                    OverallEquipmentEfficiencyColumn);
                continue;
            }

            worksheet.Cells[i + 1, ReportDateColumn, i + 1, OverallEquipmentEfficiencyColumn].Merge = true;
            worksheet.Cells[i + 1, ReportDateColumn].Value = titles[i];
        }

        using (var rangeHeaders =
               worksheet.Cells[TitleRow, ReportDateColumn, titles.Length, OverallEquipmentEfficiencyColumn])
        {
            rangeHeaders.Style.Font.Bold = true;

            rangeHeaders.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeHeaders.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            
            rangeHeaders.Style.Border.Right.Style = ExcelBorderStyle.Thin;
            rangeHeaders.Style.Border.Left.Style = ExcelBorderStyle.Thin;
        }

        worksheet.Cells[TitleRow, ReportDateColumn, TitleRow, OverallEquipmentEfficiencyColumn]
            .Style.Border.Top.Style = ExcelBorderStyle.Thin;
        worksheet.Cells[titles.Length, ReportDateColumn, titles.Length, OverallEquipmentEfficiencyColumn]
            .Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
    }
}