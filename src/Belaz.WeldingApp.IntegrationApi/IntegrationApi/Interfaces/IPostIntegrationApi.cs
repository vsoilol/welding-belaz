using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Post;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IPostIntegrationApi
{
    Task<List<PostDto>> GetAllAsync();

    Task<PostDto?> GetByIdAsync(Guid id);
}
