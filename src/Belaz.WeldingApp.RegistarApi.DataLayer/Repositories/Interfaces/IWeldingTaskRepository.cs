using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWeldingTaskRepository
{
    Task<List<WeldingTaskDto>> GetAllTasksByDateEquipmentAndWelderRfidTagAsync(
        DateTime date,
        string equipmentRfid,
        string welderRfid
    );

    Task MarkWeldingTaskAsCompletedAsync(Guid id);

    Task UpdateWeldingTaskStatusAsync(Guid id, Guid welderId, WeldingTaskStatus status);

    Task<WeldingTaskDto> GetTaskByIdAsync(Guid id);
}
