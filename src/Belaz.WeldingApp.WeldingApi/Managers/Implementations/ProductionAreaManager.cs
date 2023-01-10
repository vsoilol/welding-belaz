using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class ProductionAreaManager : IProductionAreaManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<ProductionArea> _productionAreaRepository;

    public ProductionAreaManager(IMapper mapper, EntityFrameworkRepository<ProductionArea> productionAreaRepository)
    {
        _mapper = mapper;
        _productionAreaRepository = productionAreaRepository;
    }

    public async Task<List<ProductionAreaDto>> GetAllAsync()
    {
        return await _productionAreaRepository
            .AsQueryable()
            .ProjectTo<ProductionAreaDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
    
    public async Task<ProductionAreaDto?> GetByIdAsync(Guid id)
    {
        return await _productionAreaRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<ProductionAreaDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<ProductionAreaDto?> CreateAsync(CreateProductionAreaRequest request)
    {
        var productionArea = _mapper.Map<ProductionArea>(request);
        
        var createdProductionArea = _productionAreaRepository.Add(productionArea);
        await _productionAreaRepository.SaveAsync();

        return await _productionAreaRepository
            .GetByIdAsQueryable(createdProductionArea.Id)
            .ProjectTo<ProductionAreaDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<ProductionAreaDto?> UpdateAsync(UpdateProductionAreaRequest request)
    {
        throw new NotImplementedException();
    }
}