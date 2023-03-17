using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;

public class GenerateExcelDeviationReportByProductionAreaRequest
    : GenerateExcelDeviationReportRequest
{
    public Guid ProductionAreaId { get; set; }
}
