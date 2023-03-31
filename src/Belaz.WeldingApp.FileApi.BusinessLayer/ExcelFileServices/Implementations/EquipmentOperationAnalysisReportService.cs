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
    private const int ColumnWidth = 20;
    private const int HeaderStartRow = 1;
    private const int HeaderEndRow = 2;
    private const int DataStartRow = 3;
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
    private const string ShiftLabelFormat = "Смена {0}";

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
        int row = DataStartRow;
        foreach (var stateData in data)
        {
            var allMinutes =
                stateData.OffTimeMinutes
                + stateData.OnTimeMinutes
                + stateData.WorkTimeMinutes
                + stateData.DowntimeMinutes;

            AddShiftLabel(worksheet, row, stateData.WorkingShifNumber);

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

        worksheet.Cells[row, OffTimePercentageColumn].Style.Numberformat.Format = "#,##0.00";
        worksheet.Cells[row, OnTimePercentageColumn].Style.Numberformat.Format = "#,##0.00";
        worksheet.Cells[row, WorkTimePercentageColumn].Style.Numberformat.Format = "#,##0.00";
        worksheet.Cells[row, DowntimePercentageColumn].Style.Numberformat.Format = "#,##0.00";
    }

    private void CreateTableHeader(ExcelWorksheet worksheet)
    {
        worksheet.Cells[HeaderStartRow, StateColumn].Value = "Состояние";
        worksheet.Cells[HeaderStartRow, StateColumn, HeaderEndRow, StateColumn].Merge = true;
        worksheet.Column(StateColumn).Width = ColumnWidth;

        _excelExtensions.AutoFitMergedColumns(
            worksheet,
            OffStateName,
            StateColumn,
            OffTimeMinutesColumn,
            OffTimePercentageColumn
        );
        _excelExtensions.AutoFitMergedColumns(
            worksheet,
            OnStateName,
            StateColumn,
            OnTimeMinutesColumn,
            OnTimePercentageColumn
        );
        _excelExtensions.AutoFitMergedColumns(
            worksheet,
            WeldingStateName,
            StateColumn,
            WorkTimeMinutesColumn,
            WorkTimePercentageColumn
        );
        _excelExtensions.AutoFitMergedColumns(
            worksheet,
            DowntimeStateName,
            StateColumn,
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

    private void AddShiftLabel(ExcelWorksheet worksheet, int row, int shiftNumber)
    {
        var shiftLabel = string.Format(ShiftLabelFormat, shiftNumber);
        worksheet.Cells[row, StateColumn].Value = shiftLabel;

        worksheet.Cells[row, StateColumn].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
        worksheet.Cells[row, StateColumn].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
        worksheet.Cells[row, StateColumn].Style.Border.BorderAround(ExcelBorderStyle.Thin);
    }
}
