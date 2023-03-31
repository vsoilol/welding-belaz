using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using OfficeOpenXml.Style;
using OxyPlot.Axes;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class EquipmentDowntimeReportService : IExcelFileService<List<EquipmentDowntimeDto>>
{
    public async Task<DocumentDto> GenerateReportAsync(List<EquipmentDowntimeDto> data)
    {
        var tableReportModels = GetReportModels(data);

        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Отчет о простоях оборудования");

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
        worksheet.Cells[1, 1].Value = "Причина простоя оборудования";
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
        }

        using (var rangeData = worksheet.Cells[2, 3, tableReportModels.Count + 1, 3])
        {
            rangeData.Style.Numberformat.Format = "#,##0.00";
        }
    }

    private void CreateChart(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        var histogram = worksheet.Drawings.AddBarChart("Histogram", eBarChartType.ColumnClustered);

        histogram.SetPosition(tableReportModels.Count + 2, 0, 0, 0);
        histogram.SetSize(1000, 500);
        histogram.GapWidth = 40;

        var histogramSeries = histogram.Series.Add(
            worksheet.Cells[2, 2, tableReportModels.Count, 2],
            worksheet.Cells[2, 1, tableReportModels.Count, 1]
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
}
