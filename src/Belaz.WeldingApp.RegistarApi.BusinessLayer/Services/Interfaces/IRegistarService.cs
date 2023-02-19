using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;

public interface IRegistarService
{
    Task<Result<WelderWithEquipmentResponse>> GetWelderWithEquipmentAsync(GetWelderWithEquipmentRequest request);

    Task<Result<Unit>> CreateRecordWithoutTaskAsync(RecordWithoutTaskRequest request);
}