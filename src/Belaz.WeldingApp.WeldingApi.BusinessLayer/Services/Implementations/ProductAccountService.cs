using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
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
