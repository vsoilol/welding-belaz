using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWeldingTaskRepository
{
    Task<List<WeldingTaskDto>> GetAllTasksByDateAndEquipmentRfidTagAsync(
        DateTime date,
        string equipmentRfidTag
    );

    Task MarkWeldingTaskAsCompletedAsync(Guid id, Guid welderId);

    Task ChangeWeldingTaskStatusAsync(Guid id, WeldingTaskStatus status);
}
