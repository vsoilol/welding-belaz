using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class DeviationsReportService : IExcelFileService<List<WeldPassageDeviationsDto>>
{
    public async Task<DocumentDto> GenerateReportAsync(List<WeldPassageDeviationsDto> data)
    {
        var longTermDeviation = data.Sum(_ => _.LongTermDeviation ?? 0) / 60;
        var shortTermDeviation = data.Sum(_ => _.ShortTermDeviation ?? 0) / 60;
        var weldingTime = data.Sum(_ => _.WeldingTime) / 60d;

        var chartData = new List<ParameterDeviationReportModel>
        {
            new()
            {
                Parameter = "В пределах нормы",
                TimeSum = weldingTime - longTermDeviation - shortTermDeviation,
                TimeSumPercentages =
                    (100 * (weldingTime - longTermDeviation - shortTermDeviation)) / weldingTime
            },
            new()
            {
                Parameter = "Отклонение кратковременные, до 1 секунды",
                TimeSum = shortTermDeviation,
                TimeSumPercentages = (100 * shortTermDeviation) / weldingTime
            },
            new()
            {
                Parameter = "Отклонения длительные, более 1 секунды",
                TimeSum = longTermDeviation,
                TimeSumPercentages = (100 * longTermDeviation) / weldingTime
            },
            new()
            {
                Parameter = "Общее время сварки, мин",
                TimeSum = weldingTime,
                TimeSumPercentages = 100
            }
        };

        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add(
                "Отчет об отклонениях от нормативных параметров режимов сварки"
            );

            CreateTableForParameterDeviations(worksheet, chartData);

            CreateChartForParameterDeviations(worksheet, chartData);

            await package.SaveAsync();
        }

        return new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Отчет об отклонениях от нормативных параметров.xlsx",
            FileType = FileTypes.ExcelType
        };
    }

    private void CreateTableForParameterDeviations(
        ExcelWorksheet worksheet,
        List<ParameterDeviationReportModel> chartData
    )
    {
        worksheet.Cells[1, 1].Value = "Параметры режима сварки";
        worksheet.Cells[1, 2].Value =
            "Суммарное время выхода параметров за пределы допустимых значений, мин.";
        worksheet.Cells[1, 3].Value =
            "Суммарное время выхода параметров за пределы допустимых значений, %";

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

    private void CreateChartForParameterDeviations(
        ExcelWorksheet worksheet,
        List<ParameterDeviationReportModel> chartData
    )
    {
        var pieChart = worksheet.Drawings.AddPieChart("Chart1", ePieChartType.Pie3D);

        pieChart.SetPosition(chartData.Count + 2, 0, 0, 0);
        pieChart.SetSize(600, 400);

        pieChart.Legend.Position = eLegendPosition.Bottom;

        var pieSeries = pieChart.Series.Add(
            worksheet.Cells[2, 3, chartData.Count, 3],
            worksheet.Cells[2, 1, chartData.Count, 1]
        );
        pieSeries.DataLabel.ShowPercent = true;
        pieSeries.DataLabel.ShowLeaderLines = true;
        pieSeries.DataLabel.Position = eLabelPosition.Center;
    }
}
