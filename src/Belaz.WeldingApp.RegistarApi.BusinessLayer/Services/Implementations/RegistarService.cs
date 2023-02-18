using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Implementations;

public class RegistarService : IRegistarService
{
    public Task<Result<WelderWithEquipmentDto>> GetWelderWithEquipmentAsync(GetWelderWithEquipmentRequest request)
    {
        throw new NotImplementedException();
    }

    public Task<Result<Unit>> CreateRecordWithoutTaskAsync(RecordWithoutTaskRequest request)
    {
        throw new NotImplementedException();
    }
}