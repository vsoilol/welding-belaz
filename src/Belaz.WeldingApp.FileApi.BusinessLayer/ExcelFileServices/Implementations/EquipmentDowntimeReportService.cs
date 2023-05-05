using System.Drawing;
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

public class EquipmentDowntimeReportService : IExcelFileService<DocumentInfo<List<EquipmentDowntimeDto>>>
{
    private const int TitleRow = 1;
    private const int HeaderStartRow = 2;
    private const int DataStartRow = 3;

    private const int TextInfoColumn = 1;
    private const int DataColumn = 2;
    private const int DataPercentageColumn = DataColumn + 1;

    public async Task<DocumentDto> GenerateReportAsync(DocumentInfo<List<EquipmentDowntimeDto>> data)
    {
        var tableReportModels = GetReportModels(data.Data);

        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Отчет о простоях оборудования");
            
            CreateHeader(worksheet, data.TitleText);

            CreateTable(worksheet, tableReportModels);

            CreateChart(worksheet, tableReportModels);

            await package.SaveAsync();
        }

        return new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Отчет о простоях оборудования.xlsx",
            FileType = FileTypes.ExcelType
        };
    }

    private List<TableReportModel> GetReportModels(List<EquipmentDowntimeDto> data)
    {
        var allTime = data.Sum(_ => _.Time);

        var tableReportModels = data.Select(
                _ =>
                    new TableReportModel
                    {
                        Parameter = _.Reason,
                        Value = _.Time,
                        ValuePercentages = MathExtension.CalculatePercentage(allTime, _.Time)
                    }
            )
            .ToList();

        tableReportModels.Add(
            new TableReportModel
            {
                Parameter = "Общий фонд рабочего времени",
                Value = allTime,
                ValuePercentages = 100
            }
        );

        return tableReportModels;
    }

    private void CreateTable(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        worksheet.Cells[HeaderStartRow, TextInfoColumn].Value = "Причина простоя оборудования";
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

        var range = worksheet.Cells[DataStartRow, TextInfoColumn]
            .LoadFromCollection(tableReportModels, false);

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

            rangeData.Style.Numberformat.Format = "#,##0.00";
        }
    }

    private void CreateChart(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        var histogram = worksheet.Drawings.AddBarChart("Histogram", eBarChartType.ColumnClustered);

        histogram.SetPosition(tableReportModels.Count + DataStartRow, 0, 0, 0);
        histogram.SetSize(1000, 500);
        histogram.GapWidth = 40;

        var histogramSeries = histogram.Series.Add(
            worksheet.Cells[DataStartRow, DataColumn, tableReportModels.Count + HeaderStartRow - 1, DataColumn],
            worksheet.Cells[DataStartRow, TextInfoColumn, tableReportModels.Count + HeaderStartRow - 1, TextInfoColumn]
        );

        histogramSeries.DataLabel.ShowValue = true;
        histogramSeries.DataLabel.Position = eLabelPosition.OutEnd;

        histogram.Title.Text = "Причины простоя оборудования";
        histogram.Legend.Remove();

        histogram.XAxis.MajorTickMark = eAxisTickMark.Out;
        histogram.XAxis.MinorTickMark = eAxisTickMark.None;

        histogram.YAxis.MajorTickMark = eAxisTickMark.Out;
        histogram.YAxis.MinorTickMark = eAxisTickMark.None;
        histogram.YAxis.MajorGridlines.Fill.Color = Color.Gray;
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