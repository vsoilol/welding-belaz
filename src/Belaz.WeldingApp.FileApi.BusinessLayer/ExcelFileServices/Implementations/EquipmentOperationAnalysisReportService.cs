using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class EquipmentOperationAnalysisReportService
    : IExcelFileService<DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>>
{
    private const int ColumnWidth = 20;
    
    private const int TitleRow = 1;
    private const int HeaderStartRow = 2;
    private const int HeaderEndRow = 3;
    private const int DataStartRow = 4;
    
    private const int StateColumn = 1;
    private const int OffTimeMinutesColumn = 2;
    private const int OffTimePercentageColumn = 3;
    private const int OnTimeMinutesColumn = 4;
    private const int OnTimePercentageColumn = 5;
    private const int WorkTimeMinutesColumn = 6;
    private const int WorkTimePercentageColumn = 7;
    private const int DowntimeMinutesColumn = 8;
    private const int DowntimePercentageColumn = 9;
    private const int TotalMinutesColumn = 10;
    
    private const string OffStateName = "Св. аппарат ВЫКЛЮЧЕН";
    private const string OnStateName = "Св. аппарат ВКЛЮЧЕН";
    private const string WeldingStateName = "СВАРКА";
    private const string DowntimeStateName = "Вынужденный простой";
    private const string TotalTimeColumnName = "Общий фонд рабочего времени";
    private const string MinutesColumnName = "Минут";
    private const string PercentageColumnName = "%";

    private readonly IExcelExtensions _excelExtensions;

    public EquipmentOperationAnalysisReportService(IExcelExtensions excelExtensions)
    {
        _excelExtensions = excelExtensions;
    }

    public async Task<DocumentDto> GenerateReportAsync(
        DocumentInfo<List<EquipmentOperationTimeWithShiftDto>> data
    )
    {
        var content = new MemoryStream();

        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Анализ работы оборудования");
            
            CreateHeader(worksheet, data.TitleText);

            CreateTable(worksheet, data.Data);

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
        int row = DataStartRow;
        foreach (var stateData in data)
        {
            var allMinutes =
                stateData.OffTimeMinutes
                + stateData.OnTimeMinutes
                + stateData.WorkTimeMinutes
                + stateData.DowntimeMinutes;

            AddShiftLabel(worksheet, row, stateData.CutInfo);

            worksheet.Cells[row, OffTimeMinutesColumn].Value = stateData.OffTimeMinutes;
            worksheet.Cells[row, OffTimePercentageColumn].Value = MathExtension.CalculatePercentage(
                allMinutes,
                stateData.OffTimeMinutes
            );

            worksheet.Cells[row, OnTimeMinutesColumn].Value = stateData.OnTimeMinutes;
            worksheet.Cells[row, OnTimePercentageColumn].Value = MathExtension.CalculatePercentage(
                allMinutes,
                stateData.OnTimeMinutes
            );

            worksheet.Cells[row, WorkTimeMinutesColumn].Value = stateData.WorkTimeMinutes;
            worksheet.Cells[row, WorkTimePercentageColumn].Value =
                MathExtension.CalculatePercentage(allMinutes, stateData.WorkTimeMinutes);

            worksheet.Cells[row, DowntimeMinutesColumn].Value = stateData.DowntimeMinutes;
            worksheet.Cells[row, DowntimePercentageColumn].Value =
                MathExtension.CalculatePercentage(allMinutes, stateData.DowntimeMinutes);

            worksheet.Cells[row, TotalMinutesColumn].Value = allMinutes;

            SetStylesToDataCells(worksheet, row);

            row++;
        }
    }

    private void SetStylesToDataCells(ExcelWorksheet worksheet, int row)
    {
        for (int i = OffTimeMinutesColumn; i <= TotalMinutesColumn; i++)
        {
            worksheet.Cells[row, i].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.Cells[row, i].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            worksheet.Cells[row, i].Style.Border.BorderAround(ExcelBorderStyle.Thin);
        }

        worksheet.Cells[row, OffTimeMinutesColumn, row, TotalMinutesColumn]
            .Style
            .Numberformat
            .Format = "#,##0.00";
    }

    private void CreateTableHeader(ExcelWorksheet worksheet)
    {
        worksheet.Cells[HeaderStartRow, StateColumn].Value = "Состояние";
        worksheet.Cells[HeaderStartRow, StateColumn, HeaderEndRow, StateColumn].Merge = true;
        worksheet.Column(StateColumn).Width = ColumnWidth;

        _excelExtensions.AutoFitMergedColumns(
            worksheet,
            OffStateName,
            HeaderStartRow,
            OffTimeMinutesColumn,
            OffTimePercentageColumn
        );
        _excelExtensions.AutoFitMergedColumns(
            worksheet,
            OnStateName,
            HeaderStartRow,
            OnTimeMinutesColumn,
            OnTimePercentageColumn
        );
        _excelExtensions.AutoFitMergedColumns(
            worksheet,
            WeldingStateName,
            HeaderStartRow,
            WorkTimeMinutesColumn,
            WorkTimePercentageColumn
        );
        _excelExtensions.AutoFitMergedColumns(
            worksheet,
            DowntimeStateName,
            HeaderStartRow,
            DowntimeMinutesColumn,
            DowntimePercentageColumn
        );

        worksheet.Cells[HeaderStartRow, TotalMinutesColumn].Value = TotalTimeColumnName;

        worksheet.Column(TotalMinutesColumn).AutoFit();

        worksheet.Columns[WorkTimeMinutesColumn, WorkTimePercentageColumn].Width = 9;

        worksheet.Cells[HeaderEndRow, OffTimeMinutesColumn].Value = MinutesColumnName;
        worksheet.Cells[HeaderEndRow, OffTimePercentageColumn].Value = PercentageColumnName;

        worksheet.Cells[HeaderEndRow, OnTimeMinutesColumn].Value = MinutesColumnName;
        worksheet.Cells[HeaderEndRow, OnTimePercentageColumn].Value = PercentageColumnName;

        worksheet.Cells[HeaderEndRow, WorkTimeMinutesColumn].Value = MinutesColumnName;
        worksheet.Cells[HeaderEndRow, WorkTimePercentageColumn].Value = PercentageColumnName;

        worksheet.Cells[HeaderEndRow, DowntimeMinutesColumn].Value = MinutesColumnName;
        worksheet.Cells[HeaderEndRow, DowntimePercentageColumn].Value = PercentageColumnName;

        worksheet.Cells[HeaderEndRow, TotalMinutesColumn].Value = MinutesColumnName;

        using (
            var rangeHeaders = worksheet.Cells[
                HeaderStartRow,
                StateColumn,
                HeaderEndRow,
                TotalMinutesColumn
            ]
        )
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

    private void AddShiftLabel(ExcelWorksheet worksheet, int row, string cutInfo)
    {
        worksheet.Cells[row, StateColumn].Value = cutInfo;

        worksheet.Cells[row, StateColumn].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
        worksheet.Cells[row, StateColumn].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        worksheet.Cells[row, StateColumn].Style.Border.BorderAround(ExcelBorderStyle.Thin);
    }
    
    private void CreateHeader(ExcelWorksheet worksheet, string[] titles)
    {
        using (var rangeHeaders =
               worksheet.Cells[TitleRow, StateColumn, TitleRow, TotalMinutesColumn])
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
