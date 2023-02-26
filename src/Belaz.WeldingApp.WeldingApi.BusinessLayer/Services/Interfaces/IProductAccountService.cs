using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IProductAccountService
{
    Task<Result<List<string>>> GetAllDatesByProductionAreaAsync(ProductionAreaIdRequest request);
}
