using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Seam;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface ISeamIntegrationApi
{
    Task<List<SeamDto>> GetAllByTaskStatusAsync(Status status);

    Task<SeamDto?> GetByIdAsync(Guid id);
}
