using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IInspectorService
{
    Task<List<InspectorDto>> GetAllAsync();

    Task<Result<InspectorDto>> CreateAsync(CreateInspectorRequest request);

    Task<Result<InspectorDto>> UpdateAsync(UpdateInspectorRequest request);
}