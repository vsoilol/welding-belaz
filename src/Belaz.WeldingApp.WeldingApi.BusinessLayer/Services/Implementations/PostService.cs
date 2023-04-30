using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.Common.Entities.Production;
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

        if (!validationResult.IsValid)
        {
            return new Result<PostDto>(validationResult.Exception);
        }

        return await _postRepository.GetByIdAsync(request.Id);
    }

    public async Task<Result<PostDto>> CreateAsync(CreatePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<PostDto>(validationResult.Exception);
        }

        var post = _mapper.Map<Post>(request);

        return await _postRepository.CreateAsync(post);
    }

    public async Task<Result<PostDto>> UpdateAsync(UpdatePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<PostDto>(validationResult.Exception);
        }

        var post = _mapper.Map<Post>(request);

        return await _postRepository.UpdateAsync(post);
    }

    public async Task<Result<Unit>> DeleteAsync(DeletePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _postRepository.DeleteAsync(request.Id);
        return Unit.Default;
    }
}
