using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ProductionAreaService : IProductionAreaService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IProductionAreaRepository _productionAreaRepository;

    public ProductionAreaService(
        IValidationService validationService,
        IMapper mapper,
        IProductionAreaRepository productionAreaRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _productionAreaRepository = productionAreaRepository;
    }

    public async Task<BaseRequest<List<ProductionAreaDto>>> GetAllAsync()
    {
        var result = await _productionAreaRepository.GetAllAsync();

        return new BaseRequest<List<ProductionAreaDto>>(result, "Получение всех производственных участков");
    }

    public async Task<BaseResultRequest<ProductionAreaDto>> GetByIdAsync(GetProductionAreaByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new BaseResultRequest<ProductionAreaDto>(new Result<ProductionAreaDto>(validationResult.Exception));
        }

        var data = await _productionAreaRepository.GetByIdAsync(request.Id);

        return new BaseResultRequest<ProductionAreaDto>(data,
            $"Получение информации о производственном участке. Номер: {data.Number}, Наименование: {data.Name}");
    }

    public async Task<Result<ProductionAreaDto>> CreateAsync(CreateProductionAreaRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductionAreaDto>(validationResult.Exception);
        }

        var productionArea = _mapper.Map<ProductionArea>(request);

        return await _productionAreaRepository.CreateAsync(productionArea);
    }

    public async Task<Result<ProductionAreaDto>> UpdateAsync(UpdateProductionAreaRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductionAreaDto>(validationResult.Exception);
        }

        var productionArea = _mapper.Map<ProductionArea>(request);

        return await _productionAreaRepository.UpdateAsync(productionArea);
    }

    public async Task<Result<ProductionAreaDto>> DeleteAsync(DeleteProductionAreaRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductionAreaDto>(validationResult.Exception);
        }

        return await _productionAreaRepository.DeleteAsync(request.Id);
    }
}