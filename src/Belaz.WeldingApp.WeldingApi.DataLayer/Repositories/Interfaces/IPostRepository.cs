using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.Common.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IPostRepository
{
    Task<List<PostDto>> GetAllAsync();

    Task<PostDto> GetByIdAsync(Guid id);

    Task<PostDto> CreateAsync(Post entity);

    Task<PostDto> UpdateAsync(Post entity);

    Task DeleteAsync(Guid id);
}
