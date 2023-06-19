using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;

public class ProductAccountInfoExcelFileService : IExcelFileService<List<ProductAccountInfoExcelModel>>
{
    private const int TitleRow = 1;
    private const int DataStartRow = 2;

    private const int ProductIndexColumn = 1;
    private const int DetailNumberColumn = 2;
    private const int SuffixColumn = 3;
    private const int DateColumn = 4;
    private const int AmountFromPlanColumn = 5;
    private const int AmountAcceptColumn = 6;
    private const int AmountDefectiveColumn = 7;
    private const int AmountManufacturedColumn = 8;
    private const int WorkshopColumn = 9;
    private const int ProductionAreaColumn = 10;

    public async Task<DocumentDto> GenerateReportAsync(List<ProductAccountInfoExcelModel> data)
    {
        var content = new MemoryStream();
        
        using (var package = new ExcelPackage(content))
        {
            var worksheet = package.Workbook.Worksheets.Add("Учёт продукции");
            
            CreateHeader(worksheet);

            CreateTable(worksheet, data);

            await package.SaveAsync();
        }

        return new DocumentDto
        {
            Bytes = content.ToArray(),
            FileName = "Учёт продукции.xlsx",
            FileType = FileTypes.ExcelType
        };
    }
    
    private void CreateHeader(ExcelWorksheet worksheet)
    {
        using (var rangeHeaders =
               worksheet.Cells[TitleRow, ProductIndexColumn, TitleRow, ProductionAreaColumn])
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
    }
    
    private void CreateTable(ExcelWorksheet worksheet, List<ProductAccountInfoExcelModel> data)
    {
        worksheet.Cells[TitleRow, ProductIndexColumn].Value = "Индекс";
        worksheet.Cells[TitleRow, DetailNumberColumn].Value = "Деталь";
        worksheet.Cells[TitleRow, SuffixColumn].Value = "Суффикс";
        worksheet.Cells[TitleRow, DateColumn].Value = "Дата";
        worksheet.Cells[TitleRow, AmountFromPlanColumn].Value = "План";
        worksheet.Cells[TitleRow, AmountAcceptColumn].Value = "Принято";
        worksheet.Cells[TitleRow, AmountDefectiveColumn].Value = "Забраковано";
        worksheet.Cells[TitleRow, AmountManufacturedColumn].Value = "Изготовлено";
        worksheet.Cells[TitleRow, WorkshopColumn].Value = "Цех-получатель";
        worksheet.Cells[TitleRow, ProductionAreaColumn].Value = "Производственный участок";
        
        worksheet.Column(WorkshopColumn).Width = 15;
        worksheet.Column(ProductionAreaColumn).Width = 26;
        worksheet.Column(AmountFromPlanColumn).Width = 14;
        worksheet.Column(AmountAcceptColumn).Width = 14;
        worksheet.Column(AmountDefectiveColumn).Width = 14;
        worksheet.Column(AmountManufacturedColumn).Width = 14;
        worksheet.Column(DateColumn).Width = 14;
        worksheet.Column(ProductIndexColumn).Width = 20;
        worksheet.Column(DetailNumberColumn).Width = 20;
        worksheet.Column(SuffixColumn).Width = 20;

        var range = worksheet.Cells[DataStartRow, ProductIndexColumn].LoadFromCollection(data, false);

        worksheet.Cells[DataStartRow, DateColumn, data.Count + TitleRow, DateColumn]
            .Style
            .Numberformat
            .Format = "dd.mm.YYYY";

        range.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Top.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
        range.Style.Border.Left.Style = ExcelBorderStyle.Thin;
    }
}