using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Knot;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IKnotIntegrationApi
{
    Task<List<KnotDto>> GetAllByTaskStatusAsync(Status status);

    Task<KnotDto?> GetByIdAsync(Guid id);
}
