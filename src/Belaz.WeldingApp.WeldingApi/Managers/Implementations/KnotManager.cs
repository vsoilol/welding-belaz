using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Knot;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class KnotManager : IKnotManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Knot> _knotRepository;

    public KnotManager(IMapper mapper, EntityFrameworkRepository<Knot> knotRepository)
    {
        _mapper = mapper;
        _knotRepository = knotRepository;
    }
    
    public async Task<List<KnotDto>> GetAllByWeldingTaskStatus(Status status)
    {
        return await _knotRepository
            .AsQueryable()
            .Where(_ => _.WeldingTask.Status == status)
            .ProjectTo<KnotDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<KnotDto?> GetByIdAsync(Guid id)
    {
        return await _knotRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<KnotDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }
}