using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

internal class SeamRepository : ISeamRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public SeamRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }
    
    public Task<SeamBriefDto> GetBriefInfoByIdAsync(Guid id)
    {
        return _context.Seams.Where(_ => _.Id == id)
            .ProjectTo<SeamBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}