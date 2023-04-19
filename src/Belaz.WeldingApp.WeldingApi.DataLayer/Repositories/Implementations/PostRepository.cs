using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.Common.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class PostRepository : IPostRepository
{
    private readonly IMapper _mapper;
    private readonly ApplicationContext _context;

    public PostRepository(IMapper mapper, ApplicationContext context)
    {
        _mapper = mapper;
        _context = context;
    }

    public Task<List<PostDto>> GetAllAsync()
    {
        return _context.Posts.ProjectTo<PostDto>(_mapper.ConfigurationProvider).ToListAsync();
    }

    public Task<PostDto> GetByIdAsync(Guid id)
    {
        return _context.Posts
            .Where(_ => _.Id == id)
            .ProjectTo<PostDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<PostDto> CreateAsync(Post entity)
    {
        var newPost = _context.Posts.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newPost.Id);
    }

    public async Task<PostDto> UpdateAsync(Post entity)
    {
        var updatedPost = (await _context.Posts.FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedPost.Number = entity.Number;
        updatedPost.ProductionAreaId = entity.ProductionAreaId;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedWorkplaces = _context.Workplaces.Where(_ => _.PostId == id);
        _context.Workplaces.RemoveRange(deletedWorkplaces);

        var deletedPost = (await _context.Posts.FirstOrDefaultAsync(_ => _.Id == id))!;

        _context.Posts.Remove(deletedPost);
        await _context.SaveChangesAsync();
    }
}
