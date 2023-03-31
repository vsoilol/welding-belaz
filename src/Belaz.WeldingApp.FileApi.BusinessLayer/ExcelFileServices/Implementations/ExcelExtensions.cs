using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using OfficeOpenXml;
using OfficeOpenXml.Drawing.Chart;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class ExcelExtensions : IExcelExtensions
{
    public void AutoFitMergedColumns(
        ExcelWorksheet worksheet,
        string text,
        int row,
        int columnStart,
        int columnEnd
    )
    {
        worksheet.Cells[row, columnStart].Value = text;

        var startColumn = worksheet.Column(columnStart);

        startColumn.AutoFit();

        var startColumnWidth = startColumn.Width;

        var columnCount = columnEnd - columnStart + 1;

        worksheet.Cells[row, columnStart, row, columnEnd].Merge = true;

        var newColumnWidth = startColumnWidth / columnCount;

        for (int i = columnStart; i <= columnEnd; i++)
        {
            worksheet.Column(i).Width = newColumnWidth;
        }
    }

    public void CreatePie3DExcelChart(
        ExcelWorksheet worksheet,
        List<TableReportModel> tableReportModels,
        string name,
        int positionRows,
        int positionColumns,
        ExcelRange series,
        ExcelRange xSeries
    )
    {
        var pieChart2 = worksheet.Drawings.AddPieChart(name, ePieChartType.Pie3D);

        pieChart2.SetPosition(positionRows, 0, positionColumns, 0);
        pieChart2.SetSize(600, 400);

        pieChart2.Legend.Position = eLegendPosition.Bottom;

        var pieSeries2 = pieChart2.Series.Add(series, xSeries);
        pieSeries2.DataLabel.ShowPercent = true;
        pieSeries2.DataLabel.ShowLeaderLines = true;
        pieSeries2.DataLabel.Position = eLabelPosition.Center;
    }
}
