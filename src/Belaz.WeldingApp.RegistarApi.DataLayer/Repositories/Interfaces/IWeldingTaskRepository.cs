using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWeldingTaskRepository
{
    Task<List<WeldingTaskDto>> GetAllTasksByDateAndEquipmentRfidTagAsync(
        DateTime date,
        string equipmentRfidTag
    );
}
