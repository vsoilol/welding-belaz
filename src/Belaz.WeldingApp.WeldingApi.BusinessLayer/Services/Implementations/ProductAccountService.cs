using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ProductAccountService : IProductAccountService
{
    private readonly IValidationService _validationService;

    private readonly IProductAccountRepository _productAccountRepository;

    public ProductAccountService(
        IValidationService validationService,
        IProductAccountRepository productAccountRepository
    )
    {
        _validationService = validationService;
        _productAccountRepository = productAccountRepository;
    }

    public async Task<Result<Unit>> AssignProductAccountToWeldersAsync(
        AssignProductAccountToWeldersRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _productAccountRepository.AssignProductAccountToWeldersAsync(
                request.ProductAccountId,
                request.WelderIds
            );
            return Unit.Default;
        });
    }

    public async Task<Result<ProductAccountDto>> ChangAmountFromPlanAsync(
        ChangeProductAccountAmountRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(
            () => _productAccountRepository.ChangAmountFromPlanAsync(request.Id, request.Amount)
        );
    }

    public async Task<Result<ProductAccountDto>> ChangeManufacturedAmountAsync(
        ChangeProductAccountAmountRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(
            () =>
                _productAccountRepository.ChangeManufacturedAmountAsync(request.Id, request.Amount)
        );
    }

    public async Task<Result<Unit>> GenerateTasksAsync(GenerateTasksRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var date = request.Date.ToDateTime();

            await _productAccountRepository.GenerateTasksAsync(
                date,
                request.ProductionAreaId,
                request.UserId
            );
            return Unit.Default;
        });
    }

    public async Task<Result<List<ProductAccountDto>>> GetAllByDateAsync(
        GetAllProductAccountsByDateRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var date = request.Date.ToDateTime();

            return _productAccountRepository.GetAllByDateAsync(date, request.ProductionAreaId);
        });
    }

    public async Task<Result<List<string>>> GetAllDatesByProductionAreaAsync(
        ProductionAreaIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(
            () =>
                _productAccountRepository.GetAllDatesByProductionAreaAsync(request.ProductionAreaId)
        );
    }
}
