using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWeldingEquipmentRepository
{
    Task<List<WeldingEquipmentDto>> GetAllAsync();
}