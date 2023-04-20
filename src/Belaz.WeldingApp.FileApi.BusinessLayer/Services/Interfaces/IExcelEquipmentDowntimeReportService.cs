using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IExcelEquipmentDowntimeReportService
{
    Task<Result<DocumentDto>> GenerateExcelEquipmentDowntimeReportAsync(
        GenerateExcelEquipmentDowntimeReportRequest request
    );
}