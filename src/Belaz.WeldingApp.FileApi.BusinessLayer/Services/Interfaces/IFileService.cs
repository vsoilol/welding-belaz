using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IFileService
{
    Task<DocumentDto> GenerateSeamPassportAsync();
}