using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;

public interface IExcelFileService<T>
{
    Task<DocumentDto> GenerateReportAsync(T data);
}
