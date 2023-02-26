using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ProductAccountRepository : IProductAccountRepository
{
    public Task<List<string>> GetAllDatesByProductionAreaAsync(Guid productionAreaId)
    {
        throw new NotImplementedException();
    }
}
