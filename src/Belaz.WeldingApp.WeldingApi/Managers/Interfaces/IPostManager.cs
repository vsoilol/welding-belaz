using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Post;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Post;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IPostManager
{
    Task<List<PostDto>> GetAllAsync();
    
    Task<PostDto?> GetByIdAsync(Guid id);
    
    Task<PostDto?> CreateAsync(CreatePostRequest request);
    
    Task<bool> UpdateAsync(UpdatePostRequest request);
}