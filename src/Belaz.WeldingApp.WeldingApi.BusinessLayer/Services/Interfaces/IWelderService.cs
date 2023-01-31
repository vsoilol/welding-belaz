using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWelderService
{
    Task<List<WelderDto>> GetAllAsync();

    Task<Result<WelderDto>> CreateAsync(CreateWelderRequest request);

    Task<Result<WelderDto>> UpdateAsync(UpdateWelderRequest request);
}