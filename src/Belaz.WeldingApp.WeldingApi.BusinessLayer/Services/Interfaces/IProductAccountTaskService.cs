using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IProductAccountTaskService
{
    Task<List<ProductAccountTaskDto>> GetAllProductAccountTasksAsync();

    Task<Result<Unit>> AssignProductAccountTaskToWeldingEquipmentsAsync(
        AssignProductAccountTaskToWeldingEquipmentsRequest request
    );

    Task<Result<ProductAccountTaskDto>> ChangeEndWeldingDateAsync(
        ChangeEndWeldingDateRequest request
    );

    Task<Result<ProductAccountTaskDto>> ChangeDefectiveAmountAsync(ChangeDefectiveAmountRequest request);

    Task<Result<ProductAccountTaskDto>> ChangeManufacturedAmountAsync(
        ChangeManufacturedAmountRequest request
    );

    Task<Result<ProductAccountTaskDto>> UpdateWeldingMaterialInfoAsync(UpdateWeldingMaterialInfoRequest request);
}