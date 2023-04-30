using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IPostService
{
    Task<BaseRequest<List<PostDto>>> GetAllAsync();

    Task<BaseResultRequest<PostDto>> GetByIdAsync(GetPostByIdRequest request);

    Task<BaseResultRequest<PostDto>> CreateAsync(CreatePostRequest request);

    Task<BaseResultRequest<PostDto>> UpdateAsync(UpdatePostRequest request);

    Task<BaseResultRequest<Unit>> DeleteAsync(DeletePostRequest request);
}
