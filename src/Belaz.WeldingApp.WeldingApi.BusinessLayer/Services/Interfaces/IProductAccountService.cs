using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IProductAccountService
{
    Task<Result<List<string>>> GetAllDatesByProductionAreaAsync(ProductionAreaIdRequest request);

    Task<Result<List<ProductAccountDto>>> GetAllByDateAsync(
        GetAllProductAccountsByDateRequest request
    );

    Task<Result<ProductAccountDto>> ChangeManufacturedAmountAsync(
        ChangeProductAccountAmountRequest request
    );

    Task<Result<ProductAccountDto>> ChangAcceptedAmountAsync(
        ChangeProductAccountAcceptedAmountRequest request
    );

    Task<Result<ProductAccountDto>> ChangAmountFromPlanAsync(
        ChangeProductAccountAmountRequest request
    );

    Task<Result<Unit>> AssignProductAccountToWeldingEquipmentsAsync(
        AssignProductAccountToWeldingEquipmentsRequest request
    );

    Task<Result<Unit>> GenerateTasksAsync(GenerateTasksRequest request);

    Task<Result<List<ProductAccountDto>>> ChangeOrderAsync(ChangeOrderRequest request);

    Task<Result<List<ProductAccountDto>>> GenerateByDateAsync(
        GenerateProductAccountsByDateRequest request
    );

    Task<Result<List<ProductAccountDto>>> GenerateEmptyAsync(
        GenerateProductAccountsEmptyRequest request
    );

    Task<Result<ProductAccountDto>> SetProductAccountDefectiveReasonAsync(
        SetProductAccountDefectiveReasonRequest request
    );

    Task<Result<ProductAccountDto>> AddProductAccountAsync(AddProductAccountRequest request);

    Task<Result<ProductAccountDto>> SetUniqueNumberAsync(SetUniqueNumberForProductRequest request);

    Task<Result<Unit>> RemoveProductAccountAsync(RemoveProductAccountRequest request);

    Task<Result<ProductAccountDto>> EditProductAccountAsync(EditProductAccountRequest request);

    Task<Result<ProductAccountDto>> ChangeEndWeldingDateAsync(ChangeEndWeldingDateRequest request);

    Task<Result<ProductAccountDto>> ChangeDefectiveAmountAsync(ChangeDefectiveAmountRequest request);

    Task<Result<List<ProductTaskDto>>> GetAllProductAccountTasksAsync();
}