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

    public async Task<Guid?> GetMasterIdByEquipmentIdAsync(Guid equipmentId)
    {
        var weldingEquipment = (await _context.WeldingEquipments
            .FirstOrDefaultAsync(_ => _.Id == equipmentId))!;

        return weldingEquipment.MasterId;
    }
}