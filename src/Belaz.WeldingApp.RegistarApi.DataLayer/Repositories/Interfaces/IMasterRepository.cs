namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IMasterRepository
{
    Task<Guid?> GetMasterIdByEquipmentIdAsync(Guid equipmentId);
    
    Task<Guid?> GetMasterIdByWeldingTaskIdAsync(Guid weldingTaskId);

    Task<string?> GetMasterEmailByIdAsync(Guid id);
}