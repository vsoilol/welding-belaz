using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class DeviationsReportService : IExcelFileService<DocumentInfo<List<WeldPassageDeviationsDto>>>
{
    private const int TitleRow = 1;
    private const int HeaderStartRow = 2;
    private const int TextInfoColumn = 1;
    private const int DataStartRow = 3;
    private const int DataColumn = 2;
    private const int DataPercentageColumn = DataColumn + 1;

    public async Task<DocumentDto> GenerateReportAsync(DocumentInfo<List<WeldPassageDeviationsDto>> documentInfo)
    {
        var data = documentInfo.Data;

        var longTermDeviation = data.Sum(_ => _.LongTermDeviation ?? 0) / 60;
        var shortTermDeviation = data.Sum(_ => _.ShortTermDeviation ?? 0) / 60;
        var weldingTime = data.Sum(_ => _.WeldingTime) / 60;

        var chartData = new List<TableReportModel>
        {
            new()
            {
                Parameter = "В пределах нормы",
                Value = weldingTime - longTermDeviation - shortTermDeviation,
                ValuePercentages =
                    (100 * (weldingTime - longTermDeviation - shortTermDeviation)) / weldingTime
            },
            new()
            {
                Parameter = "Отклонение кратковременные, до 1 секунды",
                Value = shortTermDeviation,
                ValuePercentages = (100 * shortTermDeviation) / weldingTime
            },
            new()
            {
                Parameter = "Отклонения длительные, более 1 секунды",
                Value = longTermDeviation,
                ValuePercentages = (100 * longTermDeviation) / weldingTime
            },
            new()
            {
                Parameter = "Общее время сварки, мин",
                Value = weldingTime,
                ValuePercentages = 100
            }
        };

        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add(
                "Отчет об отклонениях от нормативных параметров режимов сварки"
            );

            CreateHeader(worksheet, documentInfo.TitleText);

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
        List<TableReportModel> chartData
    )
    {
        worksheet.Cells[HeaderStartRow, TextInfoColumn].Value = "Параметры режима сварки";
        worksheet.Cells[HeaderStartRow, DataColumn].Value =
            "Суммарное время выхода параметров за пределы допустимых значений, мин.";
        worksheet.Cells[HeaderStartRow, DataPercentageColumn].Value =
            "Суммарное время выхода параметров за пределы допустимых значений, %";

        worksheet.Column(DataColumn).Width = 22;
        worksheet.Column(DataPercentageColumn).Width = 22;

        using (var rangeHeaders =
               worksheet.Cells[HeaderStartRow, TextInfoColumn, HeaderStartRow, DataPercentageColumn])
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

        var range = worksheet.Cells[DataStartRow, TextInfoColumn].LoadFromCollection(chartData, false);

        range.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Left.Style = ExcelBorderStyle.Thin;

        worksheet.Column(TextInfoColumn).AutoFit();

        using (var rangeData = worksheet.Cells[DataStartRow, DataColumn, chartData.Count + HeaderStartRow,
                   DataPercentageColumn])
        {
            rangeData.Style.Numberformat.Format = "#,##0.00";
            rangeData.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeData.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        }
    }

    private void CreateChartForParameterDeviations(
        ExcelWorksheet worksheet,
        List<TableReportModel> chartData
    )
    {
        var pieChart = worksheet.Drawings.AddPieChart("Chart1", ePieChartType.Pie3D);

        pieChart.SetPosition(chartData.Count + HeaderStartRow + 1, 0, 0, 0);
        pieChart.SetSize(600, 400);

        pieChart.Legend.Position = eLegendPosition.Bottom;

        var pieSeries = pieChart.Series.Add(
            worksheet.Cells[DataStartRow, DataPercentageColumn, chartData.Count + HeaderStartRow - 1,
                DataPercentageColumn],
            worksheet.Cells[DataStartRow, TextInfoColumn, chartData.Count + HeaderStartRow - 1, TextInfoColumn]
        );
        pieSeries.DataLabel.ShowPercent = true;
        pieSeries.DataLabel.ShowLeaderLines = true;
        pieSeries.DataLabel.Position = eLabelPosition.Center;
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