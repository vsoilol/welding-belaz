using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
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

    public async Task<BaseRequest<List<PostDto>>> GetAllAsync()
    {
        var data = await _postRepository.GetAllAsync();

        var message = $"Получение всех постов";

        return new BaseRequest<List<PostDto>>(data, message);
    }

    public async Task<BaseResultRequest<PostDto>> GetByIdAsync(GetPostByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<PostDto>(validationResult.Exception);
            return new BaseResultRequest<PostDto>(result);
        }

        var data = await _postRepository.GetByIdAsync(request.Id);
        var message = $"Получение инофрмации о посте. Наименование: {data.Name} Номер: {data.Number}";

        return new BaseResultRequest<PostDto>(data, message);
    }

    public async Task<BaseResultRequest<PostDto>> CreateAsync(CreatePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<PostDto>(validationResult.Exception);
            return new BaseResultRequest<PostDto>(result);
        }

        var post = _mapper.Map<Post>(request);

        var data = await _postRepository.CreateAsync(post);
        var message = $"Создание нового поста. Наименование: {data.Name} Номер: {data.Number}";

        return new BaseResultRequest<PostDto>(data, message);
    }

    public async Task<BaseResultRequest<PostDto>> UpdateAsync(UpdatePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<PostDto>(validationResult.Exception);
            return new BaseResultRequest<PostDto>(result);
        }

        var post = _mapper.Map<Post>(request);

        var data = await _postRepository.UpdateAsync(post);
        var message = $"Обновление информации о посте. Наименование: {data.Name} Номер: {data.Number}";

        return new BaseResultRequest<PostDto>(data, message);
    }

    public async Task<BaseResultRequest<Unit>> DeleteAsync(DeletePostRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<Unit>(validationResult.Exception);
            return new BaseResultRequest<Unit>(result);
        }

        var post = await _postRepository.GetByIdAsync(request.Id);
        await _postRepository.DeleteAsync(request.Id);

        var message = $"Удаление поста. Наименование: {post.Name} Номер: {post.Number}";

        return new BaseResultRequest<Unit>(Unit.Default, message);
    }
}
