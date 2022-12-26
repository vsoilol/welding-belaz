using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Detail;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IDetailIntegrationApi
{
    Task<List<DetailDto>> GetAllByTaskStatusAsync(Status status);

    Task<DetailDto?> GetByIdAsync(Guid id);
}
