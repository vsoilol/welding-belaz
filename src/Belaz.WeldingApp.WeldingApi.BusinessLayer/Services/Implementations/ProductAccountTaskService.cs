using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ProductAccountTaskService : IProductAccountTaskService
{
    private readonly IProductAccountTaskRepository _productAccountTaskRepository;
    private readonly IValidationService _validationService;

    public ProductAccountTaskService(IProductAccountTaskRepository productAccountTaskRepository,
        IValidationService validationService)
    {
        _productAccountTaskRepository = productAccountTaskRepository;
        _validationService = validationService;
    }

    public async Task<List<ProductAccountTaskDto>> GetAllProductAccountTasksAsync()
    {
        var productAccountTasks = await _productAccountTaskRepository.GetAllProductAccountTasksAsync();

        var count = productAccountTasks.Count;

        for (var i = 0; i < count; i++)
        {
            productAccountTasks[i].Number = count - i;
        }

        return productAccountTasks;
    }

    public async Task<Result<Unit>> AssignProductAccountTaskToWeldingEquipmentsAsync(
        AssignProductAccountTaskToWeldingEquipmentsRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _productAccountTaskRepository.AssignProductAccountTaskToWeldingEquipmentsAsync(
            request.ProductAccountTaskId,
            request.WeldingEquipmentIds
        );
        return Unit.Default;
    }

    public async Task<Result<ProductAccountTaskDto>> ChangeEndWeldingDateAsync(ChangeEndWeldingDateRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountTaskDto>(validationResult.Exception);
        }

        return await _productAccountTaskRepository
            .ChangeEndWeldingDateAsync(request.ProductAccountTaskId,
                request.WeldingEndDate?.ToDateTime() ?? null);
    }

    public async Task<Result<ProductAccountTaskDto>> ChangeDefectiveAmountAsync(ChangeDefectiveAmountRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountTaskDto>(validationResult.Exception);
        }

        return await _productAccountTaskRepository
            .ChangeDefectiveAmountAsync(request.ProductAccountTaskId,
                request.InspectorId, request.DefectiveAmount, request.DefectiveReason);
    }

    public async Task<Result<ProductAccountTaskDto>> ChangeManufacturedAmountAsync(
        ChangeManufacturedAmountRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountTaskDto>(validationResult.Exception);
        }

        return await _productAccountTaskRepository
            .ChangeManufacturedAmountAsync(request.Id, request.ManufacturedAmount);
    }

    public async Task<Result<ProductAccountTaskDto>> UpdateWeldingMaterialInfoAsync(
        UpdateWeldingMaterialInfoRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ProductAccountTaskDto>(validationResult.Exception);
        }

        return await _productAccountTaskRepository
            .UpdateWeldingMaterialInfoAsync(request.Id, request.WeldingMaterial, request.WeldingMaterialBatchNumber);
    }
}