using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Post;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Post;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class PostManager : IPostManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Post> _postRepository;

    public PostManager(IMapper mapper, EntityFrameworkRepository<Post> postRepository)
    {
        _mapper = mapper;
        _postRepository = postRepository;
    }

    public async Task<List<PostDto>> GetAllAsync()
    {
        return await _postRepository
            .AsQueryable()
            .ProjectTo<PostDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
    
    public async Task<PostDto?> GetByIdAsync(Guid id)
    {
        return await _postRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<PostDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<PostDto?> CreateAsync(CreatePostRequest request)
    {
        var post = _mapper.Map<Post>(request);
        
        var createdPost = _postRepository.Add(post);
        await _postRepository.SaveAsync();

        return await _postRepository
            .GetByIdAsQueryable(createdPost.Id)
            .ProjectTo<PostDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<bool> UpdateAsync(UpdatePostRequest request)
    {
        var productionArea = _mapper.Map<Post>(request);
        return _postRepository.UpdateAsync(productionArea);
    }
}