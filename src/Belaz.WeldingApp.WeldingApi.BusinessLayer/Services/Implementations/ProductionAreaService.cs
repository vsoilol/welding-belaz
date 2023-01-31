using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ProductionAreaService : IProductionAreaService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IProductionAreaRepository _productionAreaRepository;

    public ProductionAreaService(IValidationService validationService, IMapper mapper,
        IProductionAreaRepository productionAreaRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _productionAreaRepository = productionAreaRepository;
    }

    public Task<List<ProductionAreaDto>> GetAllAsync()
    {
        return _productionAreaRepository.GetAllAsync();
    }

    public async Task<Result<ProductionAreaDto>> GetByIdAsync(GetProductionAreaByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() => _productionAreaRepository.GetByIdAsync(request.Id));
    }

    public async Task<Result<ProductionAreaDto>> CreateAsync(CreateProductionAreaRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);
        
        return await validationResult.ToDataResult(() =>
        {
            var productionArea = _mapper.Map<ProductionArea>(request);

            return _productionAreaRepository.CreateAsync(productionArea);
        });
    }

    public async Task<Result<ProductionAreaDto>> UpdateAsync(UpdateProductionAreaRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);
        
        return await validationResult.ToDataResult(() =>
        {
            var productionArea = _mapper.Map<ProductionArea>(request);

            return _productionAreaRepository.UpdateAsync(productionArea);
        });
    }
}