using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;

public class GenerateExcelDeviationReportByProductionAreaRequest
{
    /// <summary>
    /// Id узла, детали или изделия
    /// </summary>
    public Guid ProductId { get; set; }

    public Guid? SeamId { get; set; }

    public Guid WorkshopId { get; set; }

    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
}
