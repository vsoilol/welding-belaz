using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Master;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IMasterService
{
    Task<BaseRequest<List<MasterDto>>> GetAllAsync();

    Task<BaseResultRequest<MasterDto>> CreateAsync(CreateMasterRequest request);

    Task<BaseResultRequest<MasterDto>> UpdateAsync(UpdateMasterRequest request);

    Task<BaseResultRequest<Unit>> DeleteAsync(DeleteMasterRequest request);
}
