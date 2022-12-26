using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Detail;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class DetailManager : IDetailManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Detail> _detailRepository;

    public DetailManager(IMapper mapper, EntityFrameworkRepository<Detail> detailRepository)
    {
        _mapper = mapper;
        _detailRepository = detailRepository;
    }
    
    public async Task<List<DetailDto>> GetAllByWeldingTaskStatus(Status status)
    {
        return await _detailRepository
            .AsQueryable()
            .Where(_ => _.WeldingTask.Status == status)
            .ProjectTo<DetailDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<DetailDto?> GetByIdAsync(Guid id)
    {
        return await _detailRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<DetailDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }
}