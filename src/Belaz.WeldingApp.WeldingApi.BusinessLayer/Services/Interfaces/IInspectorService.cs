using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IInspectorService
{
    Task<BaseRequest<List<InspectorDto>>> GetAllAsync();

    Task<BaseResultRequest<InspectorDto>> CreateAsync(CreateInspectorRequest request);

    Task<BaseResultRequest<InspectorDto>> UpdateAsync(UpdateInspectorRequest request);

    Task<BaseResultRequest<Unit>> DeleteAsync(DeleteInspectorRequest request);
}
