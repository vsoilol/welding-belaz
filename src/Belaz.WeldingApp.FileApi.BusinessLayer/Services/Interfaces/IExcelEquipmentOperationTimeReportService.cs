using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IExcelEquipmentOperationTimeReportService
{
    Task<Result<DocumentDto>> GenerateExcelEquipmentOperationTimeReportAsync(
        GenerateExcelEquipmentOperationTimeReportRequest request
    );
}
