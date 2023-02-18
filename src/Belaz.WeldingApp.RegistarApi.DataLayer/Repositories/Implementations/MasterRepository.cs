using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class MasterRepository : IMasterRepository
{
    private readonly ApplicationContext _context;

    public MasterRepository(ApplicationContext context)
    {
        _context = context;
    }

    public async Task<Guid> GetMasterIdByWelderIdAsync(Guid welderId)
    {
        var productionArea = (await _context.Welders
                .Include(_ => _.UserInfo)
                .ThenInclude(_ => _.ProductionArea)
                .FirstOrDefaultAsync(_ => _.Id == welderId))!
            .UserInfo.ProductionArea!;

        var master = (await _context.Masters
            .FirstOrDefaultAsync(_ => _.UserInfo.ProductionArea!.Id == productionArea.Id))!;

        return master.Id;
    }
}