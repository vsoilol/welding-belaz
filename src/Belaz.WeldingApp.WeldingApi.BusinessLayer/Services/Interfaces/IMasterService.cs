using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Master;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IMasterService
{
    Task<List<MasterDto>> GetAllAsync();

    Task<Result<MasterDto>> CreateAsync(CreateMasterRequest request);

    Task<Result<MasterDto>> UpdateAsync(UpdateMasterRequest request);
}