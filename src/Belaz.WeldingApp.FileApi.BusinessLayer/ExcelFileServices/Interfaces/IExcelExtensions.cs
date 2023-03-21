using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;
using OfficeOpenXml;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;

public interface IExcelExtensions
{
    void CreatePie3DExcelChart(
        ExcelWorksheet worksheet,
        List<TableReportModel> tableReportModels,
        string name,
        int positionRows,
        int positionColumns,
        ExcelRange series,
        ExcelRange xSeries
    );
}
