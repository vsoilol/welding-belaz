namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductAccountRepository
{
    Task<List<string>> GetAllDatesByProductionAreaAsync(Guid productionAreaId);
}
