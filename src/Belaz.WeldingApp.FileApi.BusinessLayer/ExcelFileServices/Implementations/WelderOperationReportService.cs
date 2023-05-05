using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class WelderOperationReportService : IExcelFileService<DocumentInfo<WelderOperationTimeDto>>
{
    private const int TitleRow = 1;

    private const int StateColumn = 1;
    private const int TimeColumn = 2;
    private const int PercentageColumn = 3;

    private const int HeaderStartRow = 2;
    private const int DataStartRow = 3;
    private const int AverageEstimationRow = HeaderStartRow + 5;

    private const int ColumnWidth = 22;
    private readonly IExcelExtensions _excelExtensions;

    public WelderOperationReportService(IExcelExtensions excelExtensions)
    {
        _excelExtensions = excelExtensions;
    }

    public async Task<DocumentDto> GenerateReportAsync(DocumentInfo<WelderOperationTimeDto> data)
    {
        var tableReportModels = GetReportModels(data.Data);

        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Отчет о работе сварщиков");
            
            CreateHeader(worksheet, data.TitleText);

            CreateTable(worksheet, tableReportModels);

            AddAverageEstimation(worksheet, data.Data.AverageEstimation);

            CreateChart(worksheet, tableReportModels);

            await package.SaveAsync();
        }

        return new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Отчет о работе сварщиков.xlsx",
            FileType = FileTypes.ExcelType
        };
    }

    private void AddAverageEstimation(ExcelWorksheet worksheet, double averageEstimation)
    {
        worksheet.Cells[AverageEstimationRow, StateColumn].Value = "Средняя оценка за период:";
        worksheet.Cells[AverageEstimationRow, StateColumn, AverageEstimationRow, TimeColumn].Merge =
            true;

        worksheet.Cells[AverageEstimationRow, PercentageColumn].Value = averageEstimation;

        worksheet.Cells[AverageEstimationRow, StateColumn, AverageEstimationRow, PercentageColumn]
            .Style
            .Font
            .Bold = true;

        worksheet.Cells[AverageEstimationRow, PercentageColumn].Style.Numberformat.Format =
            "#,##0.00";
        worksheet.Cells[AverageEstimationRow, PercentageColumn].Style.HorizontalAlignment =
            ExcelHorizontalAlignment.Center;
    }

    private void CreateChart(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        _excelExtensions.CreatePie3DExcelChart(
            worksheet,
            tableReportModels,
            "Chart1",
            tableReportModels.Count + HeaderStartRow + 2,
            0,
            worksheet.Cells[DataStartRow, PercentageColumn, tableReportModels.Count + HeaderStartRow - 1,
                PercentageColumn],
            worksheet.Cells[DataStartRow, StateColumn, tableReportModels.Count + HeaderStartRow - 1, StateColumn]
        );
    }

    private void CreateTable(ExcelWorksheet worksheet, List<TableReportModel> tableReportModels)
    {
        worksheet.Cells[HeaderStartRow, StateColumn].Value = "Состояние";
        worksheet.Cells[HeaderStartRow, TimeColumn].Value = "Время, мин";
        worksheet.Cells[HeaderStartRow, PercentageColumn].Value = "%";

        worksheet.Column(TimeColumn).Width = ColumnWidth;
        worksheet.Column(PercentageColumn).Width = ColumnWidth;

        using (
            var rangeHeaders = worksheet.Cells[
                HeaderStartRow,
                StateColumn,
                HeaderStartRow,
                PercentageColumn
            ]
        )
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

        var range = worksheet.Cells[DataStartRow, StateColumn].LoadFromCollection(
            tableReportModels,
            false
        );

        range.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Left.Style = ExcelBorderStyle.Thin;

        worksheet.Column(StateColumn).AutoFit();

        using (
            var rangeData = worksheet.Cells[
                DataStartRow,
                TimeColumn,
                tableReportModels.Count + HeaderStartRow,
                PercentageColumn
            ]
        )
        {
            rangeData.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            rangeData.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            rangeData.Style.Numberformat.Format = "#,##0.00";
        }
    }

    private List<TableReportModel> GetReportModels(WelderOperationTimeDto data)
    {
        var allTime =
            data.WeldingPreparationTimeMinutes + data.WorkTimeMinutes + data.DowntimeMinutes;

        return new List<TableReportModel>
        {
            new()
            {
                Parameter = "Подготовка к сварке",
                Value = data.WeldingPreparationTimeMinutes,
                ValuePercentages = MathExtension.CalculatePercentage(
                    allTime,
                    data.WeldingPreparationTimeMinutes
                )
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
    
    private void CreateHeader(ExcelWorksheet worksheet, string[] titles)
    {
        using (var rangeHeaders =
               worksheet.Cells[TitleRow, StateColumn, TitleRow, PercentageColumn])
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

        worksheet.Cells[TitleRow, StateColumn].Value = string.Join("\n", titles);

        var textRow = worksheet.Row(TitleRow);
        textRow.Height = 15 * titles.Length;
    }
}