using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWelderManager
{
    Task<List<WelderDto>> GetAllAsync();
}
