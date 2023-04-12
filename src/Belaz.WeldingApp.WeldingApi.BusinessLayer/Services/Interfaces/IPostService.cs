using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IPostService
{
    Task<List<PostDto>> GetAllAsync();

    Task<Result<PostDto>> GetByIdAsync(GetPostByIdRequest request);

    Task<Result<PostDto>> CreateAsync(CreatePostRequest request);

    Task<Result<PostDto>> UpdateAsync(UpdatePostRequest request);

    Task<Result<Unit>> DeleteAsync(DeletePostRequest request);
}
