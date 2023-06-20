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

    public async Task<Guid?> GetMasterIdByWeldingTaskIdAsync(Guid weldingTaskId)
    {
        var weldingTask = (await _context.WeldingTasks
            .FirstOrDefaultAsync(_ => _.Id == weldingTaskId))!;

        return weldingTask.MasterId;
    }

    public async Task<string?> GetMasterEmailByIdAsync(Guid id)
    {
        var master = (await _context.Masters
            .Include(_ => _.UserInfo)
            .FirstOrDefaultAsync(_ => _.Id == id))!;

        return master.UserInfo.Email;
    }
}