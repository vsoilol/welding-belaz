using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class PostService : IPostService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IPostRepository _postRepository;

    public PostService(
        IValidationService validationService,
        IMapper mapper,
        IPostRepository postRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _postRepository = postRepository;
    }

    public Task<List<PostDto>> GetAllAsync()
    {
        return _postRepository.GetAllAsync();
    }

    public async Task<Result<PostDto>> GetByIdAsync(GetPostByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() => _postRepository.GetByIdAsync(request.Id));
    }

    public async Task<Result<PostDto>> CreateAsync(CreatePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var post = _mapper.Map<Post>(request);

            return _postRepository.CreateAsync(post);
        });
    }

    public async Task<Result<PostDto>> UpdateAsync(UpdatePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var post = _mapper.Map<Post>(request);

            return _postRepository.UpdateAsync(post);
        });
    }

    public async Task<Result<Unit>> DeleteAsync(DeletePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _postRepository.DeleteAsync(request.Id);
            return Unit.Default;
        });
    }
}
